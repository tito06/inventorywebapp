import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample fake data with null safety
    final List<Map<String, dynamic>> products = List.generate(20, (index) {
      return {
        "name": "Product ${index + 1}",
        "category": "Category ${(index % 5) + 1}",
        "price": "\$${(index + 1) * 10}",
        "stock": "${(index * 2) + 5} units",
      };
    });

    return SizedBox(
      width: double.infinity, // Full width
      child: Column(
        children: [
          // Header Row
          Container(
            color: Colors.blue.shade100,
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Product Name',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                Text('Category',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                Text('Price',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                Text('Stock',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          // List of Products
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return Container(
                  color: index.isEven ? Colors.white : Colors.lightBlue.shade50,
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(product["name"] ?? "No Name",
                          style: const TextStyle(fontSize: 16)),
                      Text(product["category"] ?? "No Category",
                          style: const TextStyle(
                              fontSize: 14, color: Colors.grey)),
                      Text(product["price"] ?? "No Price",
                          style: const TextStyle(
                              fontSize: 14, color: Colors.green)),
                      Text(product["stock"] ?? "No Stock",
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
