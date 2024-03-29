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

    Future<void> _refreshProducts(context) async {
      await Provider.of<Products>(context, listen: false).fetchAndSetProducts();
    }

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
      body: RefreshIndicator(
        onRefresh: () => _refreshProducts(context),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              itemCount: productData.getItems.length,
              itemBuilder: (context, index) {
                // print("id");
                // print(productData.getItems[index].id.toString());
                return UserProductItem(
                  id: productData.getItems[index].id.toString(),
                  productTitle: productData.getItems[index].title,
                  productUrl: productData.getItems[index].imageUrl,
                );
              }),
        ),
      ),
    );
  }
}
