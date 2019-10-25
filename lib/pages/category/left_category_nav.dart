import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_shop/pages/member/category.dart';
import 'package:flutter_shop/service/service_method.dart';
import 'dart:convert';
import 'package:common_utils/common_utils.dart';
import 'package:flutter_shop/provider/child_category.dart';
import 'package:provider/provider.dart';

import 'package:flutter_shop/constant/color_constant.dart';

class LeftCategoryNav extends StatefulWidget {
  _LeftCategoryNavState createState() => _LeftCategoryNavState();
}

class _LeftCategoryNavState extends State<LeftCategoryNav> {
  List list = [];
  int listIndex = 0; // 索引

  @override
  void initState() {
    super.initState();
    _getCategory();
  }

  _getCategory() async {
    await request('getCategory').then((val) {
      var data = json.decode(val.toString());
      LogUtil.v(data);
      CategoryBigListModel category =
          CategoryBigListModel.formJson(data['data']);
      // 不生效
//      Consumer<ChildCategory>(builder: (context, childCategory, child) {
//        childCategory.getChildCategory(category.data[0].bxMallSubDto);
//      });
      Provider.of<ChildCategory>(context)
          .getChildCategory(category.data[0].bxMallSubDto);
      setState(() {
        list = category.data;
      });
    });
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
          itemCount: list.length,
          itemBuilder: (context, index) {
            return _leftInkWel(index);
          }),
    );
  }

  Widget _leftInkWel(int index) {
    return Consumer<ChildCategory>(builder: (context, childCategory, child) {
      return InkWell(
        onTap: () {
          var childList = list[index].bxMallSubDto;
          childCategory.getChildCategory(childList);
          setState(() {
            listIndex = index;
          });
        },
        child: Container(
          height: ScreenUtil().setHeight(100),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white,
              border:
                  Border(bottom: BorderSide(width: 1, color: Colors.black12))),
          child: Text(
            list.length != 0 ? list[index].mallCategoryName : '',
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
