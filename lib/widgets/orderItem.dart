import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:shop_app_provider/providers/orders.dart' as ord;

class OrderItemWi extends StatelessWidget {
  final ord.OrderItem order;

  OrderItemWi(this.order);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: ListTile(
          title: Text("${order.amount}"),
          subtitle: Text(order.dateTime.toString()),
          trailing: IconButton(onPressed: () {}, icon: Icon(Icons.expand_more)),
        ),
      ),
    );
  }
}
