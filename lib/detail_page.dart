import 'package:flutter/material.dart';
import 'item.dart';
import 'widgets/button_widget.dart';
import 'widgets/number_card.dart';

class DetailPage extends StatefulWidget {
  final String id;
  const DetailPage({super.key, required this.id});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  void _deleteItem() {
    Navigator.pop(context, 'delete');
  }

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
        print('imaggggaaa ${ourItem}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                    ),
                    child: Image.asset(
                      ourItem.imageUrl,
                      width: 430,
                      height: 286,
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
                        backgroundColor:
                            WidgetStateProperty.all<Color>(Colors.white),
                        shape: WidgetStateProperty.all<OutlinedBorder>(
                          const CircleBorder(),
                        ),
                        padding: WidgetStateProperty.all<EdgeInsets>(
                          const EdgeInsets.all(10),
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
                          child: Text(ourItem.description,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              )),
                        ),
                        const Icon(Icons.star, color: Colors.amber, size: 16),
                        Text('(${ourItem.rating})',
                            style: const TextStyle(
                                fontSize: 14, color: Colors.grey)),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(ourItem.name,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            )),
                        Text('\$${ourItem.price}',
                            style: const TextStyle(fontSize: 16)),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Size:',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                      'A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system,'
                      'where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature '
                      'provides a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are '
                      'typically made of high-quality leather, known for its durability and elegance, making them suitable for both formal'
                      ' and casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.',
                      style: TextStyle(fontSize: 14),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ButtonWidget(
                          title: 'DELETE',
                          buttonWidth: 152,
                          isFilled: false,
                          onPressed: () {
                            _deleteItem();
                          },
                        ),
                        ButtonWidget(
                          title: 'UPDATE',
                          buttonWidth: 152,
                          isFilled: true,
                          onPressed: () {
                            Navigator.pushNamed(context, '/update',
                                arguments: ourItem.id.toString());
                          },
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
