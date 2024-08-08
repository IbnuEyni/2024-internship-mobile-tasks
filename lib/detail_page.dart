import 'package:flutter/material.dart';
import 'package:task_6/add_item_page.dart';
import 'package:task_6/widgets/button_widget.dart';
import 'package:task_6/widgets/number_card.dart';
import 'main.dart';

class DetailPage extends StatelessWidget {
  final Item item;
  const DetailPage({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft:
                        Radius.circular(32.0), // Adjust the radius as needed
                    topRight:
                        Radius.circular(32.0), // Adjust the radius as needed
                  ),
                  child: Image.asset(
                    item.imageUrl,
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 10,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    iconSize: 20,
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
                            10), // Adjust padding to control size
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(item.description,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            )),
                      ),
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      Text('(${item.rating})',
                          style: const TextStyle(
                              fontSize: 14, color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(item.name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          )),
                      Text('\$${item.price}',
                          style: const TextStyle(fontSize: 16)),
                    ],
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'Size:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16.0),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 6.0),
                    height: 50,
                    child: ListView.builder(
                      itemBuilder: (context, index) {
                        return NumberCard(size: '${index + 39}');
                      },
                      scrollDirection: Axis.horizontal,
                      itemCount: 6,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    'A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.',
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const ButtonWidget(
                        title: 'DELETE',
                        buttonWidth: 152,
                        isFilled: false,
                      ),
                      ButtonWidget(
                        title: 'UPDATE',
                        buttonWidth: 152,
                        isFilled: true,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
