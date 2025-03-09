import "dart:io";

import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:path_provider/path_provider.dart" as syspaths;
import "package:path/path.dart" as path;
import "package:sqflite/sqflite.dart" as sql;
import "package:sqflite/sqlite_api.dart";

import "package:favorite_places/models/place_model.dart";

class PlaceNotifier extends StateNotifier<List<Place>> {
  PlaceNotifier() : super(const []);

  void addPlace(String place, File image) async {
    final appDir = await syspaths.getApplicationDocumentsDirectory();
    final imagePath = path.join(image.path);

    // Save the image file to the app's documents directory
    final copiedImage = await image.copy("${appDir.path}/$imagePath");

    final newPlace = Place(title: place, image: copiedImage);

    // add to sql database
    final databasePath = await sql.getDatabasesPath();
    final db = await sql.openDatabase(path.join(databasePath, "places.db"),
        onCreate: (db, version) async {
      return await db.execute(
          "CREATE TABLE user_places (id TEXT, title TEXT, place TEXT)");
    });

    db.insert("user_places", {
      "id": newPlace.id,
      "title": newPlace.title,
      "place": newPlace.image.path,
    });

    state = [newPlace, ...state];
  }
}

final placeProvider =
    StateNotifierProvider<PlaceNotifier, List<Place>>((ref) => PlaceNotifier());
