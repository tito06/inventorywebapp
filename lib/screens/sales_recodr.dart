import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class SalesRecord extends StatefulWidget {
  const SalesRecord({super.key});

  @override
  _SalesRecordState createState() => _SalesRecordState();
}

class _SalesRecordState extends State<SalesRecord> {
  List<Map<String, dynamic>> salesData = List.generate(10, (index) {
    return {
      "date": "2025-01-0${index + 1}",
      "product": "Product ${index + 1}",
      "quantity": "${(index + 1) * 2}",
      "totalPrice": "\$${(index + 1) * 20}",
      "customer": "Customer ${index + 1}",
      "paymentMethod": index % 2 == 0 ? "Cash" : "Card",
    };
  });

  String selectedPaymentMethod = 'All';
  TextEditingController searchController = TextEditingController();

  List<Map<String, dynamic>> get filteredSalesData {
    return salesData.where((sale) {
      final matchSearch = sale['product']
              .toLowerCase()
              .contains(searchController.text.toLowerCase()) ||
          sale['date'].contains(searchController.text);
      final matchPayment = selectedPaymentMethod == 'All' ||
          sale['paymentMethod'] == selectedPaymentMethod;
      return matchSearch && matchPayment;
    }).toList();
  }

  void refreshData() {
    setState(() {
      salesData.shuffle();
    });
  }

  Future<void> exportToCSV() async {
    List<List<dynamic>> rows = [];
    rows.add(["Date", "Product", "Qty", "Total", "Payment"]);

    for (var sale in salesData) {
      rows.add([
        sale["date"],
        sale["product"],
        sale["quantity"],
        sale["totalPrice"],
        sale["paymentMethod"]
      ]);
    }

    String csvData = const ListToCsvConverter().convert(rows);
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/sales_record.csv');
    await file.writeAsString(csvData);
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('CSV file exported successfully')));
  }

  Future<void> exportToPDF() async {
    final pdf = pw.Document();
    pdf.addPage(pw.Page(
      build: (pw.Context context) {
        return pw.Column(
          children: [
            pw.Text('Sales Record', style: pw.TextStyle(fontSize: 24)),
            pw.SizedBox(height: 10),
            pw.Table.fromTextArray(
                headers: ['Date', 'Product', 'Qty', 'Total', 'Payment'],
                data: filteredSalesData
                    .map((sale) => [
                          sale["date"],
                          sale["product"],
                          sale["quantity"],
                          sale["totalPrice"],
                          sale["paymentMethod"]
                        ])
                    .toList()),
          ],
        );
      },
    ));

    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/sales_record.pdf');
    await file.writeAsBytes(await pdf.save());
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('PDF file exported successfully')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sales Records'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: refreshData,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // Analytics
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.blue.shade900,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      'Total Sales: \$${filteredSalesData.fold(0.0, (sum, item) => sum + double.parse(item['totalPrice'].replaceAll('\$', '')))}',
                      style: const TextStyle(color: Colors.white)),
                  Text(
                      'Cash: ${filteredSalesData.where((sale) => sale['paymentMethod'] == 'Cash').length}',
                      style: const TextStyle(color: Colors.white)),
                  Text(
                      'Card: ${filteredSalesData.where((sale) => sale['paymentMethod'] == 'Card').length}',
                      style: const TextStyle(color: Colors.white)),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // Search & Filter
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchController,
                    decoration: const InputDecoration(
                        hintText: 'Search by Product or Date'),
                    onChanged: (value) => setState(() {}),
                  ),
                ),
                const SizedBox(width: 10),
                DropdownButton<String>(
                  value: selectedPaymentMethod,
                  items: ['All', 'Cash', 'Card'].map((String method) {
                    return DropdownMenuItem(value: method, child: Text(method));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedPaymentMethod = value!;
                    });
                  },
                ),
              ],
            ),

            const SizedBox(height: 10),

            // Export Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: exportToCSV,
                  child: const Text('Export to CSV'),
                ),
                ElevatedButton(
                  onPressed: exportToPDF,
                  child: const Text('Export to PDF'),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // HEADER ROW
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.blue.shade900,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Expanded(
                      child: Text("Date",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold))),
                  Expanded(
                      child: Text("Product",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold))),
                  Expanded(
                      child: Text("Qty",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold))),
                  Expanded(
                      child: Text("Total",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold))),
                  Expanded(
                      child: Text("Payment",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold))),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // SALES LIST
            Expanded(
              child: ListView.builder(
                itemCount: filteredSalesData.length,
                itemBuilder: (context, index) {
                  final sale = filteredSalesData[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: index.isEven ? Colors.white : Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            blurRadius: 2,
                            spreadRadius: 1),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Text(sale["date"],
                                style: const TextStyle(fontSize: 14))),
                        Expanded(
                            child: Text(sale["product"],
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold))),
                        Expanded(
                            child: Text(sale["quantity"],
                                style: const TextStyle(fontSize: 14))),
                        Expanded(
                            child: Text(sale["totalPrice"],
                                style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold))),
                        Expanded(
                            child: Row(children: [
                          _getPaymentIcon(sale["paymentMethod"]),
                          const SizedBox(width: 5),
                          Text(sale["paymentMethod"])
                        ])),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Icon _getPaymentIcon(String method) {
    if (method == "Cash") {
      return const Icon(Icons.money, color: Colors.green);
    } else {
      return const Icon(Icons.credit_card, color: Colors.blue);
    }
  }
}
