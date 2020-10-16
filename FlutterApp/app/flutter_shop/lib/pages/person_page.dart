import 'package:flutter/material.dart';
import 'package:flutter_shop/config/string.dart';

class PersonPage extends StatefulWidget {
  _PersonPageState createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(kString.personTitle),
    );
  }
}
