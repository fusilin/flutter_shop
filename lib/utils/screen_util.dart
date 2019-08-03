import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@override
Widget build(BuildContext context){
  ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
  
  return null;
}