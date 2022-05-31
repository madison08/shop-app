// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  Widget child;
  String value;

  Badge({required this.child, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      padding: EdgeInsets.symmetric(
        horizontal: 7,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              child,
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              height: 25.0,
              width: 25.0,
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(
                  60.0,
                ),
              ),
              alignment: Alignment.center,
              child: Text(value),
            ),
          )
        ],
      ),
    );
  }
}
