import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SolarWaterHeaterScreen extends StatelessWidget {
  const SolarWaterHeaterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final products = [
      {'capacity': '100 L', 'tubes': '10 Tubes', 'price': '₹18,000'},
      {'capacity': '150 L', 'tubes': '15 Tubes', 'price': '₹24,000'},
      {'capacity': '200 L', 'tubes': '20 Tubes', 'price': '₹30,000'},
      {'capacity': '300 L', 'tubes': '30 Tubes', 'price': '₹42,000'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Solar Water Heater'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ===== Banner =====
            Container(
              height: 140,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 10,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.asset(
                  'assets/images/banner.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 24),

            // ===== Title =====
            Text(
              'Available Capacities',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),

            const SizedBox(height: 16),

            // ===== Table Card =====
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Table(
                border: TableBorder.symmetric(
                  inside: BorderSide(color: Colors.grey.shade300),
                ),
                columnWidths: const {
                  0: FlexColumnWidth(1.2),
                  1: FlexColumnWidth(1.3),
                  2: FlexColumnWidth(1.4),
                },
                children: [
                  // Header
                  TableRow(
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                    ),
                    children: const [
                      _TableHeader(text: 'Capacity'),
                      _TableHeader(text: 'Tubes'),
                      _TableHeader(text: 'Price'),
                    ],
                  ),

                  // Rows
                  for (var item in products)
                    TableRow(
                      children: [
                        _TableCell(text: item['capacity']!),
                        _TableCell(text: item['tubes']!),
                        _TableCell(
                          text: item['price']!,
                          isPrice: true,
                        ),
                      ],
                    ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // ===== Warranty =====
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: const [
                  Icon(Icons.verified, color: Colors.green),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      '10 Years Warranty on Tank & Tubes',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // ===== Call Button =====
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () async {
                  final Uri phoneUri = Uri(scheme: 'tel', path: '9890954640');
                  if (await canLaunchUrl(phoneUri)) {
                    await launchUrl(phoneUri);
                  }
                },
                icon: const Icon(Icons.call),
                label: const Text(
                  'Call for Enquiry',
                  style: TextStyle(fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ===== Table Header =====
class _TableHeader extends StatelessWidget {
  final String text;
  const _TableHeader({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.bold,
          color: Colors.green,
        ),
      ),
    );
  }
}

// ===== Table Cell =====
class _TableCell extends StatelessWidget {
  final String text;
  final bool isPrice;

  const _TableCell({
    required this.text,
    this.isPrice = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 14,
          fontWeight: isPrice ? FontWeight.bold : FontWeight.w500,
        ),
      ),
    );
  }
}
