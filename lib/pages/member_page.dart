import 'package:flutter/material.dart';
//import 'package:amap_base/amap_base.dart';

class MemberPage extends StatefulWidget {
//  @override
  _MemberPageState createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
//  AMapController _controller;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('会员中心')),
      body: Text(''),
    );
//    return Container(
//      child: Scaffold(
//        appBar: AppBar(title: Text('高德地图')),
//        body: AMapView(
//          onAMapViewCreated: (controller) {
//            _controller = controller;
//          },
//          amapOptions: AMapOptions(
//              compassEnabled: false,
//              zoomControlsEnabled: true,
//              logoPosition: LOGO_POSITION_BOTTOM_CENTER,
//              camera: CameraPosition(
//                  target: LatLng(41.851827, 112.801637), zoom: 4,)),
//        ),
//      ),
//    );
  }
}
