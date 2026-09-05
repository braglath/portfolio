import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/app/theme/app_colors.dart';
import 'package:portfolio/features/home/presentation/shared/about_description.dart';
import 'package:portfolio/features/home/presentation/shared/hero_image.dart';
import 'package:portfolio/features/home/presentation/shared/hero_name.dart';
import 'package:portfolio/features/home/presentation/shared/home_services.dart';
import 'package:portfolio/features/home/presentation/shared/i_am_text.dart';
import 'package:portfolio/shared/widgets/appbar/lets_talk_button.dart';
import 'package:portfolio/shared/widgets/appbar/nav_items.dart';
import 'package:portfolio/shared/widgets/social_buttons.dart';

class HomeScreenMobile extends StatefulWidget {
  const HomeScreenMobile({super.key});

  @override
  State<HomeScreenMobile> createState() => _HomeScreenMobileState();
}

class _HomeScreenMobileState extends State<HomeScreenMobile> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _letsTalkKey = GlobalKey();

  bool _showFloatingButton = true;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    final context = _letsTalkKey.currentContext;

    if (context == null) return;

    final renderObject = context.findRenderObject();

    if (renderObject is! RenderBox) return;

    final position = renderObject.localToGlobal(Offset.zero);
    final size = renderObject.size;

    final screenHeight = MediaQuery.sizeOf(context).height;

    final top = position.dy;
    final bottom = top + size.height;

    final isVisible = bottom > 0 && top < screenHeight;

    if (_showFloatingButton != !isVisible) {
      setState(() {
        _showFloatingButton = !isVisible;
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentRoute = GoRouterState.of(context).uri.path;

    return Scaffold(
      floatingActionButton: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: _showFloatingButton
            ? const LetsTalkButton(key: ValueKey('floating-lets-talk'))
            : const SizedBox.shrink(key: ValueKey('hidden-lets-talk')),
      ),

      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 56.h),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: IAmText(),
            ),

            Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    alignment: Alignment.centerLeft,
                    child: HeroName(),
                  ),
                ),
                const HeroImage(),
              ],
            ),

            Container(
              color: AppColors.shadow,
              width: double.infinity,
              padding: EdgeInsets.only(top: 16.h),
              child: Column(
                spacing: 8.h,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.h,
                      vertical: 8.h,
                    ),
                    child: AboutDescription(),
                  ),
                  Row(
                    spacing: 16.h,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: GetHome.services(size: 300),
                  ),
                  SizedBox(height: 8.h),
                  Padding(
                    padding: EdgeInsets.all(16.h),
                    child: Row(
                      spacing: 16.h,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SocialButtonsRow(),
                        KeyedSubtree(
                          key: _letsTalkKey,
                          child: LetsTalkButton(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Container(
                    color: AppColors.overlay,
                    padding: EdgeInsets.all(16.h),
                    child: NavItems(
                      currentRoute,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
