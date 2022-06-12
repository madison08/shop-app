import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text("Hello"),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.shop,
            ),
            title: Text("Shop"),
            onTap: () {
              Navigator.pushReplacementNamed(context, "/");
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.payment,
            ),
            title: Text("Orders"),
            onTap: () {
              Navigator.pushReplacementNamed(context, "/orders");
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.payment,
            ),
            title: Text("Manage Product"),
            onTap: () {
              Navigator.pushReplacementNamed(context, "/product-mange");
            },
          ),
        ],
      ),
    );
  }
}
