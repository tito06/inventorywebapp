import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class DocumentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Documents'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildCard('Manage Document', Icons.folder, Colors.blue),
                SizedBox(width: 20),
                _buildCard('Add Document', Icons.add_circle, Colors.green),
              ],
            ),
          ),
          Flexible(
            child: Center(
              child: Lottie.asset(
                'assets/document_animation.json',
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String title, IconData icon, Color color) {
    return GestureDetector(
      onTap: () {
        // Handle tap
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 5,
        color: color.withOpacity(0.8),
        child: Container(
          width: 150,
          height: 130,
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Colors.white),
              SizedBox(height: 10),
              Text(
                title,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
