import 'package:admin_panel/src/shared/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class ScaffoldWithNestedNavigation extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  const ScaffoldWithNestedNavigation({super.key, required this.navigationShell, required this.selectedIndex, required this.onDestinationSelected});

  @override
  Widget build(BuildContext context) {
    final textLocalization = AppLocalizations.of(context)!;
    return Scaffold(
      body: navigationShell,
      extendBody: true,
      bottomNavigationBar: NavigationBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        selectedIndex: selectedIndex,
        destinations: [
          NavigationDestination(label: textLocalization.home, icon: Icon(IconManager.home, size: AppSize.s24, color: Theme.of(context).colorScheme.onSecondary), selectedIcon: Icon(IconManager.homeFill, size: AppSize.s24, color: Theme.of(context).colorScheme.tertiary)),
          NavigationDestination(label: textLocalization.upload, icon: Icon(IconManager.upload, size: AppSize.s24, color: Theme.of(context).colorScheme.onSecondary,), selectedIcon: Icon(IconManager.uploadFill, size: AppSize.s24, color: Theme.of(context).colorScheme.tertiary),),
          NavigationDestination(label: textLocalization.userManager, icon: Icon(IconManager.personAdd, size: AppSize.s24, color: Theme.of(context).colorScheme.onSecondary), selectedIcon: Icon(IconManager.personAddFill, size: AppSize.s24, color: Theme.of(context).colorScheme.tertiary),),
          NavigationDestination(label: textLocalization.profile, icon:Icon(IconManager.person, size: AppSize.s24, color: Theme.of(context).colorScheme.onSecondary), selectedIcon: Icon(IconManager.personFill, size: AppSize.s24, color: Theme.of(context).colorScheme.tertiary),),
        ],
        onDestinationSelected: onDestinationSelected,
      ),
    );
  }
}