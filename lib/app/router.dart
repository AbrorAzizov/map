import 'package:boycot/app/routes.dart';
import 'package:boycot/features/shell/layout_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Import the missing ProfilePage
// Replace with your actual import path
// import 'package:boycot/features/profile/profile_page.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: Routes.homePage,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => LayoutScaffold(
        navigationShell: navigationShell,
      ),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.homePage,
              builder: (context, state) => const Center(child: Text('data')),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.listPage,
              builder: (context, state) => const Center(child: Text('list')),
            ),
            // If you want profile to be accessible from settings tab,
            // but as a separate page (not in tab navigation)

          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.support,
              builder: (context, state) => const Center(child: Text('data')),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: Routes.settingsPage,
              builder: (context, state) => const Center(child: Text('data')),
            ),
            // If you want profile to be accessible from settings tab,
            // but as a separate page (not in tab navigation)

          ],
        ),
      ],
    ),
  ],
);