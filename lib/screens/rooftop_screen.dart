import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RooftopSystemScreen extends StatelessWidget {
  const RooftopSystemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;

    final systems = [
      {'capacity': '1 kW', 'area': '100 sq.ft', 'price': '₹55,000'},
      {'capacity': '2 kW', 'area': '200 sq.ft', 'price': '₹1,05,000'},
      {'capacity': '3 kW', 'area': '300 sq.ft', 'price': '₹1,55,000'},
      {'capacity': '5 kW', 'area': '500 sq.ft', 'price': '₹2,60,000'},
      {'capacity': '10 kW', 'area': '1000 sq.ft', 'price': '₹5,00,000'},
    ];

    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(t.rooftopTitle),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Image.asset(
                'assets/images/waree.jpg',
                height: 140,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              t.rooftopPricingTitle,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(
                      theme.brightness == Brightness.dark ? 0.2 : 0.08,
                    ),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              child: Table(
                border: TableBorder.symmetric(
                  inside: BorderSide(color: theme.dividerColor),
                ),
                columnWidths: const {
                  0: FlexColumnWidth(1.2),
                  1: FlexColumnWidth(1.4),
                  2: FlexColumnWidth(1.4),
                },
                children: [
                  TableRow(
                    decoration: BoxDecoration(
                      color: colorScheme.primary.withOpacity(0.1),
                    ),
                    children: [
                      _TableHeader(text: t.capacity),
                      _TableHeader(text: t.areaRequired),
                      _TableHeader(text: t.price),
                    ],
                  ),
                  for (var item in systems)
                    TableRow(
                      children: [
                        _TableCell(text: item['capacity']!),
                        _TableCell(text: item['area']!),
                        _TableCell(text: item['price']!, isPrice: true),
                      ],
                    ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: colorScheme.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  Icon(Icons.verified, color: colorScheme.primary),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      t.warrantyText,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Text(
              t.keyBenefits,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            _featureItem(context, t.benefit1),
            _featureItem(context, t.benefit2),
            _featureItem(context, t.benefit3),
            _featureItem(context, t.benefit4),
            const SizedBox(height: 28),
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
                label: Text(t.callRooftop),
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

  Widget _featureItem(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Icon(
            Icons.check_circle,
            size: 18,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
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
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
              fontWeight: FontWeight.bold,
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
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: isPrice ? FontWeight.bold : FontWeight.w500,
              ),
        ),
      ),
    );
  }
}
