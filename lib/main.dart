import 'package:flutter/material.dart';
import 'package:flutter_frontendmasters/offers_page.dart';
import 'package:flutter_frontendmasters/utils/datamanager.dart';
import 'package:google_fonts/google_fonts.dart';
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

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  var dataManager = Datamanager();
  Widget currentWidgetPage = const Center(
    child: Text("Loading"),
  );
  @override
  Widget build(BuildContext context) {
    switch (selectedIndex) {
      case 0:
        setState(() {
          currentWidgetPage = MenuPage(datamanager: dataManager);
        });
        break;
      case 1:
        setState(() {
          currentWidgetPage = OffersPage(datamanager: dataManager);
        });
        break;
      case 2:
        setState(() {
          currentWidgetPage = CartPage(datamanager: dataManager);
        });
        break;
    }
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            "CoffeeShop",
            style: GoogleFonts.lobster(
                textStyle: const TextStyle(
              color: Colors.orange,
            )),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) => setState(() {
                  selectedIndex = index;
                }),
            selectedItemColor: Colors.amber.shade900,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.coffee),
                  label: "Menu",
                  tooltip: "Available coffees"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.local_offer),
                  label: "Offers",
                  tooltip: "New offers 😋"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_checkout_rounded),
                  label: "Cart",
                  tooltip: "View your cart"),
            ]),
        body: currentWidgetPage);
  }
}
