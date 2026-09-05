import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_riverpod/legacy.dart';

final globalLoaderProvider = StateProvider<bool>((ref) => false);

class GlobalLoader extends ConsumerWidget {
  const GlobalLoader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(globalLoaderProvider);

    if (!isLoading) return const SizedBox.shrink();

    // final isLight = ThemeService().theme == ThemeMode.light;

    // final color = isLight
    //     ? AppColorsLight.mainLIGHTColor
    //     : AppColorsDark.mainDARKColor;

    return Stack(
      children: [
        // Dim background
        ModalBarrier(
          color: Colors.white.withValues(alpha: 0.5),
          dismissible: false,
        ),
        const Center(child: CircularProgressIndicator(strokeWidth: 5)),
        const Center(child: CircularProgressIndicator(strokeWidth: 5)),
      ],
    );
  }
}
