import 'package:flutter/material.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({Key? key}) : super(key: key);

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _imageUrlController = TextEditingController();
  final _imageUrlFocusNode = FocusNode();
  // fina

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
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit product"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
        ),
        child: Form(
            child: ListView(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              textInputAction: TextInputAction.next,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'price',
              ),
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Description',
              ),
              maxLines: 3,
              keyboardType: TextInputType.multiline,
              // textInputAction: TextInputAction.next,
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
