// ignore_for_file: unrelated_type_equality_checks

import 'dart:convert';
import 'package:flutter_frontendmasters/store/datamodel.dart';
import 'package:http/http.dart' as http;

class Datamanager {
  List<Category>? _menu;
  List<ItemInCart> cart = [];

  addtoCart(Product p) {
    bool found = false;
    for (var item in cart) {
      if (item.product.id == p.id) {
        item.quantity++;
        found = true;
      }
    }
    if (!found) {
      cart.add(ItemInCart(product: p, quantity: 1));
    }
  }

  removeFromCart(Product p) {
    cart.removeWhere((element) => element.product.id == p.id);
  }

  clearCart() {
    cart.clear();
  }

  double cartTotal() {
    double total = 0;
    for (var item in cart) {
      total += item.quantity * item.product.price;
    }
    return total;
  }

  fetchMenu() async {
    _menu!.clear();
    try {
      String url = 'http://localhost:5555/categories';
      http.Response response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        _menu = [];
        var decodedData = jsonDecode(response.body) as List<dynamic>;
        print(decodedData);
        decodedData.map((json) {
          Category cq = Category(name: json['name'], products: []);
          List<dynamic> cqProducts = json['products'];
          for (var elt in cqProducts) {
            cq.products.add(Product.fromJson(elt));
          }
          _menu?.add(cq);
        });
      } else {
        print("Fetch error");
        throw Exception("Error loading data");
      }
    } catch (e) {
      print("Fetch error");
      throw Exception("Errors while fetching data");
    }
  }

  Future<List<Category>> getMenu() async {
    await fetchMenu();
    return _menu!;
  }
}
