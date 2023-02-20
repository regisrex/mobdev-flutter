import 'package:flutter/material.dart';
import 'package:flutter_frontendmasters/store/datamodel.dart';
import 'package:flutter_frontendmasters/utils/datamanager.dart';

class MenuPage extends StatelessWidget {
  final Datamanager datamanager;
  const MenuPage({super.key, required this.datamanager});

  Function dispatchWhenAdd(Product p) {
    return (Product p) {
      //   setState(() {
      p.isAdded = !p.isAdded;
      //  });
    };
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: datamanager.getMenu(),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return const Center(child: Text("Has data"));
        } else {
          if (snapshot.hasData) {
            return Center(
              child: SizedBox(
                height: 100,
                child: Column(
                  children: const [
                    Icon(
                      Icons.cloud_off,
                      color: Colors.grey,
                      size: 40,
                    ),
                    Text(
                      "Nothing on our menu!",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        }
        return const Center(child: CircularProgressIndicator());
      }),
    );
  }
}
