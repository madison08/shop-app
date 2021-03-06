import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/cart.dart';
import 'providers/orders.dart';
import 'package:shop_app_provider/screens/cart_screen.dart';
import 'screens/edite_product_screen.dart';
import 'screens/orders_screen.dart';
import 'screens/products_view_screen.dart';

import 'screens/user_product_screen.dart';

import './providers/product_provider.dart';

import './screens/product_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Products(),
        ),
        ChangeNotifierProvider(
          create: (_) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (_) => Orders(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: ProductScren(),
        routes: {
          '/': (context) => ProductScren(),
          ProductDetailScreen.routeName: (context) => ProductDetailScreen(),
          '/cart': (context) => CartScreen(),
          '/orders': (context) => OrderScreen(),
          '/product-mange': (context) => UserProductsScreen(),
          '/edit-product': (context) => EditProductScreen(),
        },
      ),
    );
  }
}
