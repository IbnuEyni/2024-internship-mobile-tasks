// import 'dart:js';

import 'package:flutter/material.dart';

import 'package:task_6/add_item_page.dart';
import 'package:task_6/detail_page.dart';
import 'package:task_6/item.dart';
import 'package:task_6/search_page.dart';

void main() {
  // var item;
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            Map? map = settings.arguments as Map?;
            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => HomePage(
                map: {},
              ),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                const begin = Offset(0.0, 1.0);
                const end = Offset.zero;
                const curve = Curves.ease;

                final tween = Tween(begin: begin, end: end);
                final curvedAnimation = CurvedAnimation(
                  parent: animation,
                  curve: curve,
                );

                return SlideTransition(
                  position: tween.animate(curvedAnimation),
                  child: child,
                );
              },
            );
          case '/detail':
            String id = settings.arguments as String;
            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  DetailPage(id: id),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                const begin = Offset(0.0, 1.0);
                const end = Offset.zero;
                const curve = Curves.ease;

                final tween = Tween(begin: begin, end: end);
                final curvedAnimation = CurvedAnimation(
                  parent: animation,
                  curve: curve,
                );

                return SlideTransition(
                  position: tween.animate(curvedAnimation),
                  child: child,
                );
              },
            );
          case '/add':
            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const AddItemPage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                const begin = Offset(0.0, 1.0);
                const end = Offset.zero;
                const curve = Curves.ease;

                final tween = Tween(begin: begin, end: end);
                final curvedAnimation = CurvedAnimation(
                  parent: animation,
                  curve: curve,
                );

                return SlideTransition(
                  position: tween.animate(curvedAnimation),
                  child: child,
                );
              },
            );
          case '/update':
            String data = settings.arguments as String;
            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  AddItemPage(
                id: data,
              ),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                const begin = Offset(0.0, 1.0);
                const end = Offset.zero;
                const curve = Curves.ease;

                final tween = Tween(begin: begin, end: end);
                final curvedAnimation = CurvedAnimation(
                  parent: animation,
                  curve: curve,
                );

                return SlideTransition(
                  position: tween.animate(curvedAnimation),
                  child: child,
                );
              },
            );

          case '/search':
            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) =>
                  const SearchPage(),
              transitionsBuilder:
                  (context, animation, secondaryAnimation, child) {
                const begin = Offset(0.0, 1.0);
                const end = Offset.zero;
                const curve = Curves.ease;

                final tween = Tween(begin: begin, end: end);
                final curvedAnimation = CurvedAnimation(
                  parent: animation,
                  curve: curve,
                );

                return SlideTransition(
                  position: tween.animate(curvedAnimation),
                  child: child,
                );
              },
            );
        }
      },
    ),
  );
}

class HomePage extends StatefulWidget {
  final Map map;
  const HomePage({super.key, required this.map});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // late List<Item> itemList = [];
  // @override
  // void initState() {
  //   super.initState();
  //   itemList = items;
  //   print('kkkkkkkkkkkkkkkk ${itemList.length}');
  // }

  // { "id":1, "item":object }
  @override
  void initState() {
    super.initState();
    updateItems();
  }

  void updateItems() {
    if (widget.map.containsKey('id')) {
      var cnt = 0;
      for (var item in items) {
        if (item.id.toString() == widget.map["id"]) {
          setState(() {
            items[cnt] = widget.map["item"];
            print("updatedddddddddddd");
          });
        }
        cnt++;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 40, // Adjust the width to the expected logo size
                        height:
                            45, // Adjust the height to the expected logo size
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 207, 206,
                              206), // Set the background color to grey
                          borderRadius: BorderRadius.circular(
                              10.0), // Set the border radius here
                        ),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'July 14, 2023',
                            style: TextStyle(
                                fontSize: 12, color: Color(0xffAAAAAA)),
                          ),
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Hello, ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Yonannes',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.notifications_on_outlined,
                      color: Color.fromARGB(255, 173, 173, 173),
                      size: 30,
                    ),
                    onPressed: () {
                      //
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.white), // White background
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          side: BorderSide(
                            color: Color.fromARGB(255, 219, 219, 219),
                          ),
                        ),
                      ),
                      padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.all(
                            5), // Adjust padding to control size
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 28.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Available Products',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          width: 1,
                          color: const Color(0xffD9D9D9),
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.search,
                          color: Color(0xffD9D9D9),
                          size: 30,
                        ),
                      ),
                    ),
                    onTap: () {
                      // _showSearchModal(context);
                      Navigator.pushNamed(
                        context,
                        '/search',
                      );
                    },
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];
                    return GestureDetector(
                      onTap: () async {
                        final product = await Navigator.pushNamed(
                          context,
                          '/detail',
                          arguments: item.id.toString(),
                        );
                        if (product == 'delete') {
                          for (final itm in items) {
                            if (itm.id == item.id) {
                              print('iddddddd ${items.length}');
                              setState(() {
                                items.remove(item);
                              });
                              print('iddddddd ${items.length}');
                            }
                          }
                        }
                      },
                      child: Card(
                        margin: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(40.0),
                                topRight: Radius.circular(40.0),
                              ),
                              child: Image.asset(
                                item.imageUrl,
                                width: 430,
                                height: 286,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(item.name,
                                          style: const TextStyle(fontSize: 18)),
                                      Text('\$${item.price}',
                                          style: const TextStyle(fontSize: 16)),
                                    ],
                                  ),
                                  const SizedBox(height: 4.0),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(item.description,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey,
                                            )),
                                      ),
                                      const Icon(Icons.star,
                                          color: Colors.amber, size: 16),
                                      Text(
                                        '(${item.rating})',
                                        style: const TextStyle(
                                            fontSize: 14, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xff3F51F3),
          shape: const CircleBorder(eccentricity: 0.7),
          onPressed: () async {
            final product = await Navigator.pushNamed(context, '/add') as Item;
            setState(() {
              items.add(product);
            });
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
            size: 35,
          ),
        ),
      ),
    );
  }
}
