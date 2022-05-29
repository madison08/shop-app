// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_provider/providers/product_provider.dart';

import '../widgets/product_item.dart';

class ProductGrid extends StatelessWidget {
  // const ProductGrid({
  //   Key? key,
  //   required this.loadedProoducts,
  // }) : super(key: key);

  // final List<Product> loadedProoducts;

  @override
  Widget build(BuildContext context) {
    final loadedProoducts = Provider.of<Products>(context).getItems;

    // print(loadedProoducts[0].id);

    return GridView.builder(
        padding: EdgeInsets.all(10.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.0,
          mainAxisSpacing: 15.0,
          crossAxisSpacing: 5.0,
        ),
        itemCount: loadedProoducts.length,
        itemBuilder: (context, index) {
          return ProductItem(
              id: loadedProoducts[index].id,
              title: loadedProoducts[index].title,
              imageUrl: loadedProoducts[index].imageUrl);
        });
  }
}
