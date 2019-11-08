import 'package:flutter/material.dart';

//import 'package:amap_base/amap_base.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:oktoast/oktoast.dart';

class NextCart extends StatefulWidget {
  _NextCartState createState() => _NextCartState();
}

class _NextCartState extends State<NextCart> {
//  AMapController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text('子页面')),
        body: Container(
          child: Flex(
            direction: Axis.horizontal,
            children: <Widget>[
              Expanded(child: Text('哈哈哈哈'), flex: 1),
              Expanded(
                flex: 2,
                child: EasyRefresh(
                  child: ListView(
                    children: <Widget>[
                      Container(
                        child: Text('哈哈222'),
                      )
                    ],
                  ),
                  onRefresh: () async {
                    showToast(
                      '下拉刷新',
                      duration: Duration(seconds: 2),
                      backgroundColor: Colors.black.withOpacity(0.5),
                      position: ToastPosition.bottom,
                      radius: 12.0,
                    );
                  },
                  onLoad: () async {
                    showToast(
                      '上拉加载',
                      duration: Duration(seconds: 2),
                      backgroundColor: Colors.black.withOpacity(0.5),
                      position: ToastPosition.bottom,
                      radius: 12.0,
                    );
                  },
                ),
              )
            ],
          ),
        ),
//        body: AMapView(
//          onAMapViewCreated: (controller) {
//            _controller = controller;
//          },
//          amapOptions: AMapOptions(
//            compassEnabled: false,
//            zoomControlsEnabled: true,
//            logoPosition: LOGO_POSITION_BOTTOM_CENTER,
//            camera: CameraPosition(
//              target: LatLng(41.851827, 112.801637),
//              zoom: 4,
//            ),
//          ),
//        ),
      ),
    );
  }
}
