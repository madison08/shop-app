import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_provider/providers/product_provider.dart';
import 'package:shop_app_provider/widgets/userProductItem.dart';

class UserProductsScreen extends StatelessWidget {
  const UserProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<Products>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your product"),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: productData.getItems.length,
            itemBuilder: (context, index) {
              return UserProductItem(
                productTitle: productData.getItems[index].title,
                productUrl: productData.getItems[index].imageUrl,
              );
            }),
      ),
    );
  }
}