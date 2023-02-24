import "package:flutter/material.dart";
import "package:flutter_frontendmasters/store/datamodel.dart";

class OrderItem extends StatefulWidget {
  final ItemInCart item;
  final Function onRemove;
  const OrderItem({Key? key, required this.item, required this.onRemove})
      : super(key: key);

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text("${widget.item.quantity}x"),
                  )),
              Expanded(
                  flex: 6,
                  child: Text(
                    widget.item.product.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )),
              Expanded(
                  flex: 2,
                  // ignore: prefer_interpolation_to_compose_strings
                  child: Text("\$" +
                      (widget.item.product.price * widget.item.quantity)
                          .toStringAsFixed(2))),
              Expanded(
                  flex: 1,
                  child: IconButton(
                          color: Theme.of(context).primaryColor,
                          onPressed: () {
                            widget.onRemove(widget.item.product);
                          },
                          icon: const Icon(Icons.delete)
                        )
                )
            ],
          ),
        ),
      ),
    );
  }
}
