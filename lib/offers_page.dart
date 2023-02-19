import 'package:flutter/material.dart';
import 'package:flutter_frontendmasters/components/offer.dart';

class OffersPage extends StatelessWidget {
  const OffersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Offer(title: "Americano", description: "Buy one, get another for free"),
        Offer(title: "Capucino", description: "Buy one, get another for free"),
        Offer(title: "Rwandan coffee", description: "Buy one, get another for free"),
        Offer(title: "Chinesino", description: "Buy one, get another for free"),
        Offer(title: "Tropical bean", description: "Buy one, get another for free"),
        Offer(title: "Brown beans", description: "Buy one, get another for free"),
        Offer(title: "Palm tree", description: "Buy one, get another for free"),
        Offer(title: "Heart shape", description: "Buy one, get another for free"),
        Offer(title: "Flavoured", description: "Buy one, get another for free"),
        Offer(title: "Great one", description: "Buy one, get another for free"),
        Offer(title: "Chinno", description: "Buy one, get another for free"),
        Offer(title: "Japanino", description: "Buy one, get another for free"),
      ],
    );
  }
}

