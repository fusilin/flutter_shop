import 'package:flutter/material.dart';
import '../../service/service_method.dart';
import 'dart:convert';
import './category.dart';
import '../../provider/counter_model.dart';
import 'package:provider/provider.dart';
import './next_category.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter_shop/routers/routes.dart';

class CategoryPage extends StatefulWidget {
  _CategoryPage createState() => _CategoryPage();
}

class _CategoryPage extends State<CategoryPage> {
  int t = 2;

  @override
  initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print('-----categorypage-----didChangeDependencies-----');
    print(Provider.of<CounterModel>(context).count);
  }

  @override
  Widget build(BuildContext context) {
    print('-----CategoryPage------build-----');
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Test'),
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
                    transition: TransitionType.cupertino
                  )
                      .then((result) {
                    print('------:' + result);
                  });
//                  Navigator.of(context)
//                      .push(MaterialPageRoute(builder: (_) => NextCategory()));
                },
                child: Text('进入子页'),
              ),
              RaisedButton(
                onPressed: _getCategory,
                child: Text('请求数据'),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            heroTag: 'category_page',
            onPressed: () {
              Provider.of<CounterModel>(context).add();
            },
            child: Icon(Icons.add)),
//        floatingActionButton: //使用Consumer包裹
//        Consumer<CounterModel>(
//            builder: (ctx, state, child) => FloatingActionButton(
//              onPressed: () {
//                state.add(); //使用其内的state执行方法
//              },
//              child: Icon(Icons.add),
//            )),
      ),
    );
  }

  _getCategory() async {
    await request('getCategory').then((val) {
      var data = json.decode(val.toString());
      CategoryBigListModel list = CategoryBigListModel.formJson(data['data']);
      list.data.forEach((item) => {print(item.mallCategoryName)});
//      print('--------------------');
//      print(data);
    });
  }
}
