import 'dart:io';
import 'package:ecommerce/product_manager.dart';

void main() {
  // product
  ProductManager productManager = ProductManager();

  while (true) {
    print('\nE-Commerce Application');
    print('1. Add Product');
    print('2. View All Products');
    print('3. View Product');
    print('4. Edit Product');
    print('5. Delete Product');
    print('6. Exit');
    stdout.write('Choose an option: ');

    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        addproduct(productManager);
        break;
      case '2':
        productManager.viewAllProducts();
        break;
      case '3':
        viewProduct(productManager);
        break;
      case '4':
        editProduct(productManager);
        break;
      case '5':
        deleteProduct(productManager);
        break;
      case '6':
        exit(0);
      default:
        print('Invalid option. Please try again.');
    }
  }
}

void addproduct(ProductManager productManager) {
  stdout.write('Enter product name: ');
  String? name = stdin.readLineSync();
  stdout.write('Enter product description: ');
  String? description = stdin.readLineSync();
  stdout.write('Enter product price: ');
  String? priceInput = stdin.readLineSync();
  double price = double.parse(priceInput!);

  productManager.addProduct(name!, description!, price);
}

void viewProduct(ProductManager productManager) {
  if (productManager.products.isEmpty) {
    print('No products available.');
  } else {
    stdout.write('Enter the product index: ');
    String? indexInput = stdin.readLineSync();
    int index = int.parse(indexInput!);

    productManager.viewProduct(index);
  }
}

void editProduct(ProductManager productManager) {
  if (productManager.products.isEmpty) {
    print('No products available.');
  } else {
    stdout.write('Enter product index: ');
    String? indexInput = stdin.readLineSync();
    int index = int.parse(indexInput!);

    stdout.write('Enter the new product name: ');
    String? name = stdin.readLineSync();
    stdout.write('Enter new product description: ');
    String? description = stdin.readLineSync();
    stdout.write('Enter the new product price: ');
    String? priceInput = stdin.readLineSync();
    double price = double.parse(priceInput!);

    productManager.editProduct(index, name!, description!, price);
  }
}

void deleteProduct(ProductManager productManager) {
  if (productManager.products.isEmpty) {
    print('No products available.');
  } else {
    stdout.write('Enter the product index: ');
    String? indexInput = stdin.readLineSync();
    int index = int.parse(indexInput!);

    productManager.deleteProduct(index);
  }
}
