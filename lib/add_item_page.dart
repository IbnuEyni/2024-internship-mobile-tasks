import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class AddItemPage extends StatefulWidget {
  @override
  _AddItemPageState createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  final _nameController = TextEditingController();
  final _categoryController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _ratingController = TextEditingController();
  File? _imageFile; // To store the selected image file

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Positioned(
                  top: 20,
                  left: 20,
                  child: Container(
                    width: 40,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white, // Background color
                      shape: BoxShape.circle, // Circular shape
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Color.fromARGB(255, 79, 59, 255),
                        size: 20,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                const Expanded(
                  child: Center(
                    child: Text(
                      'Add Product',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 8.0),
            GestureDetector(
              onTap: _pickImage,
              child: Stack(
                children: <Widget>[
                  Container(
                    width: double.infinity,
                    height: 150,
                    color: Colors.grey[300],
                    child: _imageFile == null
                        ? Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.image_rounded,
                                  size: 50,
                                  color: Colors.grey[600],
                                ),
                                const SizedBox(
                                    height: 8.0), // Space between icon and text
                                const Text(
                                  'Upload Image',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black, // Text color
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Image.file(
                            _imageFile!,
                            fit: BoxFit.cover,
                          ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Name',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _nameController,
            ),
            SizedBox(height: 16.0),
            Column(
              children: [
                const Text(
                  'Category',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Text color
                  ),
                ),
                const SizedBox(width: 8.0), // Space between text and text field
                Expanded(
                  child: Container(
                    color:
                        Colors.grey[300], // Grey background for the text field
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 8.0),
                    child: const TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none, // No border
                      ),
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black, // Text color in the text field
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              'Price',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _priceController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter item price',
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                Text(
                  '\$',
                  style: TextStyle(fontSize: 24),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              'Description',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _descriptionController,
              maxLines: 3,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter item description',
              ),
            ),
            SizedBox(height: 16.0),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                // Handle ADD action
                final newItem = Item(
                  imageUrl: _imageFile?.path ?? '',
                  name: _nameController.text,
                  price: double.tryParse(_priceController.text) ?? 0.0,
                  description: _descriptionController.text,
                  rating: double.tryParse(_ratingController.text) ?? 0.0,
                );
                // Add newItem to your list or database
                Navigator.pop(context, newItem);
              },
              child: Text('ADD'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
            ),
            SizedBox(width: 16.0),
            TextButton(
              onPressed: () {
                // Handle DELETE action
              },
              child: Text('DELETE'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Item {
  final String imageUrl;
  final String name;
  final double price;
  final String description;
  final double rating;

  Item({
    required this.imageUrl,
    required this.name,
    required this.price,
    required this.description,
    required this.rating,
  });
}

final List<Item> items = [
  Item(
    imageUrl: 'images/leather.jpeg',
    name: 'Derby Leather Shoes',
    price: 120,
    description: 'Men’s shoe',
    rating: 4.0,
  ),
  Item(
    imageUrl: 'images/leather.jpeg',
    name: 'Derby Leather Shoes',
    price: 120,
    description: 'Men’s shoe',
    rating: 4.0,
  ),
  Item(
    imageUrl: 'images/leather.jpeg',
    name: 'Derby Leather Shoes',
    price: 120,
    description: 'Men’s shoe',
    rating: 4.0,
  ),
  Item(
    imageUrl: 'images/leather.jpeg',
    name: 'Derby Leather Shoes',
    price: 120,
    description: 'Men’s shoe',
    rating: 4.0,
  ),
  Item(
    imageUrl: 'images/leather.jpeg',
    name: 'Derby Leather Shoes',
    price: 120,
    description: 'Men’s shoe',
    rating: 4.0,
  ),
];
