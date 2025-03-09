import "package:flutter/material.dart";

class ImageInput extends StatefulWidget {
  const ImageInput({super.key});

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
        width: 1,
      )),
      height: 250,
      child: Center(
        child: TextButton.icon(
          onPressed: () {},
          label: const Text("Take Picture"),
          icon: const Icon(Icons.camera),
        ),
      ),
    );
  }
}
