import 'package:ecommerce/product_manager.dart';
import 'package:test/test.dart';

void main() {
  group('ProductManager', () {
    late ProductManager productManager;

    setUp(() {
      productManager = ProductManager();
    });

    test('addProduct adds a product to the list', () {
      productManager.addProduct('Test Product', 'This is a test product', 9.99);
      expect(productManager.products.length, 1);
      expect(productManager.products[0].name, 'Test Product');
    });

    test('viewAllProducts prints all products', () {
      productManager.addProduct('Product 1', 'Description 1', 1.99);
      productManager.addProduct('Product 2', 'Description 2', 2.99);

      expect(() => productManager.viewAllProducts(),
          prints(contains('Product 1')));
      expect(() => productManager.viewAllProducts(),
          prints(contains('Product 2')));
    });

    test('viewProduct prints the correct product', () {
      productManager.addProduct('Product 1', 'Description 1', 1.99);
      expect(
          () => productManager.viewProduct(0), prints(contains('Product 1')));
    });

    test('editProduct edits the correct product', () {
      productManager.addProduct('Product 1', 'Description 1', 1.99);
      productManager.editProduct(
          0, 'Updated Product', 'Updated Description', 2.99);

      expect(productManager.products[0].name, 'Updated Product');
      expect(productManager.products[0].description, 'Updated Description');
      expect(productManager.products[0].price, 2.99);
    });

    test('deleteProduct removes the correct product', () {
      productManager.addProduct('Product 1', 'Description 1', 1.99);
      productManager.addProduct('Product 2', 'Description 2', 2.99);
      productManager.deleteProduct(0);

      expect(productManager.products.length, 1);
      expect(productManager.products[0].name, 'Product 2');
    });

    test('viewProduct handles invalid index', () {
      expect(() => productManager.viewProduct(0),
          prints(contains('Product not found')));
    });

    test('editProduct handles invalid index', () {
      expect(() => productManager.editProduct(0, 'Name', 'Description', 9.99),
          prints(contains('Product not found')));
    });

    test('deleteProduct handles invalid index', () {
      expect(() => productManager.deleteProduct(0),
          prints(contains('Product not found')));
    });
  });
}
