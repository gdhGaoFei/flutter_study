import 'package:flutter/material.dart';
import 'package:flutter_shop/config/string.dart';

class CartPage extends StatefulWidget {
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(kString.cartTitle),
    );
  }
}
