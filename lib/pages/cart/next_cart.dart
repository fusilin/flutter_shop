import 'package:flutter/material.dart';
//import 'package:amap_base/amap_base.dart';

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
