import 'package:flutter/material.dart';
import 'package:flutter_frontendmasters/components/productitem.dart';
import 'package:flutter_frontendmasters/store/datamodel.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  Product p = Product(
    id: 0,
    name: "capuccino",
    price: 300,
    image: 'black-coffee.png',
    isAdded: false,
    description: "Come drink on the real cappuccino bean around here",
  );
  Function dispatchWhenAdd (Product p) {
  return (Product p){
    setState(() {
      p.isAdded = !p.isAdded;
    });
  };
  }


  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      ProductItem(
          product: p,
          onAdd: dispatchWhenAdd(p),
      ),
    ]
    );
  }
}
