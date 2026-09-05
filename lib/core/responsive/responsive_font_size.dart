import 'dart:ui';

double responsiveFontSize(
  double width, {
  required double min,
  required double max,
  required double minWidth,
  required double maxWidth,
}) {
  final progress = ((width - minWidth) / (maxWidth - minWidth)).clamp(0.0, 1.0);

  return lerpDouble(min, max, progress)!;
}
