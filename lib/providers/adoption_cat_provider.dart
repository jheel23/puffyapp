import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puffyapp/model/adoption_pets.dart';

class AdoptionCatNotifier extends StateNotifier<List<Map<String, dynamic>>> {
  AdoptionCatNotifier() : super([]);

  Future<void> getCats() async {
    state = adoptionPet
        .where((element) => element["discription"]["catagory"] == "cat")
        .toList();
  }
}

final adoptionCatProvider =
    StateNotifierProvider<AdoptionCatNotifier, List<Map<String, dynamic>>>(
        (ref) => AdoptionCatNotifier());
