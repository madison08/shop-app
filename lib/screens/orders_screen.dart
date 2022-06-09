import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_provider/providers/orders.dart';
import 'package:shop_app_provider/widgets/appDrawer.dart';
import 'package:shop_app_provider/widgets/orderItem.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Orders>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("your orders"),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: orders.orders.length,
        itemBuilder: (context, index) {
          return OrderItemWi(orders.orders[index]);
        },
      ),
    );
  }
}
