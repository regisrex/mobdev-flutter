import 'dart:convert';
import 'package:flutter_frontendmasters/store/datamodel.dart';
import 'package:http/http.dart' as http;

class Datamanager {
  final List<Category> _menu = [];
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
    try {
      const String url = 'http://localhost:5555/categories';
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body) as List<dynamic>;
        for (dynamic datum in decodedData) {
          _menu?.add(Category(name: datum.name, products: datum.products));
        }
      } else {
        throw Exception("Errors while loading data");
      }
    } catch (e) {
      throw Exception("Errors while fetching data");
    }
  }

  Future<List<Category>> getMenu() async {
    // if(_menu == null){
    await fetchMenu();
    // }
    print(_menu);
    return _menu!;
  }
}
