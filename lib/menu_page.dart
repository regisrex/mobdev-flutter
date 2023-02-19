import 'package:flutter/material.dart';
import 'package:flutter_frontendmasters/components/productitem.dart';
import 'package:flutter_frontendmasters/store/datamodel.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  Product p = Product( id: 0, name: "capuccino", price: 300, image: 'black-coffee.png');

  @override
  Widget build(BuildContext context) {
    return  ProductItem(product: p);
  }
}
