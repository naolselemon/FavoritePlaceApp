import "dart:io";

import "package:favorite_places/widgets/location_input.dart";
import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "package:favorite_places/widgets/image_input.dart";
import "package:favorite_places/provider/place_provider.dart";
import "package:favorite_places/main.dart";

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File? _selectedImage;

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  void _savePlace() {
    if (_titleController.text.isEmpty || _selectedImage == null) {
      return;
    }
    ref
        .read(placeProvider.notifier)
        .addPlace(_titleController.text.trim(), _selectedImage!);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
          title: const Text("Add Favorite Place")),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
              decoration: InputDecoration(
                hintText: "Add Favorite Place",
                hintStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: colorScheme.onSurface,
                    ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ImageInput(onPickImage: (image) {
              setState(() {
                _selectedImage = image;
              });
            }),
            const SizedBox(
              height: 12,
            ),
            ElevatedButton.icon(
              onPressed: _savePlace,
              label: const Text("Add Place"),
              icon: const Icon(Icons.add),
            ),
            const SizedBox(
              height: 12,
            ),
            LocationInput()
          ],
        ),
      ),
    );
  }
}
