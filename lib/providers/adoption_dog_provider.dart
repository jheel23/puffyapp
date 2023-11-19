import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puffyapp/model/adoption_pets.dart';

class AdoptionDogNotifier extends StateNotifier<List<Map<String, dynamic>>> {
  AdoptionDogNotifier() : super([]);

  Future<void> getDogs() async {
    state = adoptionPet
        .where((element) => element["discription"]["catagory"] == "dog")
        .toList();
  }
}

final adoptiondogProvider =
    StateNotifierProvider<AdoptionDogNotifier, List<Map<String, dynamic>>>(
        (ref) => AdoptionDogNotifier());
