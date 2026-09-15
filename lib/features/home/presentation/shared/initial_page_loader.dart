import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InitialPageLoader extends ConsumerWidget {
  const InitialPageLoader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        // Dim background
        ModalBarrier(
          color: Colors.white.withValues(alpha: 0.5),
          dismissible: false,
        ),
        const Center(child: CircularProgressIndicator(strokeWidth: 5)),
      ],
    );
  }
}
