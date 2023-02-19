import 'package:flutter/material.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Offer(title: "Americano", description: "Buy one, get another for free"),
        Offer(title: "Americano", description: "Buy one, get another for free"),
        Offer(title: "Americano", description: "Buy one, get another for free"),
        Offer(title: "Americano", description: "Buy one, get another for free"),
        Offer(title: "Americano", description: "Buy one, get another for free"),
        Offer(title: "Americano", description: "Buy one, get another for free"),
        Offer(title: "Americano", description: "Buy one, get another for free"),
        Offer(title: "Americano", description: "Buy one, get another for free"),
        Offer(title: "Americano", description: "Buy one, get another for free"),
        Offer(title: "Americano", description: "Buy one, get another for free"),
        Offer(title: "Americano", description: "Buy one, get another for free"),
        Offer(title: "Americano", description: "Buy one, get another for free"),
      ],
    );
  }
}

class Offer extends StatelessWidget {
  final String title;
  final String description;

  const Offer({Key? key, required this.title, required this.description})
      : super(key: key);

  // ignore: empty_constructor_bodies
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Card(
          color: Colors.amber.shade50,
          elevation: 0,
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('images/background.png'))),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  children: [
                    Text(title,
                        style: Theme.of(context).textTheme.bodyLarge),
                    Text(description,
                        style: Theme.of(context).textTheme.bodyMedium)
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
