import 'package:flutter/material.dart';
import '../store/datamodel.dart';

class ProductItem extends StatelessWidget {
  final Product product;
  final Function onAdd;
  const ProductItem({super.key, required this.product, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          child: Card(
            color: Colors.white,
            elevation: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blueGrey.withOpacity(0.05),
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(
                    color: Colors.white10.withOpacity(0.1),
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
                            child: Image.network(product.imageUrl))),
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
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Text(product.description,
                                style: TextStyle(color: Colors.grey)),
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
                                    style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                                side: const BorderSide(
                                                    color: Colors.white10,
                                                    width: 0.0),
                                                borderRadius:
                                                    BorderRadius.circular(5.0)))),
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
      ),
    );
  }
}
