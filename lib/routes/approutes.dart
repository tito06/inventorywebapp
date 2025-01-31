import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:manage_inventory/helper_widget/scaffold_with_drawer.dart';
import 'package:manage_inventory/screens/AddProduct.dart';
import 'package:manage_inventory/screens/dashboard.dart';
import 'package:manage_inventory/screens/document.dart';
import 'package:manage_inventory/screens/product_list.dart';
import 'package:manage_inventory/screens/sales_recodr.dart';
import 'package:manage_inventory/screens/upload_document.dart';

final GoRouter appRoutes = GoRouter(routes: [
  GoRoute(
    path: '/',
    pageBuilder: (context, State) => const NoTransitionPage(
      child: ScaffoldWithDrawer(title: "Dashboard", child: const Dashboard()),
    ),
  ),
  GoRoute(
    path: '/product_list',
    pageBuilder: (context, State) => const NoTransitionPage(
      child: ScaffoldWithDrawer(title: "Product List", child: ProductList()),
    ),
  ),
  GoRoute(
    path: '/sales_record',
    pageBuilder: (context, State) => const NoTransitionPage(
      child: ScaffoldWithDrawer(title: "Sales Record", child: SalesRecord()),
    ),
  ),
  GoRoute(
    path: '/add_product',
    pageBuilder: (context, State) => NoTransitionPage(
      child:
          ScaffoldWithDrawer(title: "Add Product", child: AddProductScreen()),
    ),
  ),
  GoRoute(
    path: '/document_page',
    pageBuilder: (context, State) => NoTransitionPage(
      child:
          ScaffoldWithDrawer(title: "Manage Document", child: DocumentScreen()),
    ),
  ),
  GoRoute(
    path: '/upload_document',
    pageBuilder: (context, State) => NoTransitionPage(
      child: UploadDocumentScreen(),
    ),
  ),
]);
