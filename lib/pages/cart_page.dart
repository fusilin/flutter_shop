import 'package:flutter/material.dart';
import '../provider/counter_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Text('父页面')),
        body: Consumer<CounterModel>(builder: (context, counter, _) {
          return Text(
            'Value: ${counter.count}',
          );
        }),
        floatingActionButton:
            Consumer<CounterModel>(
                builder: (context, counter, child) {
          return FloatingActionButton(
              heroTag: 'cart_page',
              onPressed: () {
                counter.add();
              },
              child: Icon(Icons.add));
        }),
      ),
    );
  }
}
