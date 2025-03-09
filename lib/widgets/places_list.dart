import "package:favorite_places/models/place_model.dart";
import "package:favorite_places/screens/place_detail.dart";
import "package:flutter/material.dart";

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.places});

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (ctx, index) => ListTile(
        leading: CircleAvatar(
          backgroundImage: FileImage(places[index].image),
          radius: 30,
        ),
        title: Text(places[index].title),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => PlaceDetailScreen(
                place: places[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
