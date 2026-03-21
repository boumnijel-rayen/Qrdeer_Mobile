import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrdeer_app/theme.dart';

class BillingInvoicesScreen extends StatelessWidget {
  const BillingInvoicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            }
          },
        ),
        title: const Text('Billing & Invoices'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Section Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Invoice History', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold)),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: AppTheme.primaryColor,
                    textStyle: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  child: const Text('Filter'),
                ),
              ],
            ),
          ),

          // Invoices List
          Expanded(
            child: ListView(
              children: [
                _buildInvoiceItem('INV-2023-012', 'Oct 12, 2023 • 450 TND', true),
                _buildInvoiceItem('INV-2023-011', 'Sep 15, 2023 • 800 TND', true),
                _buildInvoiceItem('INV-2023-010', 'Aug 20, 2023 • 1,200 TND', true),
                _buildInvoiceItem('INV-2023-009', 'Jul 10, 2023 • 0 TND', true),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInvoiceItem(String id, String details, bool isPaid) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.1))),
        ),
        child: Row(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppTheme.primaryColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.description, color: AppTheme.primaryColor),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(id, style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600)),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: isPaid ? Colors.green.withOpacity(0.1) : Colors.amber.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          isPaid ? 'PAID' : 'PENDING',
                          style: GoogleFonts.inter(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: isPaid ? Colors.green[700] : Colors.amber[700],
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(details, style: GoogleFonts.inter(fontSize: 14, color: Colors.grey[600])),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.download),
              color: AppTheme.primaryColor,
              style: IconButton.styleFrom(
                shape: CircleBorder(side: BorderSide(color: AppTheme.primaryColor.withOpacity(0.2))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
