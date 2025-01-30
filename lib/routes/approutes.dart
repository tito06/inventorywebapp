import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:manage_inventory/screens/dashboard.dart';
import 'package:manage_inventory/screens/product_list.dart';

final GoRouter appRoutes = GoRouter(routes: [
  GoRoute(
      path: '/',
      pageBuilder: (context, State) =>
          const NoTransitionPage(child: const Dashboard())),
  GoRoute(
      path: '/product_list',
      pageBuilder: (context, State) =>
          const NoTransitionPage(child: ProductList())),
]);
