import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ionicons/ionicons.dart';
import 'package:puffyapp/providers/adoption_birds_provider.dart';
import 'package:puffyapp/providers/adoption_cat_provider.dart';
import 'package:puffyapp/providers/adoption_dog_provider.dart';
import 'package:puffyapp/providers/adoption_reptile_provider.dart';

class AdoptPetWidget extends ConsumerStatefulWidget {
  const AdoptPetWidget({super.key});

  @override
  ConsumerState<AdoptPetWidget> createState() => _AdoptPetWidgetState();
}

class _AdoptPetWidgetState extends ConsumerState<AdoptPetWidget> {
  int _currentTab = 0;
  List<Map<String, dynamic>> dogs = [];
  List<Map<String, dynamic>> cats = [];
  List<Map<String, dynamic>> birds = [];
  List<Map<String, dynamic>> reptiles = [];
  @override
  void didChangeDependencies() {
    ref.read(adoptiondogProvider.notifier).getDogs();
    ref.read(adoptionCatProvider.notifier).getCats();
    ref.read(adoptionBirdsProvider.notifier).getBirds();
    ref.read(adoptionReptileProvider.notifier).getReptiles();
    reptiles = ref.watch(adoptionReptileProvider);
    birds = ref.watch(adoptionBirdsProvider);
    dogs = ref.watch(adoptiondogProvider);
    cats = ref.watch(adoptionCatProvider);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(adoptiondogProvider);
    ref.watch(adoptionCatProvider);
    ref.watch(adoptionBirdsProvider);

    final deviceSize = MediaQuery.of(context).size;
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0.0,
          pinned: false,
          floating: true,
          title: const Text('Hi, there!',
              style: TextStyle(
                  color: Colors.black54, fontWeight: FontWeight.bold)),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Ionicons.notifications_outline,
                  size: 20,
                ))
          ],
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 1))
                    ]),
                child: const TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search',
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Ionicons.search_outline)),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Categories',
                  style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    //1
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _currentTab = 0;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            alignment: Alignment.center,
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                color: _currentTab == 0
                                    ? Colors.amber
                                    : Colors.white,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      color: _currentTab == 0
                                          ? Colors.amber.withOpacity(0.2)
                                          : Colors.grey.withOpacity(0.2),
                                      spreadRadius: 1,
                                      blurRadius: 5,
                                      offset: const Offset(2, 5))
                                ]),
                            child: const Text(
                              '😺',
                              style: TextStyle(fontSize: 35),
                            ),
                          ),
                        ),
                        const Text('Cat')
                      ],
                    ),
                    //2
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _currentTab = 1;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            alignment: Alignment.center,
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                color: _currentTab == 1
                                    ? Colors.amber
                                    : Colors.white,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      color: _currentTab == 1
                                          ? Colors.amber.withOpacity(0.2)
                                          : Colors.grey.withOpacity(0.2),
                                      spreadRadius: 1,
                                      blurRadius: 5,
                                      offset: const Offset(2, 5))
                                ]),
                            child: const Text(
                              '🐶',
                              style: TextStyle(fontSize: 35),
                            ),
                          ),
                        ),
                        const Text('Dog')
                      ],
                    ),
                    //3
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _currentTab = 2;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            alignment: Alignment.center,
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                color: _currentTab == 2
                                    ? Colors.amber
                                    : Colors.white,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      color: _currentTab == 2
                                          ? Colors.amber.withOpacity(0.2)
                                          : Colors.grey.withOpacity(0.2),
                                      spreadRadius: 1,
                                      blurRadius: 5,
                                      offset: const Offset(2, 5))
                                ]),
                            child: const Text(
                              '🕊️',
                              style: TextStyle(fontSize: 35),
                            ),
                          ),
                        ),
                        const Text('Birds')
                      ],
                    ),
                    //4
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _currentTab = 3;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.all(10),
                            alignment: Alignment.center,
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                color: _currentTab == 3
                                    ? Colors.amber
                                    : Colors.white,
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      color: _currentTab == 3
                                          ? Colors.amber.withOpacity(0.2)
                                          : Colors.grey.withOpacity(0.2),
                                      spreadRadius: 1,
                                      blurRadius: 5,
                                      offset: const Offset(2, 5))
                                ]),
                            child: const Text(
                              '🐍',
                              style: TextStyle(fontSize: 35),
                            ),
                          ),
                        ),
                        const Text('Reptiles')
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              if (_currentTab == 0)
                CategoriesWidget(deviceSize: deviceSize, animals: cats),
              if (_currentTab == 1)
                CategoriesWidget(deviceSize: deviceSize, animals: dogs),
              if (_currentTab == 2)
                CategoriesWidget(deviceSize: deviceSize, animals: birds),
              if (_currentTab == 3)
                CategoriesWidget(deviceSize: deviceSize, animals: reptiles),
            ],
          ),
        ),
      ],
    );
  }
}

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({
    Key? key,
    required this.deviceSize,
    required this.animals,
  }) : super(key: key);

  final Size deviceSize;
  final List<Map<String, dynamic>> animals;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.spaceBetween,
      spacing: deviceSize.width * 0.05,
      runSpacing: 20,
      children: List.generate(
          animals.length,
          (index) => GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/pet-details-screen',
                      arguments: animals[index]);
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: deviceSize.width * 0.4,
                    height: 180,
                    decoration: BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 1))
                    ]),
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Container(
                              height: 180,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                color: Colors.amber,
                              ),
                              child: Image.network(
                                animals[index]['discription']['image'] ??
                                    'https://www.tradeindia.com/_next/image/?url=https%3A%2F%2Ftiimg.tistatic.com%2Ffp%2F1%2F007%2F843%2F6-month-old-healthy-labrador-white-both-gender-live-pet-dog-12kg-weight--121.jpg&w=750&q=75',
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              height: 180,
                              width: double.infinity,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [Colors.transparent, Colors.black]),
                              ),
                            ),
                            Container(
                              height: 180,
                              width: double.infinity,
                              padding: const EdgeInsets.all(5),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    animals[index]['breed'] ?? 'Dog Name',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: deviceSize.height * 0.005,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                          '● ${animals[index]['life_expectency']} ',
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold)),
                                      const Text('Yrs',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                  SizedBox(
                                    height: deviceSize.height * 0.01,
                                  ),
                                  Text(
                                      ' ${animals[index]['discription']['price']}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                      ))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )),
    );
  }
}
