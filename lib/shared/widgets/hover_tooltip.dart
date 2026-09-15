import 'dart:async';

import 'package:flutter/material.dart';
import 'package:portfolio/app/theme/app_colors.dart';
import 'package:portfolio/app/theme/app_text_styles.dart';
import 'package:portfolio/core/enums/app_enums.dart';

class HoverTooltip extends StatefulWidget {
  const HoverTooltip({
    super.key,
    required this.message,
    required this.child,
    this.toolTipPosition = ToolTipPosition.top,
  });

  final String message;
  final Widget child;
  final ToolTipPosition toolTipPosition;

  @override
  State<HoverTooltip> createState() => _HoverTooltipState();
}

class _HoverTooltipState extends State<HoverTooltip> {
  bool _isVisible = false;
  Timer? _hideTimer;

  void _showTooltip() {
    _hideTimer?.cancel();

    if (!_isVisible) {
      setState(() => _isVisible = true);
    }

    // Auto hide after 3 seconds from being shown/refreshed.
    _hideTimer = Timer(const Duration(seconds: 3), _hideTooltip);
  }

  void _hideTooltip() {
    _hideTimer?.cancel();
    _hideTimer = null;

    if (_isVisible && mounted) {
      setState(() => _isVisible = false);
    }
  }

  @override
  void dispose() {
    _hideTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Tap anywhere outside the child to hide.
        if (_isVisible)
          Positioned.fill(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: _hideTooltip,
              child: const SizedBox.expand(),
            ),
          ),

        MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) => _showTooltip(),
          onExit: (_) => _hideTooltip(),
          child: GestureDetector(
            onLongPress: _showTooltip,

            // Tapping the child also hides the tooltip.
            onTap: _hideTooltip,

            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                widget.child,

                Positioned(
                  bottom: widget.toolTipPosition == ToolTipPosition.top
                      ? 58
                      : null,
                  left: widget.toolTipPosition == ToolTipPosition.right
                      ? 58
                      : null,
                  child: IgnorePointer(
                    child: AnimatedOpacity(
                      opacity: _isVisible ? 1 : 0,
                      duration: const Duration(milliseconds: 180),
                      curve: Curves.easeOut,
                      child: AnimatedSlide(
                        offset: _isVisible
                            ? Offset.zero
                            : const Offset(0, 0.15),
                        duration: const Duration(milliseconds: 180),
                        curve: Curves.easeOutCubic,
                        child: _TooltipBubble(
                          message: widget.message,
                          widget.toolTipPosition,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _TooltipBubble extends StatelessWidget {
  const _TooltipBubble(this.toolTipPosition, {required this.message});

  final String message;
  final ToolTipPosition toolTipPosition;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
          decoration: BoxDecoration(
            color: AppColors.textPrimary,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            message,
            style: AppTextStyles.label(
              context,
            ).copyWith(color: AppColors.surface, fontWeight: FontWeight.w500),
          ),
        ),
        if (toolTipPosition == ToolTipPosition.top)
          CustomPaint(
            size: const Size(10, 5),
            painter: _TooltipArrowPainter(color: AppColors.textPrimary),
          ),
      ],
    );
  }
}

class _TooltipArrowPainter extends CustomPainter {
  const _TooltipArrowPainter({required this.color});

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width / 2, size.height)
      ..close();

    canvas.drawPath(path, Paint()..color = color);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
