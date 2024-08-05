// import 'dart:svg';

import 'product.dart';

class ProductManager {
  List<Product> products = [];

  void addProduct(String name, description, double price) {
    products.add(Product(name, description, price));
    print('$name added to products list : ');
  }

  void viewAllProducts() {
    if (products.isEmpty) {
      print('No products available.');
    } else {
      for (var product in products) {
        print(product);
      }
    }
  }

  void viewProduct(int index) {
    if (index < 0 || index >= products.length) {
      print('Product not found.');
    } else {
      print(products[index]);
    }
  }

  void editProduct(int index, String name, description, double price) {
    if (index < 0 || index >= products.length) {
      print('Product not found.');
    } else {
      products[index].name = name;
      products[index].description = description;
      products[index].price = price;
      print('Product updated: $name');
    }
  }

  void deleteProduct(int index) {
    if (index < 0 || index >= products.length) {
      print("Product not found.");
    } else {
      print("Product deleted: ${products[index].name}");
      products.removeAt(index);
    }
  }
}
