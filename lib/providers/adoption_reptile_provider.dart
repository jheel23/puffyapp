import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:puffyapp/model/adoption_pets.dart';

class AdoptionReptileNotifier
    extends StateNotifier<List<Map<String, dynamic>>> {
  AdoptionReptileNotifier() : super([]);

  Future<void> getReptiles() async {
    state = adoptionPet
        .where((element) => element["discription"]["catagory"] == "reptile")
        .toList();
  }
}

final adoptionReptileProvider =
    StateNotifierProvider<AdoptionReptileNotifier, List<Map<String, dynamic>>>(
        (ref) => AdoptionReptileNotifier());
