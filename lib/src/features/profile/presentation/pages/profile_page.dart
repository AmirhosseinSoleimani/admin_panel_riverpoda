import 'package:admin_panel/src/features/profile/presentation/pages/widgets/large_screen.dart';
import 'package:admin_panel/src/features/profile/presentation/pages/widgets/small_screen.dart';
import 'package:admin_panel/src/shared/ui_kits/responsive_widget/responsive_widget.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  static const profilePageName = '/profile-page';
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: ResponsiveWidget(
          smallScreen: SmallScreenProfile(),
          largeScreen: LargeScreenProfile(),
        ),
      ),
    );
  }
}