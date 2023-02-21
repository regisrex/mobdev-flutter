import 'package:flutter/material.dart';
import 'package:flutter_frontendmasters/components/order_item.dart';
import 'package:flutter_frontendmasters/store/datamodel.dart';
import 'package:flutter_frontendmasters/utils/datamanager.dart';

class CartPage extends StatelessWidget {
  final Datamanager datamanager;
  const CartPage({super.key, required this.datamanager});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          child: ListView.builder(
            itemCount: datamanager.cart.length,
            itemBuilder: (context, index) {
              var item = datamanager.cart[index];
              if (datamanager.cart.isNotEmpty) {
                return OrderItem(
                    item: item,
                    onRemove: (Product product) {
                      datamanager.removeFromCart(product);
                    });
              } else if(datamanager.cart.isEmpty) {
                return Center(
                  child: SizedBox(
                    height: 100,
                    child: Column(
                      children: const [
                        Icon(
                          Icons.cloud_off,
                          color: Colors.grey,
                          size: 40,
                        ),
                        Text(
                          "Nothing on our menu!",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }else{
              return const Center(child: CircularProgressIndicator());
              }
            },
          )),
    );
  }
}
