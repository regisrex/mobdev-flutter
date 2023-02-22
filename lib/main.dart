import 'package:flutter/material.dart';
import 'package:flutter_frontendmasters/offers_page.dart';
import 'package:flutter_frontendmasters/utils/datamanager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:go_router/go_router.dart';
import 'cart_page.dart';
import 'menu_page.dart';

void main() {
  runApp(const MyApp());
}

class HelloWorld extends StatelessWidget {
  const HelloWorld({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ListView(
        children: [ Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 100.0),
            child: Center(
                child: Column(
              children: [
                Text(
                  "CoffeeShop",
                  style: GoogleFonts.lobster(
                      decoration: TextDecoration.none,
                      textStyle: const TextStyle(
                        textBaseline: TextBaseline.alphabetic,
                        color: Colors.orange,
                      )),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 30.0),
                  child: Text(
                    "The best coffee shop in the city. Do you like capuccino, americano or Rwandan java  ?   We're everywhere, especially near you",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 14,
                      color: Colors.grey,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.asset(
                      'images/black_coffee.png',
                      scale: 0.9,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(9999),
                    child: ElevatedButton(
                        style: const ButtonStyle(
                            alignment: Alignment.center,
                            elevation: MaterialStatePropertyAll(0),
                            backgroundColor:
                                MaterialStatePropertyAll<Color>(Colors.orange),
                            padding: MaterialStatePropertyAll<EdgeInsets>(
                                EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 20))),
                        onPressed: () {
                          GoRouter.of(context).push('/in');
                        },
                        child: Row(
                          // mainAxisAlignment: Main1,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text("Get in"),
                            Icon(Icons.arrow_right_alt_sharp)
                          ],
                        )),
                  ),
                )
              ],
            )),
          ),
        )],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final GoRouter _router = GoRouter(routes: [
      GoRoute(path: '/', builder: (context, state) => const HelloWorld()),
      GoRoute(
          path: '/in',
          pageBuilder: ((context, state) {
            return CustomTransitionPage(
                child: const MyHomePage(),
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) =>
                        FadeTransition(opacity: animation, child: child));
          }))
      // builder: (context, state) => const MyHomePage())
    ]);
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   theme: ThemeData(
    //     primarySwatch: Colors.orange,
    //   ),
    //   home: const MyHomePage(),
    // );
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       fontFamily: 'Inter',
             ),
      routerConfig: _router);
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedPageIndex = 0;
  var dataManager = Datamanager();
  Widget currentWidgetPage = const Center(
    child: Text("Loading"),
  );
  @override
  Widget build(BuildContext context) {
    switch (selectedPageIndex) {
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
          elevation: 1,
          backgroundColor: Colors.white,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "CoffeeShop",
                style: GoogleFonts.lobster(
                    textStyle: const TextStyle(
                  color: Colors.orange,
                )),
              ),
              Container(
                width: 30,
                height: 30,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    'images/user.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ],
          ),
        ),
        // bottomNavigationBar: BottomNavigationBar(
        //     currentIndex: selectedIndex,
        //     onTap: (index) => setState(() {
        //           selectedIndex = index;
        //         }),
        //     selectedItemColor: Colors.amber.shade900,
        //     items: const [
        //       BottomNavigationBarItem(
        //           icon: Icon(Icons.coffee),
        //           label: "Menu",
        //           tooltip: "Available coffees"),
        //       BottomNavigationBarItem(
        //           icon: Icon(Icons.local_offer),
        //           label: "Offers",
        //           tooltip: "New offers 😋"),
        //       BottomNavigationBarItem(
        //           icon: Icon(Icons.shopping_cart_checkout_rounded),
        //           label: "Cart",
        //           tooltip: "View your cart"),
        //     ]),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(10.0),
          color: Colors.white,
          child: GNav(
              onTabChange: (index) => setState(() {
                    selectedPageIndex = index;
                  }),
              selectedIndex: selectedPageIndex,
              rippleColor: const Color.fromARGB(255, 255, 247, 234),
              activeColor: Colors.white,
              tabBackgroundColor: Colors.black87,
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              gap: 10,
              iconSize: 20,
              tabs: const [
                GButton(
                  icon: Icons.coffee_rounded,
                  text: "Menu",
                ),
                GButton(
                  icon: Icons.local_offer_rounded,
                  text: "Offers",
                ),
                GButton(
                  icon: Icons.shopping_cart_rounded,
                  text: "Cart",
                )
              ]),
        ),
        body: currentWidgetPage);
  }
}
