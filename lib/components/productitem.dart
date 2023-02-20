import 'package:flutter/material.dart';
import '../store/datamodel.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  final Function onAdd;
  const ProductItem({super.key, required this.product, required this.onAdd});

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
            height: 380,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
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
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: Image.asset("images/black_coffee.png"))),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 6.0, horizontal: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(product.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                )),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.greenAccent.withOpacity(0.2)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 2.0, horizontal: 8.0),
                                child: Text(
                                  product.isAdded
                                      ? "Added to cart"
                                      : "Not added to cart",
                                  style: const TextStyle(
                                    color: Colors.greenAccent,
                                    fontSize: 14.00,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text(product.description,
                              style: Theme.of(context).textTheme.bodyMedium),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "${product.price}\$",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 22),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: OutlinedButton(
                                  style:  ButtonStyle(
                                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                       RoundedRectangleBorder(
                                        side: BorderSide.none,
                                        borderRadius: BorderRadius.circular(5.0)
                                      )
                                    )
                                  ),
                                  onPressed: () {
                                    onAdd(product);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: const [
                                        Icon(Icons.shopping_cart_rounded),
                                        Text("Add to cart"),
                                      ],
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
