import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puffyapp/model/adoption_pets.dart';

class AdoptionBirdsNotifier extends StateNotifier<List<Map<String, dynamic>>> {
  AdoptionBirdsNotifier() : super([]);

  Future<void> getBirds() async {
    state = adoptionPet
        .where((element) => element["discription"]["catagory"] == "bird")
        .toList();
  }
}

final adoptionBirdsProvider =
    StateNotifierProvider<AdoptionBirdsNotifier, List<Map<String, dynamic>>>(
        (ref) => AdoptionBirdsNotifier());
