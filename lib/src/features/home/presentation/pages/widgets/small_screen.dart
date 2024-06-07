import 'package:admin_panel/src/features/home/presentation/pages/widgets/container_blog/blog_overview_small.dart';
import 'package:admin_panel/src/features/home/presentation/pages/widgets/user_chart/user_chart.dart';
import 'package:admin_panel/src/features/home/presentation/pages/widgets/user_device_chart/user_device_chart.dart';
import 'package:admin_panel/src/shared/resources/resources.dart';
import 'package:admin_panel/src/shared/resources/value_manager.dart';
import 'package:flutter/material.dart';

class SmallScreen extends StatelessWidget {
  const SmallScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          BlogOverviewSmall(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              UserChart(),
              UserDeviceChart(),
              Space.h64,
            ],
          ),
        ],
      ),
    );
  }
}