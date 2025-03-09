import "dart:io";

import "package:flutter_riverpod/flutter_riverpod.dart";

import "package:favorite_places/models/place_model.dart";

class PlaceNotifier extends StateNotifier<List<Place>> {
  PlaceNotifier() : super(const []);

  void addPlace(String place, File image) {
    final newPlace = Place(title: place, image: image);
    state = [newPlace, ...state];
  }
}

final placeProvider =
    StateNotifierProvider<PlaceNotifier, List<Place>>((ref) => PlaceNotifier());
