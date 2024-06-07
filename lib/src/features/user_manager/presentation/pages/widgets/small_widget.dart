import 'package:admin_panel/src/features/user_manager/presentation/pages/widgets/user_list/user_list_small.dart';
import 'package:admin_panel/src/shared/resources/resources.dart';
import 'package:flutter/material.dart';

class SmallWidgetUserManager extends StatelessWidget {
  const SmallWidgetUserManager({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(AppPadding.p16),
          child: Column(
            children: [
              UserListSmall(),
            ],
          ),
        ),
      ),
    );
  }
}