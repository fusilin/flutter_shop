import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/service/service_method.dart';
import 'dart:convert';
import 'package:flutter_shop/provider/child_category.dart';
import 'package:flutter_shop/provider/category_goods_list.dart';
import 'package:provider/provider.dart';
import 'package:flutter_shop/model/categoryGoodsList.dart';
import 'package:flutter_shop/constant/color_constant.dart';

class LeftCategoryNav extends StatefulWidget {
  final List list;

  LeftCategoryNav({Key key, this.list}) : super(key: key);

  _LeftCategoryNavState createState() => _LeftCategoryNavState();
}

class _LeftCategoryNavState extends State<LeftCategoryNav> {
  var pageStatus = 'loading';

  int listIndex = 0; // 索引

  @override
  void initState() {
    super.initState();
  }

  _getGoodList({context, String categoryId}) async {
    var categoryGoodsListProvider =
        Provider.of<CategoryGoodsListProvider>(context);
    categoryGoodsListProvider.getGoodList(context, categoryId);
//    categoryGoodsListProvider.setGoodsListPageStatus('loading');
//    var _categoryId = categoryId ?? categoryGoodsListProvider.categoryId;
//    var _categorySubId = '';
//    var params = {
//      'categoryId': _categoryId,
//      'categorySubId': _categorySubId,
//      'page': 1
//    };
//    await request('getMallGoods', formData: params).then((result) {
//      var data = json.decode(result.toString());
//      if (result.statusCode == 200) {
//        CategoryGoodsListModel goodsList =
//            CategoryGoodsListModel.fromJson(data);
//        categoryGoodsListProvider.setCategoryGoodsList(
//            goodsList.data, _categoryId, _categorySubId, 1);
//        categoryGoodsListProvider.setGoodsListPageStatus('success');
//      } else {
//        categoryGoodsListProvider.setGoodsListPageStatus('error');
//      }
//categoryGoodsListProvider.setCategoryGoods(isLoading: false);
//    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(180),
      decoration: BoxDecoration(
          border: Border(
        right: BorderSide(width: 1, color: Colors.black12),
      )),
      child: ListView.builder(
          itemCount: widget.list.length,
          itemBuilder: (context, index) {
            return _leftInkWel(index);
          }),
    );
  }

  Widget _leftInkWel(int index) {
    return Consumer2<ChildCategory, CategoryGoodsListProvider>(
        builder: (context, data1, data2, child) {
      return InkWell(
        onTap: () {
          var categoryId = widget.list[index].mallCategoryId;
          var categoryGoodsListProvider =
              Provider.of<CategoryGoodsListProvider>(context);
          var _categoryId = categoryGoodsListProvider.categoryId;
          if (categoryId == _categoryId) {
            return null;
          }
          var childList = widget.list[index].bxMallSubDto;
          setState(() {
            listIndex = index;
          });
          data1.getChildCategory(childList);
          _getGoodList(context: context, categoryId: categoryId);
        },
        child: Container(
          height: ScreenUtil().setHeight(100),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white,
              border:
                  Border(bottom: BorderSide(width: 1, color: Colors.black12))),
          child: Text(
            widget.list.length != 0 ? widget.list[index].mallCategoryName : '',
            style: TextStyle(
                fontSize: ScreenUtil().setSp(28),
                color: listIndex == index
                    ? ColorConstant.theme
                    : ColorConstant.black),
          ),
        ),
      );
    });
  }
}
