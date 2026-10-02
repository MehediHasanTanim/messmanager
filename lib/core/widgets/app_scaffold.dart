import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/router/app_router.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    required this.title,
    required this.child,
    this.actions,
    this.showBackButton = false,
    this.bottomNavigationBar,
    super.key,
  });

  final String title;
  final Widget child;
  final List<Widget>? actions;
  final bool showBackButton;
  final Widget? bottomNavigationBar;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: showBackButton,
        title: Text(title),
        actions: actions,
      ),
      body: SafeArea(child: child),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}

class AppShell extends StatelessWidget {
  const AppShell({required this.currentPath, required this.child, super.key});

  final String currentPath;
  final Widget child;

  static const _destinations = [
    _NavigationDestination(
      'হোম',
      Icons.home_outlined,
      Icons.home,
      AppRoutes.home,
    ),
    _NavigationDestination(
      'খাবার',
      Icons.restaurant_outlined,
      Icons.restaurant,
      AppRoutes.meals,
    ),
    _NavigationDestination(
      'খরচ',
      Icons.account_balance_wallet_outlined,
      Icons.account_balance_wallet,
      AppRoutes.expenses,
    ),
    _NavigationDestination(
      'সদস্য',
      Icons.groups_outlined,
      Icons.groups,
      AppRoutes.members,
    ),
    _NavigationDestination(
      'আরও',
      Icons.menu_outlined,
      Icons.menu,
      AppRoutes.more,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: 'Mess Manager BD',
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) => context.go(_destinations[index].path),
        destinations: [
          for (final destination in _destinations)
            NavigationDestination(
              icon: Icon(destination.icon),
              selectedIcon: Icon(destination.selectedIcon),
              label: destination.label,
            ),
        ],
      ),
      child: child,
    );
  }

  int get _selectedIndex {
    final index = _destinations.indexWhere(
      (destination) => currentPath.startsWith(destination.path),
    );
    return index == -1 ? 0 : index;
  }
}

class _NavigationDestination {
  const _NavigationDestination(
    this.label,
    this.icon,
    this.selectedIcon,
    this.path,
  );

  final String label;
  final IconData icon;
  final IconData selectedIcon;
  final String path;
}
