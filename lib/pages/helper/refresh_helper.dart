import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter/material.dart';

class RefreshHelper {
  static ClassicalHeader header = ClassicalHeader(
    key: Key('categoryGoodsListHeader'),
    refreshText: '下拉刷新',
    refreshReadyText: '释放开始刷新',
    refreshingText: '正在刷新...',
    refreshedText: '刷新成功',
    refreshFailedText: '刷新失败',
    showInfo: false,
  );
  static ClassicalFooter footer = ClassicalFooter(
    key: Key('categoryGoodsListFooter'),
    noMoreText: '没有更多数据',
    loadText: '上拉加载',
    loadReadyText: '释放开始加载',
    loadingText: '正在加载...',
    loadedText: '加载成功',
    loadFailedText: '加载失败',
    showInfo: false,
  );
}
