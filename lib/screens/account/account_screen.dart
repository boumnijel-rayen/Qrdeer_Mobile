import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrdeer_app/theme.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppTheme.primaryColor),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            }
          },
        ),
        title: const Text('Settings'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Section
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppTheme.primaryColor.withOpacity(0.05)),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 4),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 80,
                            height: 80,
                            child: ClipOval(
                              child: Image.network(
                                'https://lh3.googleusercontent.com/aida-public/AB6AXuAGmUrh5QCX06x30HLw5p2IFsBEI3cA_LdFYhFXmIkdDOZDCwePs7foi7Deo5EeYebPrtfodsN7lqnu-SYIJ5z4oE4tCuaQc2B9W4V4X24tbud-KNBefRSM2RUM09y62tzG_ThB2Hijh0GNjyfCgWxofwanU6FiutMgsTu4oghQM0KmWWD1KJ79itnZlW3uR1NXkqKuLN2Bud1i9MGyYv9k4IIJhqQ9mqzpPrNmrR-e4-JF_QeYWVEfufXk4Lul47YTOmtQxfq3v74',
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: AppTheme.primaryColor,
                                shape: BoxShape.circle,
                                border: Border.all(color: Theme.of(context).scaffoldBackgroundColor, width: 2),
                              ),
                              child: const Icon(Icons.edit, size: 12, color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Alex Johnson', style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 4),
                            Text('General Manager', style: GoogleFonts.inter(fontSize: 14, color: Colors.grey)),
                            const SizedBox(height: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: AppTheme.primaryColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text('ADMIN ACCESS', style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.bold, color: AppTheme.primaryColor, letterSpacing: 0.5)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: AppTheme.primaryColor.withOpacity(0.05),
                        foregroundColor: AppTheme.primaryColor,
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      onPressed: () {
                        context.push('/account/edit-profile');
                      },
                      child: Text('Edit Profile Details', style: GoogleFonts.inter(fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Restaurant Details
            _buildSectionTitle('RESTAURANT DETAILS'),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppTheme.primaryColor.withOpacity(0.05)),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 4),
                ],
              ),
              child: Column(
                children: [
                  _buildListTile(
                    icon: Icons.restaurant,
                    title: 'Restaurant Name',
                    subtitle: 'The Golden Grill',
                    onTap: () {
                      context.push('/account/edit-restaurant');
                    },
                  ),
                  Divider(height: 1, color: AppTheme.primaryColor.withOpacity(0.05)),
                  _buildListTile(
                    icon: Icons.location_on,
                    title: 'Address',
                    subtitle: '123 Culinary Ave, San Francisco, CA',
                    onTap: () {},
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Subscription & Plan
            _buildSectionTitle('SUBSCRIPTION'),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF1132d4),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('CURRENT PLAN', style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white.withOpacity(0.6), letterSpacing: 1)),
                          const SizedBox(height: 4),
                          Text('Premium Pro', style: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text('Active', style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Text('Next billing cycle: Oct 12, 2023', style: GoogleFonts.inter(fontSize: 14, color: Colors.white.withOpacity(0.8))),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // General Settings List
            _buildSectionTitle('GENERAL SETTINGS'),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppTheme.primaryColor.withOpacity(0.05)),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 4),
                ],
              ),
              child: Column(
                children: [
                  _buildSettingTile(
                    icon: Icons.restaurant_menu,
                    title: 'Menu Management',
                    subtitle: 'Update items, prices, and categories',
                    onTap: () {
                      context.push('/menu');
                    },
                  ),
                  Divider(height: 1, color: AppTheme.primaryColor.withOpacity(0.05)),
                  _buildSettingTile(
                    icon: Icons.group,
                    title: 'Staff Access',
                    subtitle: 'Manage roles and permissions',
                    onTap: () {
                      context.push('/account/staff');
                    },
                  ),
                  Divider(height: 1, color: AppTheme.primaryColor.withOpacity(0.05)),
                  _buildSettingTile(
                    icon: Icons.payments,
                    title: 'Billing & Invoices',
                    subtitle: 'View history and payment methods',
                    onTap: () {
                      context.push('/account/billing');
                    },
                  ),
                  Divider(height: 1, color: AppTheme.primaryColor.withOpacity(0.05)),
                  _buildSettingTile(
                    icon: Icons.contact_support,
                    title: 'Claiming / Support',
                    subtitle: 'Get help with your restaurant profile',
                    onTap: () {
                      context.push('/account/contact');
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Logout
            OutlinedButton.icon(
              onPressed: () {
                context.go('/login');
              },
              icon: const Icon(Icons.logout),
              label: const Text('Logout'),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppTheme.primaryColor,
                side: BorderSide(color: AppTheme.primaryColor.withOpacity(0.2)),
                minimumSize: const Size(double.infinity, 52),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                textStyle: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 24),
            
            // App Version
            Center(
              child: Text(
                'APP VERSION 2.4.0',
                style: GoogleFonts.inter(fontSize: 10, color: Colors.grey[400], letterSpacing: 2, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 12),
      child: Text(
        title,
        style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey, letterSpacing: 1),
      ),
    );
  }

  Widget _buildListTile({required IconData icon, required String title, required String subtitle, required VoidCallback onTap}) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: AppTheme.primaryColor.withOpacity(0.05),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: AppTheme.primaryColor),
      ),
      title: Text(title, style: GoogleFonts.inter(fontSize: 14, color: Colors.grey)),
      subtitle: Text(subtitle, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black)),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
    );
  }

  Widget _buildSettingTile({required IconData icon, required String title, required String subtitle, required VoidCallback onTap}) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: AppTheme.primaryColor.withOpacity(0.05),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: AppTheme.primaryColor, size: 20),
      ),
      title: Text(title, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle, style: GoogleFonts.inter(fontSize: 12, color: Colors.grey)),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
    );
  }
}
