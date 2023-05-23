import "package:flutter/material.dart";

class AnimatumScreen extends StatelessWidget {
  static const nomen = "animated-screen";

  const AnimatumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Container"),
      ),
      body: const Placeholder(),
    );
  }
}
