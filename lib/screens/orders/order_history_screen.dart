import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrdeer_app/theme.dart';

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: AppTheme.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.receipt_long, color: AppTheme.primaryColor),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Order History', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold)),
            Text('RestoDash • Sales Search', style: GoogleFonts.inter(fontSize: 12, color: Colors.grey[600], fontWeight: FontWeight.normal)),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.download),
            onPressed: () {},
            style: IconButton.styleFrom(
              side: BorderSide(color: Colors.grey.withOpacity(0.3)),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
          const SizedBox(width: 8),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(81),
          child: Column(
            children: [
              Divider(height: 1, color: Colors.grey.withOpacity(0.2), thickness: 1),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search Order ID, Table #, or Customer...',
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    filled: true,
                    fillColor: Theme.of(context).cardColor,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.withOpacity(0.3))),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.withOpacity(0.3))),
                    contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          // Summary Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.withOpacity(0.2)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('TOTAL SALES TODAY', style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1)),
                        const SizedBox(height: 4),
                        Text('2,842.50 TND', style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.trending_up, color: Colors.green, size: 12),
                            const SizedBox(width: 4),
                            Text('+8% vs yest.', style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.green[700])),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.withOpacity(0.2)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('AVG ORDER VALUE', style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1)),
                        const SizedBox(height: 4),
                        Text('38.90 TND', style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.horizontal_rule, color: Colors.grey, size: 12),
                            const SizedBox(width: 4),
                            Text('Stable', style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Filters
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                _buildFilterChip(context, 'Today', Icons.calendar_month, true),
                _buildFilterChip(context, 'Yesterday', null, false),
                _buildFilterChip(context, 'Last 7 Days', null, false),
                _buildFilterChip(context, 'Filters', Icons.filter_list, false),
              ],
            ),
          ),
          
          const SizedBox(height: 16),

          // Order List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('RECENT ORDERS', style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1)),
                    Text('42 orders found', style: GoogleFonts.inter(fontSize: 12, color: Colors.grey[500], fontWeight: FontWeight.w500)),
                  ],
                ),
                const SizedBox(height: 12),
                _buildHistoryCard(context, '#ORD-8942', 'Today, 2:45 PM', 'Completed', Colors.green, 'T-14', '4 items', '112.50 TND'),
                _buildHistoryCard(context, '#ORD-8941', 'Today, 2:32 PM', 'In Progress', Colors.blue, 'T-08', '2 items', '45.00 TND'),
                _buildHistoryCard(context, '#ORD-8940', 'Today, 2:15 PM', 'Cancelled', Colors.red, 'T-22', '1 item', '18.50 TND'),
                _buildHistoryCard(context, '#ORD-8939', 'Today, 1:55 PM', 'Completed', Colors.green, 'T-04', '6 items', '156.20 TND'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(BuildContext context, String label, IconData? icon, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? AppTheme.primaryColor : Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        border: isSelected ? null : Border.all(color: Colors.grey.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 16, color: isSelected ? Colors.white : Colors.grey[700]),
            const SizedBox(width: 4),
          ],
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHistoryCard(BuildContext context, String orderId, String time, String status, Color statusColor, String table, String items, String total) {
    return GestureDetector(
      onTap: () {
        context.push('/orders/history/details'); // Order history details screen
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.withOpacity(0.2)),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(orderId, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 2),
                    Text(time, style: GoogleFonts.inter(fontSize: 12, color: Colors.grey)),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: statusColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    status.toUpperCase(),
                    style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.bold, color: statusColor, letterSpacing: 0.5),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
              child: Divider(height: 1),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('TABLE', style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1)),
                        Text(table, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    const SizedBox(width: 32),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('ITEMS', style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1)),
                        Text(items, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('TOTAL', style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1)),
                    Text(total, style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold, color: AppTheme.primaryColor)),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
