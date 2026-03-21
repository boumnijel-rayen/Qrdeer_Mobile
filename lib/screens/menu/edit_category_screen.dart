import 'package:flutter/material.dart';
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
        title: const Text('Edit Category'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text('Preview', style: GoogleFonts.inter(color: AppTheme.primaryColor, fontWeight: FontWeight.bold)),
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
                  Text('Category Name', style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600)),
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
                    label: Text('Delete Category', style: GoogleFonts.inter(color: Colors.grey, fontWeight: FontWeight.w500)),
                  ),
                  
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.0),
                    child: Divider(height: 1),
                  ),

                  // Assigned Items List
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Assigned Items', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold)),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text('5 Items', style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.grey)),
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
                        _buildDraggableItem('Garlic Bread with Herbs', '8.50 TND', true),
                        _buildDraggableItem('Crispy Calamari Rings', '14.00 TND', true),
                        _buildDraggableItem('Tomato Bruschetta', '10.00 TND', true),
                        _buildDraggableItem('Caesar Salad', '12.00 TND', true),
                        _buildDraggableItem('Buffalo Wings (6pcs)', '11.50 TND', false),
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
              child: Text('Save Changes', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold)),
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
