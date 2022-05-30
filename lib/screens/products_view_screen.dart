// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_provider/providers/product.dart';
import 'package:shop_app_provider/providers/product_provider.dart';
import 'package:shop_app_provider/widgets/product_list.dart';

enum FilterOptions {
  favorites,
  all,
}

class ProductScren extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productContainer = Provider.of<Products>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('my shop app'),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              switch (value) {
                case FilterOptions.favorites:
                  productContainer.showFavorite();
                  print("favorites");
                  break;
                case FilterOptions.all:
                  print("all");
                  productContainer.showAll();
              }
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: FilterOptions.favorites,
                child: Text(
                  "Only favorites",
                ),
              ),
              PopupMenuItem(
                value: FilterOptions.all,
                child: Text(
                  "Show all",
                ),
              )
            ],
          )
        ],
      ),
      body: ProductGrid(),
    );
  }
}
