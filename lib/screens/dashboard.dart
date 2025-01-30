import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:manage_inventory/routes/approutes.dart';
import 'package:manage_inventory/screens/product_list.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.dashboard, size: 80, color: Colors.blue),
          SizedBox(height: 20),
          Text(
            "Welcome to Your Inventory Dashboard",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            "Use the menu to navigate through the system.",
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
