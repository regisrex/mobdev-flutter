import 'package:flutter/material.dart';
import 'package:flutter_frontendmasters/components/productitem.dart';
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
          List<Category> categories = snapshot.data!;
          return ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(categories[index].name),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: categories[index].products.length,
                    itemBuilder: (ccontext, iindex) {
                      return ProductItem(
                          product: categories[index].products[iindex],
                          onAdd: dispatchWhenAdd(
                              categories[index].products[iindex]));
                    },
                  )
                ],
              );
            },
          );
        } else if (!snapshot.hasData) {
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
        return const Center(child: CircularProgressIndicator());
      }),
    );
  }
}
