import 'package:catalogo_widgets/presentation/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThemeMutanteScreen extends ConsumerWidget {
  static const nomen = "theme_mutante_screen";

  const ThemeMutanteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool tenebrisModusEst = ref.watch(tenebrisModusProviderEst);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Theme mutante"),
        actions: [
          IconButton(
              onPressed: () {
                ref
                    .read(tenebrisModusProviderEst.notifier)
                    .update((state) => !state);
              },
              icon: Icon(tenebrisModusEst
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined))
        ],
      ),
      body: const _ThemeMutareVisu(),
    );
  }
}

class _ThemeMutareVisu extends ConsumerWidget {
  const _ThemeMutareVisu();

  @override
  Widget build(BuildContext context, ref) {
    final List<Color> colorum = ref.watch(colorumIndexProvider);

    final int electusColor = ref.watch(electusColorProvider);

    return ListView.builder(
      itemCount: colorum.length,
      itemBuilder: (context, index) {
        final Color color = colorum[index];
        return RadioListTile(
            title: Text(
              "Este color",
              style: TextStyle(color: color),
            ),
            subtitle: Text("${color.value}"),
            activeColor: color,
            value: index,
            groupValue: electusColor,
            onChanged: (value) {
              ref.read(electusColorProvider.notifier).state = index;
            });
      },
    );
  }
}
