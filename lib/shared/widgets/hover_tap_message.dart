import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/app/theme/app_colors.dart';
import 'package:portfolio/app/theme/app_text_styles.dart';
import 'package:portfolio/core/extensions/context_extensions.dart';

class HoverTapMessage extends StatefulWidget {
  const HoverTapMessage({
    super.key,
    required this.child,
    this.messages,
    this.decoration,
    this.hoverDecoration,
    this.bubbleTop = 5,
    this.bubbleRight = -50,
    this.hoverScale = 1.03,
    this.slideOffset = const Offset(0, -0.015),
    this.cursor = SystemMouseCursors.click,
  });

  final Widget child;
  final List<String>? messages;

  /// Decoration applied in the normal state.
  final Decoration? decoration;

  /// Decoration applied while hovered/tapped.
  final Decoration? hoverDecoration;

  /// Position of the message bubble relative to the child.
  final double bubbleTop;
  final double bubbleRight;

  /// Scale applied to the child while hovered/tapped.
  final double hoverScale;

  /// Slight movement applied to the child while hovered/tapped.
  final Offset slideOffset;

  final MouseCursor cursor;

  @override
  State<HoverTapMessage> createState() => _HoverTapMessageState();
}

class _HoverTapMessageState extends State<HoverTapMessage> {
  final Random _random = Random();

  bool _isActive = false;
  String? _currentMessage;

  bool get _hasMessages =>
      widget.messages != null && widget.messages!.isNotEmpty;

  @override
  void initState() {
    super.initState();

    if (_hasMessages) {
      _currentMessage = widget.messages!.first;
    }
  }

  void _activate() {
    if (_hasMessages) {
      _setRandomMessage();
    }

    setState(() {
      _isActive = true;
    });
  }

  void _setRandomMessage() {
    final messages = widget.messages!;

    if (messages.length == 1) {
      _currentMessage = messages.first;
      return;
    }

    String nextMessage;

    do {
      nextMessage = messages[_random.nextInt(messages.length)];
    } while (nextMessage == _currentMessage);

    _currentMessage = nextMessage;
  }

  void _hide() {
    setState(() {
      _isActive = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: widget.cursor,
      onEnter: (_) => _activate(),
      onExit: (_) => _hide(),
      child: GestureDetector(
        onTap: context.isMobile || context.isTablet ? _activate : null,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            // Child
            AnimatedScale(
              scale: _isActive ? widget.hoverScale : 1.0,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeOutCubic,
              child: AnimatedSlide(
                offset: _isActive ? widget.slideOffset : Offset.zero,
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOutCubic,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeOutCubic,
                  decoration: _isActive
                      ? widget.hoverDecoration
                      : widget.decoration,
                  child: widget.child,
                ),
              ),
            ),

            // Message bubble
            if (_hasMessages)
              Positioned(
                top: widget.bubbleTop.h,
                right: widget.bubbleRight.w,
                child: IgnorePointer(
                  child: AnimatedOpacity(
                    opacity: _isActive ? 1 : 0,
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeOut,
                    child: AnimatedScale(
                      scale: _isActive ? 1 : 0.8,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOutBack,
                      child: _MessageBubble(message: _currentMessage!),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _MessageBubble extends StatelessWidget {
  const _MessageBubble({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 14.h),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: AppColors.border),
          boxShadow: const [
            BoxShadow(
              color: AppColors.shadow,
              blurRadius: 20,
              offset: Offset(0, 8),
            ),
          ],
        ),
        child: Text(
          message,
          style: AppTextStyles.bodyMedium(
            context,
          ).copyWith(color: AppColors.textPrimary, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
