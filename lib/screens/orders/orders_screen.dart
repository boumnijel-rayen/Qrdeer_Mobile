import 'package:flutter/material.dart';
import 'package:qrdeer_app/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrdeer_app/theme.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 72,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.restaurant, color: Theme.of(context).cardColor, size: 24),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppLocalizations.of(context)!.ordersManagement, style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
                  Text('Main Street Bistro', style: GoogleFonts.inter(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w700)),
                ],
              ),
            ],
          ),
        ),
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.notifications, color: AppTheme.secondColorLight),
                onPressed: () {},
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  width: 10,
                  height: 10,
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
          preferredSize: const Size.fromHeight(115),
          child: Column(
            children: [
              Divider(height: 1, color: Colors.grey.withOpacity(0.2), thickness: 1),
              // Search Bar
              Padding(
                padding: const EdgeInsets.fromLTRB(18, 16, 18, 0),
                child: SizedBox(
                  height: 42,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.searchOrders,
                      hintStyle: GoogleFonts.inter(fontSize: 14, color: Colors.grey[600], fontWeight: FontWeight.w500),
                      prefixIcon: const Icon(Icons.search, color: Colors.grey),
                      filled: true,
                      fillColor: Color(0xFFF1F5F9),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide.none),
                      contentPadding: const EdgeInsets.symmetric(vertical: 0),
                    ),
                  ),
                ),
              ),
              // Filters
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                child: Row(
                  children: [
                    _buildFilterChip(AppLocalizations.of(context)!.filterAll, true),
                    _buildFilterChip(AppLocalizations.of(context)!.filterNewOrder, false),
                    _buildFilterChip(AppLocalizations.of(context)!.filterPreparing, false),
                    _buildFilterChip(AppLocalizations.of(context)!.filterReady, false),
                    _buildFilterChip(AppLocalizations.of(context)!.filterCancelled, false),
                    _buildFilterChip(AppLocalizations.of(context)!.filterPaid, false),
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
                child: Text(AppLocalizations.of(context)!.ordersCount('4'), style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w800, color: AppTheme.secondColorLight, letterSpacing: 1.2)),
              ),
              _buildOrderCard(
                context,
                orderId: '#ORD-8942',
                time: '12:45:02',
                table: 'Table 04',
                items: '3 items',
                status: AppLocalizations.of(context)!.filterPreparing,
                statusColor: Color(0xFFE65B18),
                statusBackgroundColor: Colors.orange.withOpacity(0.2),
                total: '42.500 TND',
              ),
              _buildOrderCard(
                context,
                orderId: '#ORD-8941',
                time: '12:30:15',
                table: 'Table 12',
                items: '5 items',
                status: AppLocalizations.of(context)!.filterReady,
                statusColor: Color(0xFF17A34B),
                statusBackgroundColor: Colors.green.withOpacity(0.2),
                total: '128.000 TND',
              ),
              _buildOrderCard(
                context,
                orderId: '#ORD-8939',
                time: '15:40:45',
                table: 'Table 01',
                items: '4 items',
                status: AppLocalizations.of(context)!.filterNewOrder,
                statusColor: Color(0xFF1E4FD8),
                statusBackgroundColor: Colors.blueAccent.withOpacity(0.2),
                total: '55.250 TND',
              ),
              _buildOrderCard(
                context,
                orderId: '#ORD-8941',
                time: '12:30:15',
                table: 'Table 12',
                items: '5 items',
                status: AppLocalizations.of(context)!.filterCancelled,
                statusColor: Color(0xFFBE123C),
                statusBackgroundColor: Colors.red.withOpacity(0.2),
                total: '128.000 TND',
              ),
              _buildOrderCard(
                context,
                orderId: '#ORD-8940',
                time: '05:55:06',
                table: 'Table 08',
                items: '2 items',
                status: AppLocalizations.of(context)!.filterPaid,
                statusColor: Color(0xFF64748B),
                statusBackgroundColor: Colors.grey.withOpacity(0.2),
                total: '18.900 TND',
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
      color: isSelected ? AppTheme.primaryColor : Color(0xFFF1F5F9),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(
      label.toUpperCase(),
      style: GoogleFonts.inter(
        fontSize: 10,
        fontWeight: FontWeight.bold,
        color: isSelected ? Colors.white : AppTheme.secondColorLight,
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
  required Color statusBackgroundColor,
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
                  Text(AppLocalizations.of(context)!.orderedAt(time), style: GoogleFonts.inter(fontSize: 12, color: AppTheme.primaryColor, fontWeight: FontWeight.w600)),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: statusBackgroundColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  status.toUpperCase(),
                  style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w800, color: statusColor, letterSpacing: 0.5),
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
                      Text(AppLocalizations.of(context)!.tableUpper, style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1)),
                      Text(table, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold)),
                    ],
                  ),
                  const SizedBox(width: 32),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(AppLocalizations.of(context)!.itemsUpper, style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1)),
                      Text(items, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(AppLocalizations.of(context)!.totalUpper, style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1)),
                  Text(total, style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
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
