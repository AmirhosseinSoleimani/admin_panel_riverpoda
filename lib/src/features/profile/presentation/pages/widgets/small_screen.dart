import 'package:admin_panel/src/features/profile/presentation/pages/widgets/profile_widget/profile_widget.dart';
import 'package:admin_panel/src/features/profile/presentation/pages/widgets/setting_widget/setting_widget.dart';
import 'package:admin_panel/src/shared/resources/resources.dart';
import 'package:flutter/material.dart';

class SmallScreenProfile extends StatelessWidget {
  const SmallScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(AppPadding.p16),
        child: Column(
          children: [
            SettingWidget(),
            Space.h16,
            ProfileWidget(),
            Space.h64,
          ],
        ),
      ),
    );
  }
}