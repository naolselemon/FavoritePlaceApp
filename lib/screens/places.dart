import "package:favorite_places/provider/place_provider.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "package:favorite_places/screens/add_place.dart";
import "package:favorite_places/widgets/places_list.dart";

class PlacesScreen extends ConsumerStatefulWidget {
  const PlacesScreen({super.key});

  @override
  ConsumerState<PlacesScreen> createState() => _PlacesState();
}

class _PlacesState extends ConsumerState<PlacesScreen> {
  void addNewPlace() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => const AddPlaceScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final places = ref.watch(placeProvider);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
          title: Text(
            "Great Places",
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: addNewPlace,
            ),
          ],
        ),
        body: PlacesList(places: places));
  }
}
