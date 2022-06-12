import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class UserProductItem extends StatelessWidget {
  String productTitle;
  String productUrl;

  UserProductItem({required this.productUrl, required this.productTitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(productTitle),
        trailing: SizedBox(
          width: 100.0,
          child: Row(
            children: <Widget>[
              IconButton(
                onPressed: () {
                  print("hello");
                },
                icon: Icon(
                  Icons.edit,
                ),
              ),
              IconButton(
                onPressed: () {
                  print("hello");
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
