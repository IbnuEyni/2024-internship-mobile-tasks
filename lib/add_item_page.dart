import 'dart:io';

import 'package:flutter/material.dart';
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
      appBar: AppBar(
        title: Text('Add Item'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.blue,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Upload Image',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                width: double.infinity,
                height: 150,
                color: Colors.grey[300],
                child: _imageFile == null
                    ? Center(
                        child: Icon(Icons.upload,
                            size: 50, color: Colors.grey[600]),
                      )
                    : Image.file(
                        _imageFile!,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Name',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter item name',
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Category',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              // controller: _categoryController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter item category',
              ),
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
