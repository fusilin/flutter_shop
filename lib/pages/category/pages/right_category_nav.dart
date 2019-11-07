import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_shop/provider/child_category.dart';
import 'package:oktoast/oktoast.dart';

class RightCategoryNav extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ChildCategory>(
      builder: (context, childCategory, _) {
        return Container(
          width: ScreenUtil().setWidth(570),
          height: ScreenUtil().setHeight(70),
//          alignment: Alignment.bottomCenter,
          child: ListView.builder(
              itemCount: childCategory.childCategoryList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return _rightInkWel(childCategory.childCategoryList.length == 0
                    ? null
                    : childCategory.childCategoryList[index]);
              }),
//          child: Wrap(
//            spacing: 10,
//            runSpacing: 2.0,
//            children: List.generate(
//                childCategory.childCategoryList.length,
//                (index) => _rightInkWel(
//                    childCategory.childCategoryList.length == 0
//                        ? null
//                        : childCategory.childCategoryList[index])),
//          ),
        );
      },
    );
  }

  Widget _rightInkWel(dynamic item) {
    return InkWell(
      onTap: () {
        showToast(
          item['mallSubName'],
          backgroundColor: Colors.black.withOpacity(0.5),
          position: ToastPosition.bottom,
          radius: 12.0,
        );
      },
      child: Container(
        padding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
        child: Text(
          item == null ? '' : item['mallSubName'],
          style: TextStyle(fontSize: ScreenUtil().setSp(28)),
        ),
      ),
    );
  }
}
