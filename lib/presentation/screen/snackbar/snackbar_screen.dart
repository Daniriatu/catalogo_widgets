import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

class SnackbarScreen extends StatelessWidget {
  static const nomen = "snackbar-screen";

  void viderePropriumSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackBar = SnackBar(
      content: const Text("Hola Mundo"),
      action: SnackBarAction(
        label: "OK!",
        onPressed: () {},
      ),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  const SnackbarScreen({super.key});

  void apertaDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("¿Estás seguro?"),
        content: const Text(
            "Do ipsum tempor amet in nulla excepteur ea velit. Magna in laborum eiusmod voluptate officia ipsum labore duis ad irure consequat quis eu. Deserunt in qui ad anim Lorem enim reprehenderit non incididunt do consectetur. Labore deserunt veniam duis magna sit. Culpa nostrud aliqua voluptate dolore officia fugiat amet consequat quis Lorem cupidatat laboris aliqua."),
        actions: [
          TextButton(
              onPressed: () => context.pop(), child: const Text("Cancelar")),
          FilledButton(
              onPressed: () => context.pop(), child: const Text("Aceptar"))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Snackbar y Diálogos"),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          FilledButton.tonal(
              onPressed: () {
                showAboutDialog(context: context, children: [
                  const Text(
                      "Do ullamco ex ut tempor do est ad. Anim veniam et excepteur deserunt anim labore incididunt. Non incididunt elit qui reprehenderit aliqua. Culpa dolore irure mollit ea aute. Tempor est minim id dolor enim velit incididunt in elit ut mollit.")
                ]);
              },
              child: const Text("Licencias usadas")),
          FilledButton.tonal(
              onPressed: () => apertaDialog(context),
              child: const Text("Mostrar Diálogo"))
        ]),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text("Mostrar Snackbar"),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => viderePropriumSnackbar(context),
      ),
    );
  }
}
