import 'package:flutter/material.dart';
import 'package:task_6/detail_page.dart';
import 'package:task_6/item.dart';
import 'package:task_6/widgets/button_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    void _showSearchModal(BuildContext context) {
      double _currentPrice = 50;
      showModalBottomSheet(
        context: context,
        isScrollControlled: false,
        barrierColor: Colors.transparent,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
        ),
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                bottom: 20,
                left: 20,
                right: 20,
                top: 20,
              ),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Category',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onChanged: (value) {
                          // Add logic to filter by name
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Price',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      Slider(
                        value: _currentPrice,
                        min: 0,
                        max: 100,
                        divisions: 100,
                        label: _currentPrice.round().toString(),
                        onChanged: (double value) {
                          // setState(() {
                          //   _currentPrice = value;
                          // });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ButtonWidget(
                    title: 'Apply',
                    isFilled: true,
                    buttonWidth: double.infinity,
                    onPressed: () {},
                  )
                ],
              ),
            ),
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
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
              const EdgeInsets.all(16), // Adjust padding to control size
            ),
          ),
        ),
        title: const Expanded(
          child: Center(
            child: Text(
              'Search Product',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              children: [
                const Expanded(
                  child: SizedBox(
                    height: 50,
                    child: TextField(
                      maxLines: 1,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 209, 207, 207),
                          ),
                        ),
                        suffixIcon: Icon(
                          Icons.arrow_forward,
                          color: Color(0xff3F51F3),
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: const Color(0xff3F51F3),
                      borderRadius: BorderRadius.circular(5)),
                  child: IconButton(
                    icon: const Icon(
                      Icons.filter_list,
                      size: 30,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      _showSearchModal(context);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return DetailPage(
                              id: item.id.toString(),
                            );
                          },
                        ),
                      );
                    },
                    child: Card(
                      margin: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(
                                  32.0), // Adjust the radius as needed
                              topRight: Radius.circular(
                                  32.0), // Adjust the radius as needed
                            ),
                            child: Image.asset(
                              item.imageUrl,
                              width: double.infinity,
                              height: 250,
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
    );
  }
}
