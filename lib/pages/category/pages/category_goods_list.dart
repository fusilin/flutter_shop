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

class CategoryGoodsList extends StatefulWidget {
  _CategoryGoodsListState createState() => _CategoryGoodsListState();
}

class _CategoryGoodsListState extends State<CategoryGoodsList> {
  final scrollController = new ScrollController();
  final easyRefreshController = new EasyRefreshController();

  @override
  void initState() {
    super.initState();
  }

  _fetchData({bool isRefresh}) async {
    var categoryGoodsListProvider =
        Provider.of<CategoryGoodsListProvider>(context);
    var _categoryId = categoryGoodsListProvider.categoryId;
    List _list = categoryGoodsListProvider.goodsList;
    int _page = isRefresh ? 1 : categoryGoodsListProvider.page;
    bool _isLoading = categoryGoodsListProvider.isLoading;
    if (_categoryId != null && _isLoading) {
      return null;
    }
    categoryGoodsListProvider.setGoodsListIsLoading(true);
    var params = {
      'categoryId': _categoryId,
      'categorySubId': '',
      'page': isRefresh ? _page : _page++
    };
    await request('getMallGoods', formData: params).then((result) {
      var data = json.decode(result.toString());
      if (result.statusCode == 200) {
        CategoryGoodsListModel goodsList =
            CategoryGoodsListModel.fromJson(data);
        if (_categoryId == null) {
          _list = goodsList.data;
        } else {
          _list.addAll(goodsList.data);
        }

        easyRefreshController.finishRefresh(success: true, noMore: false);
        easyRefreshController.finishLoad(success: true, noMore: false);
        categoryGoodsListProvider.getGoodsList(
            _list, _categoryId, _page++, false, 'success');
      } else {
        categoryGoodsListProvider.setGoodsListPageStatus('error');
      }
    });
  }

  @override
  didChangeDependencies() {
    super.didChangeDependencies();
    try {
      if (Provider.of<CategoryGoodsListProvider>(context).page == 1) {
        scrollController.jumpTo(0.0);
      }
    } catch (e) {
      print('进入页面第一次初始化：${e}');
    }
  }

  Widget _listWidget(list, index) {
    return InkWell(
      onTap: () {},
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
                      controller: scrollController,
                      itemCount: data.goodsList.length,
                      itemBuilder: (context, index) {
                        return _listWidget(data.goodsList, index);
                      },
                    ),
                    onRefresh: () async {
                      _fetchData(isRefresh: true);
                    },
                    enableControlFinishRefresh: true,
                    onLoad: () async {
                      _fetchData(isRefresh: false);
                    },
                  ));
      } else {
        return Center(child: Text('没有数据'));
      }
    });
  }
}
