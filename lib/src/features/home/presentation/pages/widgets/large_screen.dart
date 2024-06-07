import 'package:admin_panel/src/features/home/presentation/pages/widgets/user_chart/user_chart.dart';
import 'package:admin_panel/src/features/home/presentation/pages/widgets/user_device_chart/user_device_chart.dart';
import 'package:flutter/material.dart';
import 'container_blog/blog_overview_large.dart';

class LargeScreen extends StatelessWidget {
  const LargeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BlogOverviewLarge(),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          child: const Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(child: UserChart()),
              Expanded(child: UserDeviceChart()),
            ],
          ),
        ),
      ],
    );
  }
}
