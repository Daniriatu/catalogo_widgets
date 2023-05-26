import "dart:math";
import "package:flutter/material.dart";

class AnimatumScreen extends StatefulWidget {
  static const nomen = "animated-screen";

  const AnimatumScreen({super.key});

  @override
  State<AnimatumScreen> createState() => _AnimatumScreenState();
}

class _AnimatumScreenState extends State<AnimatumScreen> {
  double latitudo = 50;
  double altitudo = 50;
  Color color = Colors.indigo;
  double terminusRadio = 10.0;

  void mutatioFigura() {
    final random = Random();
    latitudo = random.nextInt(300) + 120;
    altitudo = random.nextInt(300) + 120;
    terminusRadio = random.nextInt(100) + 20;

    color = Color.fromRGBO(
        random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Animated Container"),
      ),
      body: Center(
        child: AnimatedContainer(
          width: latitudo <= 0 ? 0 : latitudo,
          height: altitudo <= 0 ? 0 : altitudo,
          duration: const Duration(milliseconds: 400),
          curve: Curves.elasticOut,
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(
                  terminusRadio <= 0 ? 0 : terminusRadio)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: mutatioFigura,
        child: const Icon(Icons.play_arrow_rounded),
      ),
    );
  }
}
