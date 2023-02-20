import 'package:flutter/material.dart';
import 'package:flutter_frontendmasters/utils/datamanager.dart';

class CartPage extends StatefulWidget {
  final Datamanager datamanager;
  const CartPage({super.key, required this.datamanager});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Text("Cart"),
    );
  }
}
