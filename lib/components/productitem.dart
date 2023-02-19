import 'package:flutter/material.dart';
import '../store/datamodel.dart';

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        child: Card(
          color: Colors.white,
          elevation: 0,
          child: Container(
            width: 300,
            height: 340,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.amberAccent.withOpacity(0.05),
              border: Border.all(
                  color: Colors.white10.withOpacity(0.1),
                  width: 1.0,
                  style: BorderStyle.solid),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 30.0, horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Image.asset("images/black_coffee.png")),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(product.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 20,
                          )),
                      Text(
                        "${product.price}\$",
                        style: const TextStyle(fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(product.description,
                        style: Theme.of(context).textTheme.bodyMedium),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: OutlinedButton(
                      style: const ButtonStyle(

                      ),
                        onPressed: () {  },
                        child: Container(
                          width: 120,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(Icons.shopping_cart_rounded ),
                                Text("Add to cart"),
                              ],
                            ),
                          ),
                        )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
