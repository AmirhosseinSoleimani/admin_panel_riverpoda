import 'package:admin_panel/src/features/home/presentation/pages/widgets/large_screen.dart';
import 'package:admin_panel/src/features/home/presentation/pages/widgets/small_screen.dart';
import 'package:admin_panel/src/shared/resources/resources.dart';
import 'package:admin_panel/src/shared/ui_kits/ui_kits.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const homePageName = '/home-page';
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppPadding.p16),
          child: ResponsiveWidget(
            smallScreen: SmallScreen(),
            largeScreen: LargeScreen(),
          ),
        ),
      ),
    );
  }
}