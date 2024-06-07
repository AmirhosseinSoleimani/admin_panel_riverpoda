import 'package:admin_panel/src/features/features.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Routes {
  static final parentNavigatorKey = GlobalKey<NavigatorState>();
  static final homeTabNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'homeTabNavigatorKey');
  static final profileTabNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'profileTabNavigatorKey');
  static final uploadTabNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'uploadTabNavigatorKey');
  static final userManagerTabNavigatorKey =
      GlobalKey<NavigatorState>(debugLabel: 'userManagerTabNavigatorKey');

  static final routes = GoRouter(
      navigatorKey: parentNavigatorKey,
      initialLocation: LoginPage.loginPageName,
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
            path: LoginPage.loginPageName,
            name: LoginPage.loginPageName,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return CustomTransitionPage(
                key: state.pageKey,
                transitionDuration: Duration.zero,
                transitionsBuilder:
                    (context, animation, secondaryAnimation, child) => child,
                child: const LoginPage(),
              );
            }),
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return DashboardPage(navigationShell: navigationShell);
          },
          parentNavigatorKey: parentNavigatorKey,
          branches: [
            StatefulShellBranch(
              navigatorKey: homeTabNavigatorKey,
              routes: [
                GoRoute(
                  path: HomePage.homePageName,
                  name: HomePage.homePageName,
                  pageBuilder: (context, state) {
                    return CustomTransitionPage(
                      key: state.pageKey,
                      transitionDuration: Duration.zero,
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) =>
                              child,
                      child: const HomePage(),
                    );
                  },
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: uploadTabNavigatorKey,
              routes: [
                GoRoute(
                  path: UploadPage.uploadPageName,
                  name: UploadPage.uploadPageName,
                  pageBuilder: (context, state) {
                    return CustomTransitionPage(
                      key: state.pageKey,
                      transitionDuration: Duration.zero,
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) =>
                              child,
                      child: const UploadPage(),
                    );
                  },
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: userManagerTabNavigatorKey,
              routes: [
                GoRoute(
                  path: UserManagerPage.userManagerPageName,
                  name: UserManagerPage.userManagerPageName,
                  pageBuilder: (context, state) {
                    return CustomTransitionPage(
                      key: state.pageKey,
                      transitionDuration: Duration.zero,
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) =>
                              child,
                      child: const UserManagerPage(),
                    );
                  },
                ),
              ],
            ),
            StatefulShellBranch(
              navigatorKey: profileTabNavigatorKey,
              routes: [
                GoRoute(
                  path: ProfilePage.profilePageName,
                  name: ProfilePage.profilePageName,
                  pageBuilder: (context, state) {
                    return CustomTransitionPage(
                      key: state.pageKey,
                      transitionDuration: Duration.zero,
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) =>
                              child,
                      child: const ProfilePage(),
                    );
                  },
                ),
              ],
            ),
          ],
        )
      ]);

  static Page getPage({
    required Widget child,
    required GoRouterState state,
    required String name,
  }) {
    return MaterialPage(
      key: state.pageKey,
      child: child,
      name: name,
    );
  }
}
