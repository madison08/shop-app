// ignore_for_file: prefer_final_fields

import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter/widgets.dart';
import 'product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    // Product(
    //   id: 'p1',
    //   title: 'Red Shirt',
    //   description: 'A red shirt - it is pretty red!',
    //   price: 29.99,
    //   imageUrl:
    //       'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    // ),
    // Product(
    //   id: 'p2',
    //   title: 'Trousers',
    //   description: 'A nice pair of trousers.',
    //   price: 59.99,
    //   imageUrl:
    //       'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    // ),
    // Product(
    //   id: 'p3',
    //   title: 'Yellow Scarf',
    //   description: 'Warm and cozy - exactly what you need for the winter.',
    //   price: 19.99,
    //   imageUrl:
    //       'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    // ),
    // Product(
    //   id: 'p4',
    //   title: 'A Pan',
    //   description: 'Prepare any meal you want.',
    //   price: 49.99,
    //   imageUrl:
    //       'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    // ),
  ];

  var _showFavoriteOnly = false;

  bool productLoading = false;

  List<Product> get getItems {
    if (_showFavoriteOnly) {
      return _items.where((element) => element.isFavorite).toList();
    }

    return [..._items];
  }

  List<Product> get getFovoritesItems {
    return _items.where((element) => element.isFavorite).toList();
  }

  // void showFavorite() {
  //   _showFavoriteOnly = true;

  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavoriteOnly = false;

  //   notifyListeners();
  // }

  Future<void> fetchAndSetProducts() async {
    productLoading = true;

    const url = 'https://flutterrev-default-rtdb.firebaseio.com/products.json';

    try {
      final response = await http.get(Uri.parse(url));
      // print(jsonDecode(response.body));

      // var respons = jsonDecode(response.body);
      // print("response after decode");
      // print(respons.runtimeType);

      final extractedData = json.decode(response.body) as Map<String, dynamic>;

      print("data extract");
      print(extractedData);

      final List<Product> loadedData = [];

      print("before add");

      extractedData.forEach((key, value) {
        // print("id: $key => value: $value");
        // print(value);

        loadedData.add(
          Product(
            id: key,
            title: value["title"],
            description: value["description"],
            price: value["price"],
            imageUrl: value["imageUrl"],
            isFavorite: value["isFavorite"],
          ),
        );
        print("after add");
      });

      _items = loadedData;

      productLoading = false;

      notifyListeners();

      print("my datasss");
      print(loadedData);
    } catch (err) {
      print(err);
    }

    // print(json.decode(response.body));
  }

  Future<void> addproduct(Product product) async {
    const url = "https://flutterrev-default-rtdb.firebaseio.com/products.json";

    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({
          'title': product.title,
          'description': product.description,
          'price': product.price,
          'imageUrl': product.imageUrl,
          'isFavorite': product.isFavorite,
        }),
      );

      final newProduct = Product(
        id: json.decode(response.body)['id'],
        title: product.title,
        description: product.description,
        imageUrl: product.imageUrl,
        price: product.price,
      );

      _items.add(newProduct);
    } catch (err) {
      print(err);
      throw err;
    }

    notifyListeners();

    // return Future.value();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  void deleteProduct(String id) {
    _items.removeWhere((prod) => prod.id == id);

    notifyListeners();
  }

  Future<void> updateProduct(String id, Product newProduct) async {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);

    print("prod index");
    print(prodIndex);

    if (prodIndex >= 0) {
      final url =
          "https://flutterrev-default-rtdb.firebaseio.com/products/$id.json";

      try {
        await http.patch(Uri.parse(url),
            body: json.encode({
              'title': newProduct.title,
              'description': newProduct.description,
              'imageUrl': newProduct.imageUrl,
            }));
      } catch (err) {
        print(err);
      }

      _items[prodIndex] = newProduct;

      notifyListeners();
    } else {
      print("...");
    }
  }
}
