import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:shop_app_provider/providers/orders.dart' as ord;

class OrderItemWi extends StatefulWidget {
  final ord.OrderItem order;

  OrderItemWi(this.order);

  @override
  State<OrderItemWi> createState() => _OrderItemWiState();
}

class _OrderItemWiState extends State<OrderItemWi> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
          children: [
            ListTile(
              title: Text("${widget.order.amount}"),
              subtitle: Text(widget.order.dateTime.toString()),
              trailing: IconButton(
                  onPressed: () {
                    setState(() {
                      expanded = !expanded;
                    });
                  },
                  icon: Icon(expanded ? Icons.expand_less : Icons.expand_more)),
            ),
            expanded
                ? Container(
                    height: 100.0,
                    // color: Colors.red,
                    child: ListView(
                      children: widget.order.products
                          .map((prod) => Row(
                                children: [
                                  Text(prod.title),
                                  Text("${prod.quantity} x \$ ${prod.price}"),
                                ],
                              ))
                          .toList(),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
