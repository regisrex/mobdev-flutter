import 'package:flutter/material.dart';
import 'package:flutter_frontendmasters/store/datamodel.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return const Text("Menu page");
  }
}

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 10),
      child: Column(children: [
        Text(product.name, style: Theme.of(context).textTheme.bodyMedium)
      ]),
    );
  }
}
