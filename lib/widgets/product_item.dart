// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:shop_app_provider/screens/product_details_screen.dart';

class ProductItem extends StatelessWidget {
  // const ProductItem({ Key? key }) : super(key: key);

  final String? id;
  final String? title;
  final String? imageUrl;

  ProductItem({this.id, this.title, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProductDetailScreen.routeName,
          arguments: id,
        );
      },
      child: GridTile(
        child: Image.network(
          imageUrl.toString(),
          fit: BoxFit.cover,
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black.withOpacity(0.4),
          leading: Icon(
            Icons.heart_broken,
            color: Colors.red,
          ),
          title: Text(
            title.toString(),
            textAlign: TextAlign.center,
          ),
          trailing: Icon(Icons.shop),
        ),
      ),
    );
  }
}
