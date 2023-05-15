import 'package:catalogo_widgets/config/router/app_router.dart';
import 'package:catalogo_widgets/config/theme/app_theme.dart';
import 'package:catalogo_widgets/presentation/providers/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final tenebrisModusEst = ref.watch(tenebrisModusProviderEst);
    final electusColor = ref.watch(electusColorProvider);

    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme(
              electusColor: electusColor, tenebrisModusEst: tenebrisModusEst)
          .getTheme(),
    );
  }
}
