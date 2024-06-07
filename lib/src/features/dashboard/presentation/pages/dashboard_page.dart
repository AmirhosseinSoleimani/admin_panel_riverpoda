import 'package:admin_panel/src/features/dashboard/presentation/bloc/dashboard_cubit.dart';
import 'package:admin_panel/src/features/dashboard/presentation/pages/widgets/scaffold_nested_navigation.dart';
import 'package:admin_panel/src/features/dashboard/presentation/pages/widgets/scaffold_nested_navigation_rail.dart';
import 'package:admin_panel/src/shared/ui_kits/responsive_widget/responsive_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key, required this.navigationShell});
  final StatefulNavigationShell navigationShell;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => DashboardCubit(),
      child: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          return ResponsiveWidget(
            smallScreen: ScaffoldWithNestedNavigation(
              navigationShell: navigationShell,
              selectedIndex: navigationShell.currentIndex,
              onDestinationSelected: (int index) {
                context.read<DashboardCubit>().updateNavigationIndexState(index);
                navigationShell.goBranch(
                  index,
                  initialLocation: index == navigationShell.currentIndex,
                );
              },),
            largeScreen: ScaffoldWithNestedNavigationRail(
              navigationShell: navigationShell,
              selectedIndex: navigationShell.currentIndex,
              onDestinationSelected: (int index) {
                context.read<DashboardCubit>().updateNavigationIndexState(index);
                navigationShell.goBranch(
                  index,
                  initialLocation: index == navigationShell.currentIndex,
                );
              },
            ),
          );
        },
      ),
    );
  }
}
