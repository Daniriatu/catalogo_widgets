import 'package:catalogo_widgets/presentation/screen/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: "/", routes: [
  GoRoute(
    path: "/",
    name: DomusScreen.nomen,
    builder: (context, state) => const DomusScreen(),
  ),
  GoRoute(
    path: "/buttons",
    name: ButtonsScreen.nomen,
    builder: (context, state) => const ButtonsScreen(),
  ),
  GoRoute(
    path: "/cards",
    name: CardsScreen.nomen,
    builder: (context, state) => const CardsScreen(),
  ),
  GoRoute(
    path: "/progress",
    name: ProgressScreen.nomen,
    builder: (context, state) => const ProgressScreen(),
  ),
  GoRoute(
    path: "/numerator-river",
    name: NumeratorScreen.nomen,
    builder: (context, state) => const NumeratorScreen(),
  ),
  GoRoute(
    path: "/theme-mutante",
    name: ThemeMutanteScreen.nomen,
    builder: (context, state) => const ThemeMutanteScreen(),
  ),
]);
