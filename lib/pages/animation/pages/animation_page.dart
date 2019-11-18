import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_shop/widget/index.dart' show ColorLoader;

class AnimationContainer extends StatelessWidget {
  final animation1;
  final animation2;
  final animation3;

  AnimationContainer({this.animation1, this.animation2, this.animation3})
      : super();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(left: animation3.value.toDouble()),
        height: animation1.value.toDouble() * 100,
        width: animation1.value.toDouble() * 100,
        color: animation2.value,
      ),
    );
  }
}

class AnimationPage extends StatefulWidget {
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with TickerProviderStateMixin {
  AnimationController animationController;
  Animation animation1;
  Animation animation2;
  Animation animation3;

  var _animationControllerListen;

  @override
  void initState() {
    super.initState();
    var widgetsBinding = WidgetsBinding.instance;
    _animationControllerListen = () {
      // 触发动画
      setState(() {});
    };
    widgetsBinding.addPostFrameCallback((_) {
      Future.delayed(Duration(milliseconds: 300), () {
        animationController =
            AnimationController(vsync: this, duration: Duration(seconds: 1));
        animation1 = Tween(begin: 0.0, end: 1.0).animate(animationController);
        animation2 = ColorTween(begin: Colors.yellow, end: Colors.red)
            .animate(animationController);

        animation3 = Tween(begin: 0.0, end: 200.0).animate(
            CurvedAnimation(parent: animationController, curve: Curves.linear));

        animationController.forward();
        animationController.addListener(_animationControllerListen);
      });
    });
  }

  @override
  dispose() {
    super.dispose();
    animationController.removeListener(_animationControllerListen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('动画'),
        elevation: 0,
      ),
      body: animationController == null
          ? ColorLoader()
          : RotationTransition(
              turns: animationController,
              child: AnimationContainer(
                  animation1: animation1,
                  animation2: animation2,
                  animation3: animation3),
            ),
    );
  }
}
