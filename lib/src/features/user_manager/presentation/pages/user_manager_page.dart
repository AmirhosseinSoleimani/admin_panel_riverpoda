import 'package:admin_panel/src/features/user_manager/presentation/pages/widgets/large_widget.dart';
import 'package:admin_panel/src/features/user_manager/presentation/pages/widgets/small_widget.dart';
import 'package:admin_panel/src/shared/ui_kits/responsive_widget/responsive_widget.dart';
import 'package:flutter/material.dart';

class UserManagerPage extends StatelessWidget {
  static const userManagerPageName = '/user-manager-page';
  const UserManagerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveWidget(
      smallScreen: SmallWidgetUserManager(),
      largeScreen: LargeWidgetUserManager(),
    );
  }
}