// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shop_app_provider/widgets/product_list.dart';

class ProductScren extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('my shop app'),
      ),
      body: ProductGrid(),
    );
  }
}
