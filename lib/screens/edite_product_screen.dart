import 'package:flutter/material.dart';
import 'package:shop_app_provider/providers/product.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({Key? key}) : super(key: key);

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _imageUrlController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();

  final _formKey = GlobalKey<FormState>();

  // var _id = '';
  // var _title = '';
  // var _description = '';
  // var _imageUrl = '';
  // var _price = 0.0;

  var editedProduct =
      Product(id: '', title: '', description: '', imageUrl: '', price: 0);

  @override
  void initState() {
    _imageUrlFocusNode.addListener(_updateImageurl);

    // TODO: implement initState
    super.initState();
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

    print(editedProduct.title);
    print(editedProduct.description);
    print(editedProduct.price);
    print(editedProduct.imageUrl);
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
                  onSaved: (value) {
                    editedProduct = Product(
                        id: editedProduct.id,
                        title: value.toString(),
                        description: editedProduct.description,
                        imageUrl: editedProduct.imageUrl,
                        price: editedProduct.price);
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'price',
                  ),
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
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
                        id: editedProduct.id,
                        title: editedProduct.title,
                        description: editedProduct.description,
                        imageUrl: editedProduct.imageUrl,
                        price: double.parse(value.toString()));
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Description',
                  ),
                  maxLines: 3,
                  keyboardType: TextInputType.multiline,
                  // textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter a description";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    // _description = value.toString();

                    editedProduct = Product(
                        id: editedProduct.id,
                        title: editedProduct.title,
                        description: value.toString(),
                        imageUrl: editedProduct.imageUrl,
                        price: editedProduct.price);
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
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Please enter an image URL";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          editedProduct = Product(
                              id: editedProduct.id,
                              title: editedProduct.title,
                              description: editedProduct.description,
                              imageUrl: value.toString(),
                              price: editedProduct.price);
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
