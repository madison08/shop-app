// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_provider/providers/product_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String? id;
  // final String? title;
  // final String? imageUrl;

  // ProductDetailScreen({this.id, this.title, this.imageUrl});

  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;

    final product = Provider.of<Products>(
      context,
    ).findById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text('hy'),
      ),
      body: Container(
        height: 200.0,
        width: MediaQuery.of(context).size.width,
        // color: Colors.red,
        child: Text(
          product.title.toString(),
        ),
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            product.imageUrl.toString(),
          ),
        )),
      ),
    );
  }
}
