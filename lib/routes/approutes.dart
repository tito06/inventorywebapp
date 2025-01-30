import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:manage_inventory/helper_widget/scaffold_with_drawer.dart';
import 'package:manage_inventory/screens/dashboard.dart';
import 'package:manage_inventory/screens/product_list.dart';
import 'package:manage_inventory/screens/sales_recodr.dart';

final GoRouter appRoutes = GoRouter(routes: [
  GoRoute(
    path: '/',
    pageBuilder: (context, State) => const NoTransitionPage(
      child: ScaffoldWithDrawer(child: const Dashboard()),
    ),
  ),
  GoRoute(
    path: '/product_list',
    pageBuilder: (context, State) => const NoTransitionPage(
      child: ScaffoldWithDrawer(child: ProductList()),
    ),
  ),
  GoRoute(
    path: '/sales_record',
    pageBuilder: (context, State) => const NoTransitionPage(
      child: ScaffoldWithDrawer(child: SalesRecord()),
    ),
  ),
]);
