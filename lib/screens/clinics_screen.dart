import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class ClinicsScreen extends StatelessWidget {
  const ClinicsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          automaticallyImplyLeading: false,
          title: Text('Clinics'),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: MediaQuery.of(context).size.height,
            margin: const EdgeInsets.symmetric(horizontal: 17),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Location',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Icon(
                      Ionicons.location_outline,
                      color: Colors.black54,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                              text: 'Vijayawada, ',
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.black,
                              )),
                          TextSpan(
                              text: 'AP',
                              style: TextStyle(
                                fontSize: 24,
                                color: Colors.black54,
                              )),
                        ],
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Ionicons.refresh,
                        size: 18,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    const Text(
                      'Best Speacialists nearby',
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                    const Spacer(),
                    TextButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 14,
                        color: Colors.black54,
                      ),
                      label: const Text(
                        'See all',
                        style: TextStyle(color: Colors.black54, fontSize: 12),
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => Container(
                      height: 100,
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: const BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            width: 60,
                            height: 60,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.network(
                                'https://media.istockphoto.com/id/1462768515/photo/black-woman-with-business-documents-small-business-entrepreneur-working-on-strategy-and.jpg?s=2048x2048&w=is&k=20&c=I10Ox_dgKILQDXbU_U61rYCzBs-1my7p3aAW2ojmI2o=',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Clinic No. $index',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              const Text(
                                'Vijayawada,AP',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black54),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 15,
                                  ),
                                  Text(
                                    ' 4.7',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black),
                                  )
                                ],
                              ),
                            ],
                          ),
                          const Spacer(),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: 100,
                              width: 50,
                              alignment: Alignment.bottomRight,
                              child: Container(
                                  height: 30,
                                  width: 30,
                                  margin: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      color: Colors.amber,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: const Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: Colors.white,
                                    size: 15,
                                  )),
                            ),
                          )
                        ],
                      ),
                    ),
                    itemCount: 5,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
