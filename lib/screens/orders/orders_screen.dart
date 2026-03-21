import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrdeer_app/theme.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

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
            child: const Icon(Icons.restaurant_menu, color: AppTheme.primaryColor),
          ),
        ),
        title: const Text('Orders Management'),
        centerTitle: true,
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.notifications, color: Colors.grey),
                onPressed: () {},
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                    border: Border.all(color: Theme.of(context).scaffoldBackgroundColor, width: 2),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 8),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(130),
          child: Column(
            children: [
              Divider(height: 1, color: Colors.grey.withOpacity(0.2), thickness: 1),
              // Search Bar
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search by order ID, table...',
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    filled: true,
                    fillColor: Theme.of(context).cardColor,
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                    contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  ),
                ),
              ),
              // Filters
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  children: [
                    _buildFilterChip('New Order', true),
                    _buildFilterChip('Preparing', false),
                    _buildFilterChip('Ready', false),
                    _buildFilterChip('Cancelled', false),
                    _buildFilterChip('Paid', false),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
        // Orders List
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text('ORDERS (4)', style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1.2)),
              ),
              _buildOrderCard(
                context,
                orderId: '#ORD-8942',
                time: '12:45 PM',
                table: 'Table 04',
                items: '3 items',
                status: 'Preparing',
                statusColor: Colors.orange,
                total: '42.500 TND',
              ),
              _buildOrderCard(
                context,
                orderId: '#ORD-8941',
                time: '12:30 PM',
                table: 'Table 12',
                items: '5 items',
                status: 'Ready',
                statusColor: Colors.green,
                total: '128.000 TND',
              ),
              _buildOrderCard(
                context,
                orderId: '#ORD-8940',
                time: '12:55 PM',
                table: 'Table 08',
                items: '2 items',
                status: 'New Order',
                statusColor: Colors.grey,
                total: '18.900 TND',
              ),
              _buildOrderCard(
                context,
                orderId: '#ORD-8939',
                time: '12:40 PM',
                table: 'Table 01',
                items: '4 items',
                status: 'Preparing',
                statusColor: Colors.orange,
                total: '55.250 TND',
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget _buildFilterChip(String label, bool isSelected) {
  return Container(
    margin: const EdgeInsets.only(right: 8),
    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    decoration: BoxDecoration(
      color: isSelected ? AppTheme.primaryColor : Colors.grey.withOpacity(0.1),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(
      label.toUpperCase(),
      style: GoogleFonts.inter(
        fontSize: 10,
        fontWeight: FontWeight.bold,
        color: isSelected ? Colors.white : Colors.grey[600],
        letterSpacing: 0.5,
      ),
    ),
  );
}

Widget _buildOrderCard(
  BuildContext context, {
  required String orderId,
  required String time,
  required String table,
  required String items,
  required String status,
  required Color statusColor,
  required String total,
}) {
  return GestureDetector(
    onTap: () {
      context.push('/orders/details');
    },
    child: Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 4, offset: const Offset(0, 2)),
        ],
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
                  Text('Ordered $time', style: GoogleFonts.inter(fontSize: 12, color: Colors.grey)),
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
