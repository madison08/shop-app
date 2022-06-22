import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_provider/providers/product.dart';
import 'package:shop_app_provider/providers/product_provider.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({Key? key}) : super(key: key);

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _imageUrlController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();

  var _initSate = true;

  var _initvalues = {
    'title': '',
    'description': '',
    'price': '',
    'imageUrl': '',
  };

  var editedProduct =
      Product(id: null, title: '', description: '', imageUrl: '', price: 0);

  @override
  void initState() {
    _imageUrlFocusNode.addListener(_updateImageurl);

    // editedProduct =
    //     Product(id: '', title: '', description: '', imageUrl: '', price: 50);

    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_initSate) {
      var productId = ModalRoute.of(context)?.settings.arguments;

      if (productId != null) {
        productId = productId as String;
        editedProduct =
            Provider.of<Products>(context, listen: false).findById(productId);

        print("produit a modifier");
        print(editedProduct.id);

        _initvalues = {
          'title': editedProduct.title,
          'description': editedProduct.description,
          'price': editedProduct.price.toString(),
          // 'imageUrl': product.imageUrl,
          'imageUrl': '',
        };

        _imageUrlController.text = editedProduct.imageUrl;
      }
    }

    _initSate = false;

    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _imageUrlFocusNode.removeListener(_updateImageurl);

    _imageUrlFocusNode.dispose();
    _imageUrlController.dispose();
  }

  void _updateImageurl() {
    if (!_imageUrlFocusNode.hasFocus) {
      print("NOT FOCUSED");
      if (_imageUrlController.text.isEmpty) {
        return;
      }
      setState(() {});
    }
  }

  void _savefrom() {
    // var editedProduct = Product(
    //     id: _id,
    //     title: _title,
    //     description: _description,
    //     imageUrl: _imageUrl,
    //     price: _price);

    final isValidate = _formKey.currentState?.validate();

    if (!isValidate!) {
      return;
    }

    _formKey.currentState?.save();

    print("Product ID");
    print(editedProduct.id);

    if (editedProduct.id != null) {
      Provider.of<Products>(context, listen: false)
          .updateProduct(editedProduct.id.toString(), editedProduct);
      print("update");
    } else {
      Provider.of<Products>(context, listen: false).addproduct(editedProduct);
      print("add");
    }

    Navigator.of(context).pop();

    // print(editedProduct.title);
    // print(editedProduct.description);
    // print(editedProduct.price);
    // print(editedProduct.imageUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit product"),
        actions: [
          IconButton(
            onPressed: _savefrom,
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
        ),
        child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Title',
                  ),
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter title";
                    }
                    return null;
                  },
                  initialValue: _initvalues["title"],
                  onSaved: (value) {
                    editedProduct = Product(
                      title: value.toString(),
                      description: editedProduct.description,
                      imageUrl: editedProduct.imageUrl,
                      price: editedProduct.price,
                      id: editedProduct.id,
                      isFavorite: editedProduct.isFavorite,
                    );
                  },
                  // initialValue: "mon titre",
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'price',
                  ),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  initialValue: _initvalues["price"],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter a price";
                    }
                    if (double.tryParse(value) == null) {
                      return "Please enter a valid number";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    // _price = ;

                    editedProduct = Product(
                      title: editedProduct.title,
                      description: editedProduct.description,
                      imageUrl: editedProduct.imageUrl,
                      price: double.parse(value.toString()),
                      id: editedProduct.id,
                      isFavorite: editedProduct.isFavorite,
                    );
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Description',
                  ),
                  maxLines: 3,
                  keyboardType: TextInputType.multiline,
                  // textInputAction: TextInputAction.next,
                  initialValue: _initvalues["description"],
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter a description";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    // _description = value.toString();

                    editedProduct = Product(
                      title: editedProduct.title,
                      description: value.toString(),
                      imageUrl: editedProduct.imageUrl,
                      price: editedProduct.price,
                      id: editedProduct.id,
                      isFavorite: editedProduct.isFavorite,
                    );
                  },
                ),
                Row(
                  // mainAxisAlignment: MainAxis,
                  children: <Widget>[
                    Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(),
                      child: _imageUrlController.text.isEmpty
                          ? Text("Enter image url")
                          : FittedBox(
                              child: Image.network(
                                _imageUrlController.text,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                    SizedBox(
                      width: 5.0,
                    ),
                    Container(
                      width: 200,
                      child: TextFormField(
                        decoration: InputDecoration(labelText: "Image url"),
                        keyboardType: TextInputType.url,
                        textInputAction: TextInputAction.done,
                        controller: _imageUrlController,
                        focusNode: _imageUrlFocusNode,
                        // initialValue: _initvalues["imageUrl"],
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter an image URL";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          editedProduct = Product(
                            title: editedProduct.title,
                            description: editedProduct.description,
                            imageUrl: value.toString(),
                            price: editedProduct.price,
                            id: editedProduct.id,
                            isFavorite: editedProduct.isFavorite,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
