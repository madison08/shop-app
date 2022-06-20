import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_provider/providers/product_provider.dart';
import 'package:shop_app_provider/widgets/appDrawer.dart';
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
            onPressed: () {
              Navigator.pushNamed(context, "/edit-product");
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      drawer: AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
            itemCount: productData.getItems.length,
            itemBuilder: (context, index) {
              return UserProductItem(
                id: productData.getItems[index].id,
                productTitle: productData.getItems[index].title,
                productUrl: productData.getItems[index].imageUrl,
              );
            }),
      ),
    );
  }
}
