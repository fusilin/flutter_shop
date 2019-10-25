import 'package:flutter/material.dart';
import 'package:flutter_shop/provider/counter_model.dart';
import 'package:provider/provider.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_shop/routers/routes.dart';

class MemberPage extends StatefulWidget {
  _MemberPageState createState() => _MemberPageState();
}

class _MemberPageState extends State<MemberPage> {
  @override
  initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('会员中心'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text('${Provider.of<CounterModel>(context).count}'),
              RaisedButton(
                onPressed: () {
                  Routes.router
                      .navigateTo(
                          context, '${Routes.nextCategory}?todo=testTODO',
//                    transition: TransitionType.inFromRight,
                          transition: TransitionType.cupertino)
                      .then((result) {
                    print('------:' + result);
                  });
                },
                child: Text('进入子页'),
              ),
            ],
          ),
        ),
        floatingActionButton: //使用Consumer包裹
            Consumer<CounterModel>(
                builder: (ctx, state, child) => FloatingActionButton(
                      onPressed: () {
                        state.add(); //使用其内的state执行方法
                      },
                      child: Icon(Icons.add),
                    )),
      ),
    );
  }
}
