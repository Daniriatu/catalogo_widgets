import "package:flutter/material.dart";

class UiControlsScreen extends StatelessWidget {
  static const nomen = "ui_controls-screen";

  const UiControlsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("UiControls Container"),
      ),
      body: const Placeholder(),
    );
  }
}
