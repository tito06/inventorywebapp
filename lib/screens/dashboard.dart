import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: LayoutBuilder(
            builder: (context, constraints) {
              bool isMobile = constraints.maxWidth < 600; // Mobile breakpoint

              return Column(
                children: [
                  // Sales & Monthly Sales
                  if (isMobile) ...[
                    _buildSalesDistributionCard(),
                    const SizedBox(height: 20),
                    _buildMonthlySalesCard(),
                  ] else
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: _buildSalesDistributionCard()),
                        const SizedBox(width: 20),
                        Expanded(child: _buildMonthlySalesCard()),
                      ],
                    ),
                  const SizedBox(height: 20),

                  // Product Summary
                  _buildProductSummaryCard(isMobile),
                  const SizedBox(height: 20),

                  // Revenue Overview
                  _buildRevenueOverviewCard(),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  /// Sales Distribution Card (Pie Chart)
  Widget _buildSalesDistributionCard() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Sales Distribution',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 300,
              child: PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(
                      value: 35,
                      color: Colors.blue,
                      title: 'A',
                      radius: 60,
                      titleStyle:
                          const TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    PieChartSectionData(
                      value: 25,
                      color: Colors.green,
                      title: 'B',
                      radius: 60,
                      titleStyle:
                          const TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    PieChartSectionData(
                      value: 15,
                      color: Colors.orange,
                      title: 'C',
                      radius: 60,
                      titleStyle:
                          const TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    PieChartSectionData(
                      value: 25,
                      color: Colors.red,
                      title: 'D',
                      radius: 60,
                      titleStyle:
                          const TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildIndicator(Colors.blue, 'A'),
                _buildIndicator(Colors.green, 'B'),
                _buildIndicator(Colors.orange, 'C'),
                _buildIndicator(Colors.red, 'D'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Monthly Sales Card (Bar Chart)
  Widget _buildMonthlySalesCard() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Monthly Sales',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                DropdownButton<String>(
                  value: '2025',
                  onChanged: (String? newValue) {},
                  items: <String>['2025', '2024', '2023']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 300,
              child: BarChart(
                BarChartData(
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(show: true),
                  borderData: FlBorderData(show: false),
                  barGroups: List.generate(12, (index) {
                    return BarChartGroupData(
                      x: index,
                      barsSpace: 4,
                      barRods: [
                        BarChartRodData(
                          y: (index + 10).toDouble(),
                          colors: [Colors.blue.shade700],
                          width: 20,
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Product Summary Card (Adjusts Layout for Mobile)
  Widget _buildProductSummaryCard(bool isMobile) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Product Summary',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 10, // Horizontal spacing between items
              runSpacing: 10, // Vertical spacing between wrapped rows
              alignment: WrapAlignment.center,
              children: [
                _buildSummaryCard('Total Products', '150'),
                _buildSummaryCard('Low Stock', '20'),
                _buildSummaryCard('Out of Stock', '5'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Revenue Overview Chart
  Widget _buildRevenueOverviewCard() {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Revenue Overview',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 250,
              child: BarChart(
                BarChartData(
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(show: true),
                  borderData: FlBorderData(show: false),
                  barGroups: List.generate(12, (index) {
                    return BarChartGroupData(
                      x: index,
                      barsSpace: 4,
                      barRods: [
                        BarChartRodData(
                          y: (index + 5).toDouble(),
                          colors: [Colors.green.shade700],
                          width: 20,
                        ),
                      ],
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Indicator for Pie Chart
  Widget _buildIndicator(Color color, String text) {
    return Row(
      children: [
        Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
        const SizedBox(width: 4),
        Text(text, style: const TextStyle(fontSize: 14)),
        const SizedBox(width: 10),
      ],
    );
  }

  /// Small Summary Card
  Widget _buildSummaryCard(String title, String value) {
    return Expanded(
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(title, style: const TextStyle(fontSize: 14)),
              const SizedBox(height: 8),
              Text(value, style: const TextStyle(fontSize: 22)),
            ],
          ),
        ),
      ),
    );
  }
}
