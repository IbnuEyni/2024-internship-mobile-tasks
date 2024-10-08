import 'dart:io';
// import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_6/item.dart';
import 'package:task_6/widgets/button_widget.dart';

class AddItemPage extends StatefulWidget {
  final String? id;
  const AddItemPage({super.key, this.id});

  @override
  _AddItemPageState createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  final _nameController = TextEditingController();
  final _categoryController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();
  // final _ratingController = TextEditingController();
  File? _imageFile; // To store the selected image file

  late Item ourItem = Item(
      imageUrl: '',
      name: '',
      price: 0,
      description: '',
      rating: 0,
      id: 0,
      category: '');
  @override
  void initState() {
    super.initState();
    for (final item in items) {
      if (item.id.toString() == widget.id) {
        ourItem = item;
        print('tooooupdateeeeeeee');
      }
    }

    if (widget.id != null) {
      _nameController.text = ourItem.name;
      _categoryController.text = ourItem.category;
      _priceController.text = ourItem.price.toString();
      _descriptionController.text = ourItem.description;
      _imageFile = File(ourItem.imageUrl);
    }
  }

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = pickedFile.path as File?;
      });
    }
  }

  void _updateItem() {
    final String newname = _nameController.text;
    final String newcategory = _categoryController.text;
    final String newpriceText = _priceController.text;
    final String newdescription = _descriptionController.text;

    // for (final item in items) {
    //   if (item.id.toString() == widget.id) {
    //     item.category = newcategory;
    //     item.description = newdescription;
    //     item.name = newname;
    //     // item.price = newpriceText;
    //   }
    // }
    if (newname.isNotEmpty &&
        newcategory.isNotEmpty &&
        newpriceText.isNotEmpty &&
        newdescription.isNotEmpty) {
      final double price = double.tryParse(newpriceText) ?? 0.0;

      final updatedItem = Item(
        imageUrl: 'images/shoes4.jpg',
        name: newname,
        category: newcategory,
        price: price,
        description: newdescription,
        rating: 4.0,
        id: int.parse(widget.id!),
      );

      _nameController.clear();
      _categoryController.clear();
      _priceController.clear();
      _descriptionController.clear();
      setState(() {
        _imageFile = null;
      });

      // Navigator.pop(context, widget.id.toString());
      Navigator.pushNamed(context, '/',
          arguments: {'id': widget.id.toString(), 'item': updatedItem});
    }
  }

  void _addItem() {
    final String name = _nameController.text;
    final String category = _categoryController.text;
    final String priceText = _priceController.text;
    final String description = _descriptionController.text;

    if (name.isNotEmpty &&
        category.isNotEmpty &&
        priceText.isNotEmpty &&
        description.isNotEmpty) {
      final double price = double.tryParse(priceText) ?? 0.0;

      final newItem = Item(
        imageUrl: 'images/shoes4.jpg',
        name: name,
        category: category,
        price: price,
        description: description,
        rating: 4.0,
        id: items.length + 1,
      );
      setState(() {
        // items.add(newItem);
        debugPrint('item is added!');
      });

      _nameController.clear();
      _categoryController.clear();
      _priceController.clear();
      _descriptionController.clear();
      setState(() {
        _imageFile = null;
      });

      Navigator.pop(context, newItem);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please fill all fields and upload an image."),
        ),
      );
    }
  }

  // void _deleteItem() {
  //   Navigator.pop(context, 'delete');
  // }

  @override
  Widget build(BuildContext context) {
    bool isEditing = (widget.id != null);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    color: const Color(0xff3F51F3),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.white), // White background
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        const CircleBorder(), // Circular shape
                      ),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.all(
                            16), // Adjust padding to control size
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Add/Edit Product',
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
                      child: widget.id == null
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
                                      height:
                                          8.0), // Space between icon and text
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
                          : (_imageFile != null)
                              ? Image.file(
                                  _imageFile!,
                                  fit: BoxFit.fill,
                                )
                              : Placeholder(),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Name"),
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: InputBorder.none,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Category"),
                  TextField(
                    controller: _categoryController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: InputBorder.none,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Price"),
                  TextField(
                    controller: _priceController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: InputBorder.none,
                      suffixIcon: const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Text("\$"),
                      ), // Dollar sign at the end
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Description"),
                  TextField(
                    controller: _descriptionController,
                    keyboardType: TextInputType.number,
                    maxLines: 4,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200],
                      border: InputBorder.none,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              if (isEditing)
                ButtonWidget(
                  title: 'Update',
                  isFilled: true,
                  buttonWidth: double.infinity,
                  onPressed: () {
                    // _addItem();
                    _updateItem();
                  },
                ),
              if (!isEditing)
                ButtonWidget(
                  title: 'Add',
                  isFilled: true,
                  buttonWidth: double.infinity,
                  onPressed: () {
                    _addItem();
                    // _updateItem();
                  },
                ),
              if (isEditing) const SizedBox(height: 16.0),
              // if (isEditing)
              //   ButtonWidget(
              //       title: 'DELETE',
              //       isFilled: false,
              //       buttonWidth: double.infinity,
              //       onPressed:
              //           _deleteItem // Add this line even if it does nothing
              //       ),
            ],
          ),
        ),
      ),
    );
  }
}
