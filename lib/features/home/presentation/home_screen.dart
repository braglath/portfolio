import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/app/theme/app_colors.dart';
import 'package:portfolio/app/theme/app_text_styles.dart';
import 'package:portfolio/core/constants/app_asset_path.dart';
import 'package:portfolio/core/extensions/context_extensions.dart';
import 'package:portfolio/shared/widgets/appbar/lets_talk_button.dart';
import 'package:portfolio/shared/widgets/drop_shadow.dart';
import 'package:portfolio/shared/widgets/hover_tap_message.dart';
import 'package:portfolio/shared/widgets/hover_tooltip.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: Colors.transparent,
    body: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        const _HeroImage(),
        Positioned.fill(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const _AboutText(),
                      SizedBox(height: 24.h),
                      const _SocialButtons(),
                    ],
                  ),
                ),
                SizedBox(width: 48.w),
                if (context.isDesktop) ...[
                  Expanded(child: _HeroSkillsDesktop()),
                ] else if (context.isTablet) ...[
                  // if device widget is greater than 750px, then show the tablet widget
                  if (MediaQuery.sizeOf(context).width > 750) ...[
                    Expanded(child: _HeroSkillsTabletColumn()),
                  ],
                ],
              ],
            ),
          ),
        ),
      ],
    ),
    floatingActionButton: context.isMobile ? const LetsTalkButton() : null,
  );
}

class _HeroSkillsDesktop extends StatelessWidget {
  const _HeroSkillsDesktop();

  @override
  Widget build(BuildContext context) => Stack(
    clipBehavior: Clip.none,
    children: [
      PositionedHomeServices(
        top: 0.h,
        left: 100.w,
        right: 100.w,
        bottom: 200.h,
        assetImagePath: AppAssetPath.crossPlatform,
        label: "Cross-Platform",
      ),

      PositionedHomeServices(
        top: 200.h,
        left: 400.w,
        bottom: 150.h,
        right: 0.w,
        assetImagePath: AppAssetPath.architecture,
        label: "Architecture",
      ),

      PositionedHomeServices(
        top: 425.h,
        left: 100.w,
        right: 50.w,
        bottom: 0.h,
        assetImagePath: AppAssetPath.optimization,
        label: "Optimization",
      ),
    ],
  );
}

class _HeroSkillsTabletColumn extends StatelessWidget {
  const _HeroSkillsTabletColumn();

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(right: 18.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: _homeServices,
    ),
  );
}

List<HomeServices> get _homeServices => [
  HomeServices(
    assetImagePath: AppAssetPath.crossPlatform,
    label: "Cross-Platform",
  ),

  HomeServices(
    assetImagePath: AppAssetPath.architecture,
    label: "Architecture",
  ),

  HomeServices(
    assetImagePath: AppAssetPath.optimization,
    label: "Optimization",
  ),
];

class PositionedHomeServices extends StatelessWidget {
  final double? top;
  final double? left;
  final double? right;
  final double? bottom;

  final String assetImagePath;
  final String label;

  const PositionedHomeServices({
    super.key,
    this.top,
    this.left,
    this.right,
    this.bottom,
    required this.assetImagePath,
    required this.label,
  });

  @override
  Widget build(BuildContext context) => Positioned(
    top: top?.h,
    left: left?.w,
    right: right?.w,
    bottom: bottom?.h,
    child: HomeServices(assetImagePath: assetImagePath, label: label),
  );
}

class HomeServices extends StatelessWidget {
  final String assetImagePath;
  final String label;

  const HomeServices({
    super.key,
    required this.assetImagePath,
    required this.label,
  });

  @override
  Widget build(BuildContext context) => Column(
    children: [
      Image.asset(
        assetImagePath,
        width: 200.w,
        height: 200.w,
        fit: BoxFit.contain,
      ),
      Container(
        margin: EdgeInsets.only(top: 8.h),
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: AppColors.primaryLight,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Text(
          label,
          style: AppTextStyles.bodyLarge(
            context,
          ).copyWith(fontWeight: FontWeight.bold, color: AppColors.textPrimary),
        ),
      ),
    ],
  );
}

class _SocialButtons extends StatelessWidget {
  const _SocialButtons();

  @override
  Widget build(BuildContext context) => Row(
    spacing: 18.w,
    children: [
      _SocialIcons(
        message: "LinkedIn",
        onPressed: () {},
        icon: FontAwesomeIcons.linkedinIn,
      ),
      _SocialIcons(
        message: "GitHub",
        onPressed: () {},
        icon: FontAwesomeIcons.github,
      ),
      _SocialIcons(
        message: "Email",
        onPressed: () {},
        icon: FontAwesomeIcons.envelope,
      ),
      _SocialIcons(
        message: "Download Resume",
        onPressed: () {},
        icon: FontAwesomeIcons.file,
      ),
    ],
  );
}

class _SocialIcons extends StatelessWidget {
  final String message;
  final void Function()? onPressed;
  final FaIconData? icon;
  const _SocialIcons({
    required this.message,
    required this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) => HoverTooltip(
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

class _AboutText extends StatelessWidget {
  const _AboutText();

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("Hello, I'm", style: AppTextStyles.displaySmall(context)),
      Stack(
        children: [
          // Offset outline
          Text(
            'Braglath',
            style: AppTextStyles.displayMedium(context).copyWith(
              letterSpacing: 5,
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 3.0
                ..color = AppColors.border,
            ),
          ),
          // Main text
          Text(
            'Braglath',
            style: AppTextStyles.displayMedium(
              context,
            ).copyWith(letterSpacing: 4, color: AppColors.textPrimary),
          ),
        ],
      ),
      SizedBox(height: 16.h),
      Container(
        width: MediaQuery.sizeOf(context).width * 0.3,
        alignment: Alignment.centerLeft,
        child: Text(
          "A Flutter developer and Technical Lead with 8+ years of software development experience, passionate about turning ideas into scalable, high-performance digital products through clean architecture and thoughtful engineering.",
          style: AppTextStyles.bodyLarge(
            context,
          ).copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.left,
        ),
      ),
    ],
  );
}

class _HeroImage extends StatelessWidget {
  const _HeroImage();

  static const _messages = [
    "Hey! 👋\nLet's build something.",
    "Nice to see you here! 🚀",
    "Got an idea?\nLet's make it real.",
    "Flutter + creativity = ❤️",
    "Let's turn ideas into apps. ✨",
    "Have a project in mind?\nLet's talk! 💬",
    "Good ideas deserve\ngreat code. 💡",
    "Let's build something\nawesome together! 🚀",
    "Your next idea\ncould be an app. 📱",
    "Ready to create\nsomething amazing? ✨",
    "Let's make your idea\ncome to life. 🛠️",
    "Think it. Build it.\nShip it. 🚀",
    "Great products start\nwith great ideas. 💡",
    "Need an app?\nI've got you covered. 😎",
  ];

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: (context.isTablet && MediaQuery.sizeOf(context).width < 750)
          ? 0.w
          : null,
      child: HoverTapMessage(
        messages: _messages,
        bubbleTop: 5,
        bubbleRight: 5,
        child: DropShadow(
          child: Image.asset(
            AppAssetPath.braglath,
            width: 500.h,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
