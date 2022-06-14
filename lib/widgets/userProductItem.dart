import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_provider/providers/product_provider.dart';

class UserProductItem extends StatelessWidget {
  String id;
  String productTitle;
  String productUrl;

  UserProductItem(
      {required this.id, required this.productUrl, required this.productTitle});

  @override
  Widget build(BuildContext context) {
    var productProvider = Provider.of<Products>(context);

    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(productUrl),
        ),
        title: Text(productTitle),
        trailing: SizedBox(
          width: 100.0,
          child: Row(
            children: <Widget>[
              IconButton(
                onPressed: () {
                  print("hello");
                  Navigator.pushNamed(context, "/edit-product");
                },
                icon: Icon(
                  Icons.edit,
                ),
              ),
              IconButton(
                onPressed: () {
                  print("is delete");
                  productProvider.deleteProduct(id);
                },
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
