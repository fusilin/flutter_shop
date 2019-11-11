import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/constant/color_constant.dart';
import 'package:flutter_shop/provider/category_goods_list.dart';
import 'package:provider/provider.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_shop/pages/helper/refresh_helper.dart';
import 'package:flutter_shop/service/service_method.dart';
import 'dart:convert';
import 'package:flutter_shop/model/categoryGoodsList.dart';
import 'package:flutter_shop/widget/loaders/loader.dart';
import 'package:flutter_shop/routers/fluro_navigator.dart';
import 'package:flutter_shop/pages/detail/detail_router.dart';

class CategoryGoodsList extends StatefulWidget {
  _CategoryGoodsListState createState() => _CategoryGoodsListState();
}

class _CategoryGoodsListState extends State<CategoryGoodsList> {
  ScrollController _scrollController = new ScrollController();
  final easyRefreshController = new EasyRefreshController();

  @override
  void initState() {
    super.initState();
  }

  _refreshData() async {
    var categoryGoodsListProvider =
        Provider.of<CategoryGoodsListProvider>(context);
    var _categoryId = categoryGoodsListProvider.categoryId;
    var _categorySubId = categoryGoodsListProvider.categorySubId;
    bool _isLoading = categoryGoodsListProvider.isLoading;
    if (_isLoading) {
      return null;
    }
    categoryGoodsListProvider.setCategoryGoods(isLoading: true);
    var params = {
      'categoryId': _categoryId,
      'categorySubId': _categorySubId,
      'page': 1
    };
    await request('getMallGoods', formData: params).then((result) {
      var data = json.decode(result.toString());
      if (result.statusCode == 200) {
        CategoryGoodsListModel goodsList =
            CategoryGoodsListModel.fromJson(data);
        List _list = goodsList.data ?? [];
        categoryGoodsListProvider.setCategoryGoodsList(
            _list, _categoryId, _categorySubId, 1);
        easyRefreshController.finishRefresh(success: true, noMore: false);
        categoryGoodsListProvider.setCategoryGoods(pageStatus: 'success');
      } else {
        categoryGoodsListProvider.setCategoryGoods(pageStatus: 'error');
        easyRefreshController.finishRefresh(success: false, noMore: false);
      }
      categoryGoodsListProvider.setCategoryGoods(isLoading: false);
    });
  }

  _loadData() async {
    var categoryGoodsListProvider =
        Provider.of<CategoryGoodsListProvider>(context);
    var _categoryId = categoryGoodsListProvider.categoryId;
    var _categorySubId = categoryGoodsListProvider.categorySubId;
    List _list = categoryGoodsListProvider.goodsList;
    int _page = categoryGoodsListProvider.page;
    bool _isLoading = categoryGoodsListProvider.isLoading;
    if (_isLoading) {
      return null;
    }
    categoryGoodsListProvider.setCategoryGoods(isLoading: true);
    var params = {
      'categoryId': _categoryId,
      'categorySubId': _categorySubId,
      'page': _page + 1
    };
    print(444444);
    print(params);
    await request('getMallGoods', formData: params).then((result) {
      var data = json.decode(result.toString());
      if (result.statusCode == 200) {
        CategoryGoodsListModel goodsList =
            CategoryGoodsListModel.fromJson(data);
        var _data = goodsList.data ?? [];
        _list.addAll(_data);
        categoryGoodsListProvider.setCategoryGoodsList(_list, _categoryId,
            _categorySubId, _data.length == 0 ? _page : _page + 1);
        easyRefreshController.finishLoad(
            success: true, noMore: _data.length == 0 ? true : false);
        categoryGoodsListProvider.setCategoryGoods(pageStatus: 'success');
      } else {
        easyRefreshController.finishLoad(success: false, noMore: false);
        categoryGoodsListProvider.setCategoryGoods(pageStatus: 'error');
      }
      categoryGoodsListProvider.setCategoryGoods(isLoading: false);
    });
  }

  @override
  didChangeDependencies() {
    super.didChangeDependencies();
//    try {
//      if (Provider.of<CategoryGoodsListProvider>(context).page == 1 &&
//          _scrollController != null &&
//          _scrollController.initialScrollOffset != 0.0) {
//        print(222211111);
//        _scrollController?.jumpTo(0.0);
//      }
//    } catch (e) {
//      print('CategoryGoodsList：${e}');
//    }
  }

  Widget _listWidget(list, index) {
    return InkWell(
      onTap: () {
        NavigatorUtils.push(context,
            DetailRouter.detailsPage + '?goodsId=${list[index].goodsId}');
      },
      child: Container(
        color: ColorConstant.white,
        child: Row(
          children: <Widget>[
            _goodsImage(list, index),
            Column(
              children: <Widget>[
                _goodsName(list, index),
                _goodsPrice(list, index)
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _goodsImage(list, index) {
    return Container(
        width: ScreenUtil().setWidth(200),
        child: Image.network(list[index].image));
  }

  Widget _goodsName(list, index) {
    return Container(
      width: ScreenUtil().setWidth(362.5),
      child: Text(
        list[index].goodsName,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
    );
  }

  Widget _goodsPrice(list, index) {
    return Container(
      width: ScreenUtil().setWidth(362.5),
      child: Row(
        children: <Widget>[
          Text('价格：￥${list[index].presentPrice}',
              style: TextStyle(
                  color: ColorConstant.theme,
                  fontSize: ScreenUtil().setSp(28.0))),
          Text(
            '￥${list[index].oriPrice}',
            style: TextStyle(decoration: TextDecoration.lineThrough),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
//    WidgetsBinding.instance.addPostFrameCallback((_) {
//      try {
//        if (Provider.of<CategoryGoodsListProvider>(context).page == 1 &&
//            _scrollController != null &&
//            _scrollController.jumpTo != null) {
//          print(222211111);
//          _scrollController.initialScrollOffset;
//        }
//      } catch (e) {
//        print('CategoryGoodsList：${e}');
//      }
//    });
    return Consumer<CategoryGoodsListProvider>(builder: (context, data, _) {
      if (data.goodsList.length > 0) {
        return Container(
            width: ScreenUtil().setWidth(570),
            child: data.pageStatus == 'loading'
                ? ColorLoader()
                : EasyRefresh(
                    controller: easyRefreshController,
                    header: RefreshHelper.header,
                    footer: RefreshHelper.footer,
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount: data.goodsList.length,
                      itemBuilder: (context, index) {
                        return _listWidget(data.goodsList, index);
                      },
                    ),
                    enableControlFinishRefresh: true,
                    onRefresh: () async {
                      _refreshData();
                    },
                    onLoad: () async {
                      _loadData();
                    },
                  ));
      } else {
        return Center(child: Text('没有数据'));
      }
    });
  }
}
