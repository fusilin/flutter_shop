import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/counter_model.dart';

class NextCategory extends StatelessWidget {
  final todo;

  NextCategory({Key key, this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text('子页面')),
//        body: Text('${Provider.of<CounterModel>(context).count}'),
//        floatingActionButton: FloatingActionButton(
//            onPressed: () {
//              Provider.of<CounterModel>(context).add();
//            },
//            child: Icon(Icons.add)),
        body: Consumer<CounterModel>(builder: (context, counter, _) {
          print('-------111111-------');
          return Text(
            'Value: ${counter.count}',
          );
        }),
        floatingActionButton:
            Consumer<CounterModel>(builder: (context, counter, child) {
          return FloatingActionButton(
              heroTag: 'next_category',
              onPressed: () {
                counter.add();
              },
              child: Icon(Icons.add));
        }),
      ),
    );
  }
}
