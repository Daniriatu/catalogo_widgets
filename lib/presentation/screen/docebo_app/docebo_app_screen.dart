import "package:flutter/material.dart";

class DoceboAppScreen extends StatelessWidget {
  static const nomen = "tutorial-screen";

  const DoceboAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tutorial Container"),
      ),
      body: const Placeholder(),
    );
  }
}
