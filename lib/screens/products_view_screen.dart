// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_provider/providers/cart.dart';
import 'package:shop_app_provider/widgets/badge.dart';
import '../providers/product.dart';
import '../providers/product_provider.dart';
import '../widgets/product_list.dart';

enum FilterOptions {
  favorites,
  all,
}

class ProductScren extends StatefulWidget {
  @override
  State<ProductScren> createState() => _ProductScrenState();
}

class _ProductScrenState extends State<ProductScren> {
  var _showFavorite = false;

  @override
  Widget build(BuildContext context) {
    final productContainer = Provider.of<Products>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('my shop app'),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              setState(() {
                if (value == FilterOptions.favorites) {
                  _showFavorite = true;
                } else {
                  _showFavorite = false;
                }
              });
              // switch (value) {
              //   case FilterOptions.favorites:
              //     // productContainer.showFavorite();
              //     print("favorites");
              //     break;
              //   case FilterOptions.all:
              //     print("all");
              //     // productContainer.showAll();
              // }
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
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cartProvider, __) => Badge(
              child: TextButton(
                onPressed: () {
                  print("he");
                },
                child: Icon(
                  Icons.shopping_cart,
                  size: 24,
                  color: Colors.white,
                ),
              ),
              value: cartProvider.getItemCount.toString(),
            ),
          ),
        ],
      ),
      body: ProductGrid(_showFavorite),
    );
  }
}
