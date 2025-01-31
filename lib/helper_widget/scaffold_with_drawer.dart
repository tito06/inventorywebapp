import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:manage_inventory/screens/dashboard.dart';

class ScaffoldWithDrawer extends StatelessWidget {
  final Widget child; // The main content (screen)

  const ScaffoldWithDrawer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inventory Management"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("John Doe"),
              accountEmail: Text("john.doe@example.com"),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person, color: Colors.blue),
              ),
            ),
            ListTile(
              title: const Text("Dashboard"),
              onTap: () {
                context.go('/');
              },
            ),
            ListTile(
              title: const Text("Product List"),
              onTap: () {
                context.go('/product_list');
              },
            ),
            ListTile(
              title: const Text("Sales Record"),
              onTap: () {
                context.go('/sales_record');
              },
            ),
            ListTile(
              title: const Text("Add Products"),
              onTap: () {
                context.go('/add_product');
              },
            ),
            ListTile(
              title: const Text("Documents"),
              onTap: () {
                context.go('/document_page');
              },
            ),
            ListTile(
              title: const Text("Upload Documents"),
              onTap: () {
                context.go('/upload_documents');
              },
            ),
            ListTile(
              title: const Text("POS"),
              onTap: () {
                context.go('/pos');
              },
            ),
            ListTile(
              title: const Text("Settings"),
              onTap: () {
                context.go('/settings');
              },
            ),
            ListTile(
              title: const Text("Logout"),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: child, // The actual screen content
    );
  }
}
