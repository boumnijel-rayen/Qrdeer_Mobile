import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrdeer_app/theme.dart';

class MainLayout extends StatelessWidget {
  final Widget child;

  const MainLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            )
          ],
          border: Border(
            top: BorderSide(color: Colors.grey.withOpacity(0.2)),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(context, icon: Icons.home, label: 'Home', route: '/home', isSelected: _isRouteSelected(context, '/home')),
                _buildNavItem(context, icon: Icons.receipt_long, label: 'Orders', route: '/orders', isSelected: _isRouteSelected(context, '/orders')),
                _buildNavItem(context, icon: Icons.table_restaurant, label: 'Tables', route: '/tables', isSelected: _isRouteSelected(context, '/tables')),
                _buildNavItem(context, icon: Icons.query_stats, label: 'Sales', route: '/sales', isSelected: _isRouteSelected(context, '/sales')),
                _buildNavItem(context, icon: Icons.account_circle, label: 'Account', route: '/account', isSelected: _isRouteSelected(context, '/account')),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool _isRouteSelected(BuildContext context, String route) {
    final GoRouterState state = GoRouterState.of(context);
    return state.uri.toString().startsWith(route) && (route != '/' || state.uri.toString() == '/');
  }

  Widget _buildNavItem(BuildContext context, {required IconData icon, required String label, required String route, required bool isSelected}) {
    final color = isSelected ? AppTheme.primaryColor : Colors.grey;
    return InkWell(
      onTap: () {
        if (!isSelected) {
          context.go(route);
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 32,
            alignment: Alignment.center,
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 10,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
