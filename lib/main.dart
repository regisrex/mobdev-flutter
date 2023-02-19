import 'package:flutter/material.dart';
import 'package:flutter_frontendmasters/offers_page.dart';

import 'cart_page.dart';
import 'menu_page.dart';

void main() {
  runApp(const MyApp());
}

class HelloWorld extends StatelessWidget {
  const HelloWorld({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text("Hello World");
  }
}

class Greet extends StatefulWidget {
  const Greet({super.key});

  @override
  State<Greet> createState() => _GreetState();
}

class _GreetState extends State<Greet> {
  var name = "";

  @override
  Widget build(BuildContext context) {
    // return const Text("Hello $name");
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: Row(children: [
            Text(
              "Hello $name",
              style: const TextStyle(fontSize: 22),
            ),
            const Text(
              "😊",
              style: TextStyle(fontSize: 22),
            ),
          ]),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          child: Row(
            children: const [
              Text(
                'Type your name',
                style: TextStyle(fontSize: 14, color: Colors.black38),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          child: TextField(
              onChanged: (value) => setState(() {
                    name = value;
                  })),
        )
      ],
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;
  Widget currentWidgetPage  =  const OffersPage();
  @override
  Widget build(BuildContext context) {

    switch(selectedIndex){
      case 0:
        setState(() {
          currentWidgetPage = const MenuPage();
        });
        break;
      case 1:
        setState(() {
          currentWidgetPage = const OffersPage();
        });
        break;
      case 2:
        setState(() {
          currentWidgetPage = const CartPage();
        });
        break;

    }
    return Scaffold(
        appBar: AppBar(title: Center(child: Image.asset("images/logo.png"))),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) => setState(() {
                  selectedIndex = index;
                }),
            selectedItemColor: Colors.amber.shade900,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.coffee), label: "Menu"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.local_offer), label: "Offers"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_checkout_rounded),
                  label: "Cart"),
            ]),
        body: currentWidgetPage );
  }
}
