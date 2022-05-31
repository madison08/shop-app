// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_provider/providers/cart.dart';
import 'package:shop_app_provider/providers/product.dart';
import 'package:shop_app_provider/providers/product_provider.dart';
import 'package:shop_app_provider/screens/product_details_screen.dart';

class ProductItem extends StatelessWidget {
  // const ProductItem({ Key? key }) : super(key: key);

  final String? id;
  final String? title;
  final String? imageUrl;

  ProductItem({this.id, this.title, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductDetailScreen.routeName,
          arguments: product.id,
        );
      },
      child: GridTile(
        child: Image.network(
          product.imageUrl.toString(),
          fit: BoxFit.cover,
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black.withOpacity(0.4),
          leading: Consumer<Product>(
            builder: (context, product, _) => IconButton(
              icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border),
              color: Colors.red,
              onPressed: () {
                print("hello");
                product.toggleFavoriteStatus();
              },
            ),
          ),
          title: Text(
            product.title.toString(),
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            onPressed: () {
              print("hello");
              cart.addItem(product.id, product.price, product.title);
            },
            icon: Icon(Icons.shopping_cart),
          ),
        ),
      ),
    );
  }
}
