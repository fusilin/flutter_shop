import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_shop/provider/child_category.dart';
import 'dart:convert';
import 'package:flutter_shop/service/service_method.dart';
import 'package:flutter_shop/model/categoryGoodsList.dart';
import 'package:flutter_shop/provider/category_goods_list.dart';
import 'package:flutter_shop/constant/color_constant.dart';

class RightCategoryNav extends StatefulWidget {
  _RightCategoryNavState createState() => _RightCategoryNavState();
}

class _RightCategoryNavState extends State<RightCategoryNav> {
  ScrollController _scrollController = new ScrollController();

  void initState() {
    super.initState();
  }

  @override
  didChangeDependencies() {
    super.didChangeDependencies();
//    WidgetsBinding.instance.addPostFrameCallback((_) {
//      try {
////        _scrollController?.jumpTo(0.0);
////        _scrollController.initialScrollOffset;
//      } catch (e) {
//        print('-----RightCategoryNav------：${e}');
//      }
//    });
  }

  @override
  Widget build(BuildContext context) {
//    WidgetsBinding.instance.addPostFrameCallback((_) {
//      try {
//        _scrollController?.jumpTo(0.0);
//        _scrollController.initialScrollOffset;
//      } catch (e) {
//        print('RightCategoryNav：${e}');
//      }
//    });
    return Consumer2<ChildCategory, CategoryGoodsListProvider>(
      builder: (context, data1, data2, _) {
        return Container(
          width: ScreenUtil().setWidth(570),
          height: ScreenUtil().setHeight(70),
//          alignment: Alignment.bottomCenter,
          child: ListView.builder(
              controller: _scrollController,
              itemCount: data1.childCategoryList.length,
              scrollDirection: Axis.horizontal,
              cacheExtent: 2,
              itemBuilder: (context, index) {
                return _rightInkWel(
                    data1.childCategoryList.length == 0
                        ? null
                        : data1.childCategoryList[index],
                    data2.categorySubId,
                    context);
              }),
        );
      },
    );
  }

  _getGoodList({String categorySubId, BuildContext context}) async {
    var categoryGoodsListProvider =
        Provider.of<CategoryGoodsListProvider>(context);
    categoryGoodsListProvider.setCategoryGoods(pageStatus: 'loading');
    var _categoryId = categoryGoodsListProvider.categoryId;
    var params = {
      'categoryId': _categoryId,
      'categorySubId': categorySubId,
      'page': 1
    };
    await request('getMallGoods', formData: params).then((result) {
      var data = json.decode(result.toString());
      if (result.statusCode == 200) {
        CategoryGoodsListModel goodsList =
            CategoryGoodsListModel.fromJson(data);
        categoryGoodsListProvider.setCategoryGoodsList(
            goodsList.data, _categoryId, categorySubId, 1);
        categoryGoodsListProvider.setCategoryGoods(pageStatus: 'success');
      } else {
        categoryGoodsListProvider.setCategoryGoods(pageStatus: 'error');
      }
      categoryGoodsListProvider.setCategoryGoods(isLoading: false);
    });
  }

  Widget _rightInkWel(
      dynamic item, String categorySubId, BuildContext context) {
    return InkWell(
      onTap: () {
        _getGoodList(categorySubId: item['mallSubId'], context: context);
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
        child: Text(
          item == null ? '' : item['mallSubName'],
          style: TextStyle(
              fontSize: ScreenUtil().setSp(28),
              color: item['mallSubId'] == categorySubId
                  ? ColorConstant.theme
                  : Colors.black),
        ),
      ),
    );
  }
}
