// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_provider/providers/cart.dart';

class CartItemS extends StatelessWidget {
  final String? id;
  final String? title;
  final int quantity;
  final double? price;

  CartItemS({this.id, this.title, required this.quantity, this.price});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        child: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
        ),
      ),
      confirmDismiss: (direction) {
        return showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => AlertDialog(
                  title: Text("Are you sure ?"),
                  content: Text("Do you want to remove item from the cart ?"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(false);
                      },
                      child: Text("no"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop(true);
                        Provider.of<Cart>(context, listen: false)
                            .removeCart(id);
                      },
                      child: Text("yes"),
                    ),
                  ],
                ));
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(
              title.toString(),
            ),
            subtitle: Text(
              "price: ${double.parse(price.toString()) * quantity}",
            ),
            leading: Text(price.toString()),
            trailing: Text("* $quantity"),
          ),
        ),
      ),
    );
  }
}
