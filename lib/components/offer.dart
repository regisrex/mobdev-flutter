import "package:flutter/material.dart";

class Offer extends StatelessWidget {
  final String title;
  final String description;

  const Offer({Key? key, required this.title, required this.description})
      : super(key: key);

  // ignore: empty_constructor_bodies
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
        child: Card(
          color: Colors.amber.shade50,
          elevation: 0,
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('images/background.png'))),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: Theme.of(context).textTheme.headline6),
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
