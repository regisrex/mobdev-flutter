import 'package:flutter/material.dart';
import 'package:flutter_frontendmasters/components/order_item.dart';
import 'package:flutter_frontendmasters/store/datamodel.dart';
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
    if (widget.datamanager.cart.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            child: ListView.builder(
              itemCount: widget.datamanager.cart.length,
              itemBuilder: (context, index) {
                var item = widget.datamanager.cart[index];
                return OrderItem(
                    item: item,
                    onRemove: (Product product) {
                      setState(() {
                        widget.datamanager.removeFromCart(product);
                      });
                    });
              },
            )),
      );
    } else {
      return Center(
        child: SizedBox(
          height: 100,
          child: Column(
            children: const [
              Icon(
                Icons.coffee_outlined,
                color: Colors.grey,
                size: 40,
              ),
              Text(
                "Nothing in your cart!",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
