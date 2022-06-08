// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_provider/providers/cart.dart';
import 'package:shop_app_provider/widgets/cartItem.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Total",
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      cart.totalAmount.toString(),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Order now",
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: cart.items.length,
                itemBuilder: (context, index) => CartItemS(
                      id: cart.items.values.toList()[index].id,
                      title: cart.items.values.toList()[index].title,
                      quantity: cart.items.values.toList()[index].quantity,
                      price: cart.items.values.toList()[index].price,
                    )),
          ),
        ],
      ),
    );
  }
}
