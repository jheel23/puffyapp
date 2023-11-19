import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class PetDetailsScreen extends StatefulWidget {
  const PetDetailsScreen({super.key});
  static const routeName = '/pet-details-screen';

  @override
  State<PetDetailsScreen> createState() => _PetDetailsScreenState();
}

class _PetDetailsScreenState extends State<PetDetailsScreen> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    final animal =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                height: 400,
                child: FadeInImage(
                    fit: BoxFit.cover,
                    width: double.infinity,
                    placeholder:
                        const AssetImage('assets/images/placeholder.png'),
                    image: NetworkImage(animal['discription']['image'])),
              ),
              Container(
                height: 400,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.white, Colors.transparent],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter),
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  animal['breed'],
                  style: const TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  animal['discription']['about'],
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                      wordSpacing: 4),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              children: [
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.amber.withOpacity(0.4),
                            offset: const Offset(0, 5),
                            blurRadius: 10)
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        IconButton(
                            padding: const EdgeInsets.all(0),
                            onPressed: () {
                              setState(() {
                                if (quantity >= 1) {
                                  quantity--;
                                }
                              });
                            },
                            icon: const Icon(
                              Ionicons.remove,
                              size: 20,
                            )),
                        Text(
                          '$quantity',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            padding: const EdgeInsets.all(0),
                            onPressed: () {
                              setState(() {
                                quantity++;
                              });
                            },
                            icon: const Icon(
                              Ionicons.add,
                              size: 20,
                            )),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                Text(
                  '${animal['discription']['price']}.00',
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            margin: const EdgeInsets.all(10),
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
              ),
              child: const Text('Check Out'),
            ),
          )
        ],
      ),
    );
  }
}
