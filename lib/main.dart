import 'package:catalogo_widgets/config/theme/app_theme.dart';
import 'package:catalogo_widgets/screen/buttons/buttons_screen.dart';
import 'package:catalogo_widgets/screen/cards/cards_screen.dart';
import 'package:catalogo_widgets/screen/domus/domus_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme(electusColor: 0).getTheme(),
        home: const DomusScreen(),
        routes: {
          "/buttons": (context) => const ButtonsScreen(),
          "/cards": (context) => const CardsScreen(),
        });
  }
}
