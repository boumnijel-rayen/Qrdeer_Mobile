import 'package:flutter/material.dart';
import 'package:qrdeer_app/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrdeer_app/theme.dart';

class EditCategoryScreen extends StatelessWidget {
  const EditCategoryScreen({super.key});

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
        title: Text(AppLocalizations.of(context)!.editCategory),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(AppLocalizations.of(context)!.preview, style: GoogleFonts.inter(color: AppTheme.primaryColor, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Form Section
                  Text(AppLocalizations.of(context)!.categoryName, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600)),
                  const SizedBox(height: 8),
                  TextField(
                    controller: TextEditingController(text: 'Appetizers'),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Theme.of(context).cardColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: AppTheme.primaryColor, width: 1.5),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.delete, size: 18, color: Colors.grey),
                    label: Text(AppLocalizations.of(context)!.deleteCategory, style: GoogleFonts.inter(color: Colors.grey, fontWeight: FontWeight.w500)),
                  ),
                  
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.0),
                    child: Divider(height: 1),
                  ),

                  // Assigned Items List
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(AppLocalizations.of(context)!.assignedItems, style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold)),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(AppLocalizations.of(context)!.itemCount('5'), style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.grey)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.withOpacity(0.2)),
                    ),
                    child: Column(
                      children: [
                        _buildDraggableItem(AppLocalizations.of(context)!.itemGarlicBread, AppLocalizations.of(context)!.price8_5, true),
                        _buildDraggableItem(AppLocalizations.of(context)!.itemCalamariRings, AppLocalizations.of(context)!.price14, true),
                        _buildDraggableItem(AppLocalizations.of(context)!.itemTomatoBruschetta, AppLocalizations.of(context)!.price10, true),
                        _buildDraggableItem(AppLocalizations.of(context)!.itemCaesarSalad, AppLocalizations.of(context)!.price12, true),
                        _buildDraggableItem(AppLocalizations.of(context)!.itemBuffaloWings, AppLocalizations.of(context)!.price11_5, false),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Save Button
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              border: Border(top: BorderSide(color: Colors.grey.withOpacity(0.2))),
            ),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryColor,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 56),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 4,
                shadowColor: AppTheme.primaryColor.withOpacity(0.3),
              ),
              child: Text(AppLocalizations.of(context)!.saveChanges, style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDraggableItem(String title, String subtitle, bool showDivider) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          title: Text(title, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500)),
          subtitle: Text(subtitle, style: GoogleFonts.inter(fontSize: 12, color: Colors.grey)),
          trailing: const Icon(Icons.drag_indicator, color: Colors.grey),
          onTap: () {},
        ),
        if (showDivider)
          Divider(height: 1, color: Colors.grey.withOpacity(0.1), indent: 16, endIndent: 16),
      ],
    );
  }
}
