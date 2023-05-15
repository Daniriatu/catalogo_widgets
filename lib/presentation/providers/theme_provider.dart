import 'package:catalogo_widgets/config/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final tenebrisModusProviderEst = StateProvider((ref) => false);

final colorumIndexProvider = Provider((ref) => colorum);

final electusColorProvider = StateProvider((ref) => 0);
