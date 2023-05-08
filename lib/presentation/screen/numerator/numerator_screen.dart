import 'package:catalogo_widgets/presentation/providers/numerator_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NumeratorScreen extends ConsumerWidget {
  static const String nomen = "numerator_screen";

  const NumeratorScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int clickNumerator = ref.watch(numeratorProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Numerator Screen'),
      ),
      body: Center(
          child: Text("Valor: $clickNumerator",
              style: Theme.of(context).textTheme.titleLarge)),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          // ref.read(numeratorProvider.notifier).state++;
          ref.read(numeratorProvider.notifier).update((state) => state + 1);
        },
      ),
    );
  }
}