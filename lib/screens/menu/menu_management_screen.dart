import 'package:flutter/material.dart';
import 'package:qrdeer_app/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrdeer_app/theme.dart';

class MenuManagementScreen extends StatelessWidget {
  const MenuManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/home');
            }
          },
        ),
        title: Text(AppLocalizations.of(context)!.menuManagementTitle),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: ElevatedButton.icon(
              onPressed: () {
                context.push('/menu/add-item');
              },
              icon: const Icon(Icons.add, size: 16),
              label: Text(AppLocalizations.of(context)!.newItem, style: GoogleFonts.inter(fontWeight: FontWeight.bold)),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                elevation: 4,
                shadowColor: AppTheme.primaryColor.withOpacity(0.3),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Navigation Tabs
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.2))),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildTab(AppLocalizations.of(context)!.tabCategories, true),
                  _buildTab(AppLocalizations.of(context)!.tabAllItems, false),
                  _buildTab(AppLocalizations.of(context)!.tabAvailability, false),
                  _buildTab(AppLocalizations.of(context)!.tabMenuSettings, false),
                ],
              ),
            ),
          ),
          
          // Main Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  _buildCategorySection(
                    context: context,
                    title: AppLocalizations.of(context)!.categoryAppetizers,
                    itemCount: 4,
                    items: [
                  _buildMenuItem(context, AppLocalizations.of(context)!.itemBruschetta, AppLocalizations.of(context)!.descBruschetta, AppLocalizations.of(context)!.price12_5, true, 'https://lh3.googleusercontent.com/aida-public/AB6AXuDPrMwVgrjocHkQiS_mL7ke5s-g6wO85pOXbacy68XUWHBEJ4OVdhxDCfT4roJUXr1aVFH8v5MxUZTwcmscI69kt1X2tK_E4wshoUIqO5jT6OHiYaSvm7BwQWHDyVlYJ6zGRZfpIo291cwopGpkShP-sj-q4YkCCLmKiEQMbAQity2HUQPuK8oGmWypQwZzj--vFQpyqIg3gO92x_kmFTt94PEPT-gBSjEUfHSeDd1EE8OhVRbApXjesilqI6aooiM_eyhEQkiMYDs'),
                      _buildMenuItem(context, AppLocalizations.of(context)!.itemCalamari, AppLocalizations.of(context)!.descCalamari, AppLocalizations.of(context)!.price18, false, 'https://lh3.googleusercontent.com/aida-public/AB6AXuCblIwUuWczi1CtrehwTIbQpSx_9mTs8mP05Tp4dwj426C22AiFO6Cne6nePCtSyx9xj-HK_RWk_1Mo7Um_W180JN8WxwODFgAEG9eXcQj9byViEnQf8zhbwDZHeSxsQ9vzc6xWS-gqk6yNMqmYDXmJwnyZEOSPpzOP9l_5Jpc5KfnGAaHLT9iqAHVp11iOrmbdF6KIvgiR5CCyfbjdYc9QtH0QJ2F7-4PB_qT9fkNWelwPnUKOyFjsFRWnS6XLLi18byTW5gJwebo'),
                    ],
                  ),
                  const SizedBox(height: 32),
                  _buildCategorySection(
                    context: context,
                    title: AppLocalizations.of(context)!.categoryMainCourse,
                    itemCount: 8,
                    items: [
                      _buildMenuItem(context, AppLocalizations.of(context)!.itemSalmon, AppLocalizations.of(context)!.descSalmon, AppLocalizations.of(context)!.price42, false, 'https://lh3.googleusercontent.com/aida-public/AB6AXuDXpBY-UoTf-869lPZ-LGLag6HeZS8cSaMuQTWJuMt-ZPvMBmWqX8HJ1pUMZWCaPTgDpftIiKn44fipYjzN_FB2Wnfig6dJUr2roreIzQJ0CW5hQEIJnHf1r1DxyAH5QhSTVXp9alGxdaloUscoFSeqVa6Zhtok9YiLcNrRKrDTMSu-kp71epIpUeZHZhbhl2ZLc1IsEsbWsyAOjaxaaJJcrefVhn3Tz6CXY_7zDWa-t72kf1C51Br-sF3y0VXcB3JKB4LcHfPoW1I'),
                      _buildMenuItem(context, AppLocalizations.of(context)!.itemSteak, AppLocalizations.of(context)!.descSteak, AppLocalizations.of(context)!.price55, false, 'https://lh3.googleusercontent.com/aida-public/AB6AXuAm0sGX0kVlpSYXrHWW3_RJjbOf8WsE_hxmpPxI7NvWlZDMHBNGZZEYY1f4T2Jfreek2dCOh2-8BoHaJAYJ9IHQfP1UdwRYHfEcULyzRGIV_InVmONd9w_vFqt7W3b5WHb9ClypnzB_3IMU3Zb6mOUrWWpJTvsU1uebYe64NJB5DLl193CV_qZ64QCphjlMOtKDM4QuMDsFt5hFqyrqtx383NfLL-qTHuayb9J3SsXSWORvJ5-7FTG-df2QnQLd4qrrhr7kBkwhhpQ', highlightPrice: true),
                    ],
                  ),
                  const SizedBox(height: 32),
                  _buildCategorySection(
                    context: context,
                    title: AppLocalizations.of(context)!.categoryDrinks,
                    itemCount: 12,
                    items: [
                      _buildMenuItem(context, AppLocalizations.of(context)!.itemOrangeJuice, AppLocalizations.of(context)!.descOrangeJuice, AppLocalizations.of(context)!.priceFrom8_5, false, 'https://lh3.googleusercontent.com/aida-public/AB6AXuAE8pIKvaqptzfqP8UsQWyTDnmINzswPC_WrZfILUhOqMHsAqUv6MehPt3BvSoAFEbYffPaI3o4aQ1hi4bD6Ldf6DkF2vmma4FCnP9J1it5kveqUvKFYxvkJzTmwzBxOX_RqN8PGj1rKN89Wur8-RwPIRFqsA9iKhDSD72CXGiTyb3sCEpDMiWAGCiGcrSoaKDWA2nfJhBdcCcZO5EWmjahNBYxIQQ7tQPLSbApguJMN9FJ4mxtEi9FoUSrPY7vcc3ofHvvckMXr48'),
                    ],
                  ),
                  const SizedBox(height: 32), // Padding for bottom nav overlap space if any
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String text, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: isSelected ? AppTheme.primaryColor : Colors.transparent,
            width: 2,
          ),
        ),
      ),
      child: Text(
        text,
        style: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
          color: isSelected ? AppTheme.primaryColor : Colors.grey,
        ),
      ),
    );
  }

  Widget _buildCategorySection({
    required BuildContext context,
    required String title,
    required int itemCount,
    required List<Widget> items,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(title, style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(AppLocalizations.of(context)!.itemCount(itemCount.toString()), style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.bold, color: AppTheme.primaryColor)),
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                context.push('/menu/edit-category');
              },
              child: Text(AppLocalizations.of(context)!.editCategory, style: GoogleFonts.inter(color: AppTheme.primaryColor, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Column(
          children: items.map((item) => Padding(padding: const EdgeInsets.only(bottom: 12), child: item)).toList(),
        ),
      ],
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, String description, String price, bool isActive, String imageUrl, {bool highlightPrice = false}) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 4, offset: const Offset(0, 2)),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              width: 64,
              height: 64,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                width: 64,
                height: 64,
                color: Colors.grey.withOpacity(0.1),
                child: const Icon(Icons.fastfood, color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (isActive)
                      const Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Icon(Icons.check_circle, color: Colors.green, size: 16),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: GoogleFonts.inter(fontSize: 14, color: Colors.grey),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                price,
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: highlightPrice ? AppTheme.primaryColor : null,
                ),
              ),
              // Hover actions logic would typically use hovered state in flutter, we'll just show them or standard edit interactions. Showing basic edit/delete icons always for now to mimic simple mobile view.
              const SizedBox(height: 8),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(onTap: () {}, child: const Icon(Icons.edit, size: 20, color: Colors.grey)),
                  const SizedBox(width: 8),
                  InkWell(onTap: () {}, child: const Icon(Icons.delete, size: 20, color: Colors.red)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
