import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/app/theme/app_colors.dart';
import 'package:portfolio/core/enums/app_enums.dart';
import 'package:portfolio/shared/widgets/hover_tooltip.dart';

class SocialButtonsRow extends StatelessWidget {
  const SocialButtonsRow({super.key});

  @override
  Widget build(BuildContext context) => Row(
    spacing: 18.w,
    children: [
      _SocialIcons(
        message: "LinkedIn",
        onPressed: () {},
        icon: FontAwesomeIcons.linkedinIn,
        toolTipPosition: ToolTipPosition.top,
      ),
      _SocialIcons(
        message: "GitHub",
        onPressed: () {},
        icon: FontAwesomeIcons.github,
        toolTipPosition: ToolTipPosition.top,
      ),
      _SocialIcons(
        message: "Email",
        onPressed: () {},
        icon: FontAwesomeIcons.envelope,
        toolTipPosition: ToolTipPosition.top,
      ),
      _SocialIcons(
        message: "Download Resume",
        onPressed: () {},
        icon: FontAwesomeIcons.file,
        toolTipPosition: ToolTipPosition.top,
      ),
    ],
  );
}

class SocialButtonsColumn extends StatelessWidget {
  const SocialButtonsColumn({super.key});

  @override
  Widget build(BuildContext context) => Column(
    spacing: 36.w,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      _SocialIcons(
        message: "LinkedIn",
        onPressed: () {},
        icon: FontAwesomeIcons.linkedinIn,
        toolTipPosition: ToolTipPosition.right,
      ),
      _SocialIcons(
        message: "GitHub",
        onPressed: () {},
        icon: FontAwesomeIcons.github,
        toolTipPosition: ToolTipPosition.right,
      ),
      _SocialIcons(
        message: "Email",
        onPressed: () {},
        icon: FontAwesomeIcons.envelope,
        toolTipPosition: ToolTipPosition.right,
      ),
      _SocialIcons(
        message: "Download Resume",
        onPressed: () {},
        icon: FontAwesomeIcons.file,
        toolTipPosition: ToolTipPosition.right,
      ),
    ],
  );
}

class _SocialIcons extends StatelessWidget {
  final ToolTipPosition toolTipPosition;
  final String message;
  final void Function()? onPressed;
  final FaIconData? icon;
  const _SocialIcons({
    required this.message,
    required this.onPressed,
    required this.icon,
    required this.toolTipPosition,
  });

  @override
  Widget build(BuildContext context) => HoverTooltip(
    toolTipPosition: toolTipPosition,
    message: message,
    child: CircleAvatar(
      radius: 22,
      backgroundColor: AppColors.primary,
      child: IconButton(
        onPressed: onPressed,
        icon: FaIcon(icon, size: 22),
        color: AppColors.surface,
      ),
    ),
  );
}
