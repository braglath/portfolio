import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio/core/constants/app_asset_path.dart';
import 'package:portfolio/core/extensions/context_extensions.dart';
import 'package:portfolio/shared/widgets/drop_shadow.dart';
import 'package:portfolio/shared/widgets/hover_tap_message.dart';

class HeroImage extends StatelessWidget {
  final BoxFit? fit;
  const HeroImage({super.key, this.fit = BoxFit.contain});

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
  Widget build(BuildContext context) => HoverTapMessage(
    messages: _messages,
    bubbleTop: context.isMobile ? 150 : 5,
    bubbleRight: context.isMobile ? 100 : 5,
    child: DropShadow(
      child: Image.asset(AppAssetPath.braglath, width: 500.h, fit: fit),
    ),
  );
}
