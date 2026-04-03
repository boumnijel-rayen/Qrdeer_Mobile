import 'package:flutter/material.dart';
import 'package:qrdeer_app/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrdeer_app/theme.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  String _selectedTab = 'item'; // 'item' or 'category'
  bool _hasMultipleSizes = false;
  bool _isAvailable = true;
  List<Map<String, String>> _sizes = [];

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
        title: Text(AppLocalizations.of(context)!.addNew),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Segmented Control
                  Container(
                    height: 48,
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedTab = 'item';
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: _selectedTab == 'item' ? Theme.of(context).cardColor : Colors.transparent,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: _selectedTab == 'item'
                                    ? [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4, offset: const Offset(0, 2))]
                                    : null,
                              ),
                              child: Text(
                                AppLocalizations.of(context)!.item,
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: _selectedTab == 'item' ? FontWeight.bold : FontWeight.w500,
                                  color: _selectedTab == 'item' ? AppTheme.primaryColor : Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedTab = 'category';
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: _selectedTab == 'category' ? Theme.of(context).cardColor : Colors.transparent,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: _selectedTab == 'category'
                                    ? [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4, offset: const Offset(0, 2))]
                                    : null,
                              ),
                              child: Text(
                                AppLocalizations.of(context)!.category,
                                style: GoogleFonts.inter(
                                  fontSize: 14,
                                  fontWeight: _selectedTab == 'category' ? FontWeight.bold : FontWeight.w500,
                                  color: _selectedTab == 'category' ? AppTheme.primaryColor : Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  
                  if (_selectedTab == 'item') _buildItemForm() else _buildCategoryForm(),
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

  Widget _buildItemForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image Upload Section
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 40),
          decoration: BoxDecoration(
            color: AppTheme.primaryColor.withOpacity(0.05),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppTheme.primaryColor.withOpacity(0.2), style: BorderStyle.solid),
          ),
          child: Column(
            children: [
              const Icon(Icons.add_a_photo, size: 40, color: AppTheme.primaryColor),
              const SizedBox(height: 8),
              Text(AppLocalizations.of(context)!.uploadDishImage, style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold)),
              Text(AppLocalizations.of(context)!.jpgOrPng, style: GoogleFonts.inter(fontSize: 12, color: Colors.grey)),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryColor,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: Text(AppLocalizations.of(context)!.selectImage, style: GoogleFonts.inter(fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),

        // Item Name
        Text(AppLocalizations.of(context)!.itemName, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        _buildTextField(AppLocalizations.of(context)!.eGGrilledSeaBass),
        const SizedBox(height: 24),

        // Category
        Text(AppLocalizations.of(context)!.category, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          decoration: InputDecoration(
            filled: true,
            fillColor: Theme.of(context).cardColor,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.withOpacity(0.3))),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.withOpacity(0.3))),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppTheme.primaryColor, width: 1.5)),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          ),
          items: [
            DropdownMenuItem(value: 'appetizers', child: Text(AppLocalizations.of(context)!.categoryAppetizers)),
            DropdownMenuItem(value: 'main', child: Text(AppLocalizations.of(context)!.categoryMainCourse)),
            DropdownMenuItem(value: 'desserts', child: Text(AppLocalizations.of(context)!.categoryDesserts)),
            DropdownMenuItem(value: 'drinks', child: Text(AppLocalizations.of(context)!.categoryDrinks)),
          ],
          onChanged: (value) {},
          hint: Text(AppLocalizations.of(context)!.selectCategory),
        ),
        const SizedBox(height: 24),

        // Multiple Sizes Toggle
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(AppLocalizations.of(context)!.hasMultipleSizes, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600)),
            Switch(
              value: _hasMultipleSizes,
              onChanged: (val) {
                setState(() {
                  _hasMultipleSizes = val;
                });
              },
              activeColor: AppTheme.primaryColor,
            ),
          ],
        ),
        const SizedBox(height: 16),

        // Pricing logic
        if (!_hasMultipleSizes)
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppLocalizations.of(context)!.priceTnd, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 8),
                    _buildTextField('0.000', keyboardType: TextInputType.number),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppLocalizations.of(context)!.available, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600)),
                    const SizedBox(height: 8),
                    Switch(
                      value: _isAvailable,
                      onChanged: (val) {
                        setState(() { _isAvailable = val; });
                      },
                      activeColor: AppTheme.primaryColor,
                    ),
                  ],
                ),
              ),
            ],
          )
        else
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(AppLocalizations.of(context)!.sizes, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              ...List.generate(_sizes.length + 1, (index) {
                if (index == _sizes.length) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: OutlinedButton.icon(
                      onPressed: () {
                        setState(() {
                          _sizes.add({'name': '', 'price': ''});
                        });
                      },
                      icon: const Icon(Icons.add, size: 18),
                      label: Text(AppLocalizations.of(context)!.addSize, style: GoogleFonts.inter()),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppTheme.primaryColor,
                        side: const BorderSide(color: AppTheme.primaryColor),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  );
                }
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: _buildTextField(AppLocalizations.of(context)!.sizeEgSmall, height: 48),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        flex: 1,
                        child: _buildTextField(AppLocalizations.of(context)!.price, height: 48, keyboardType: TextInputType.number),
                      ),
                      const SizedBox(width: 8),
                      Switch(value: true, onChanged: (_) {}, activeColor: AppTheme.primaryColor),
                      IconButton(
                        icon: const Icon(Icons.delete, color: Colors.grey),
                        onPressed: () {
                          setState(() {
                            _sizes.removeAt(index);
                          });
                        },
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),
        
        const SizedBox(height: 24),

        // Description
        Text(AppLocalizations.of(context)!.description, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        TextField(
          maxLines: 4,
          decoration: InputDecoration(
            hintText: AppLocalizations.of(context)!.describeIngredients,
            filled: true,
            fillColor: Theme.of(context).cardColor,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.withOpacity(0.3))),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.withOpacity(0.3))),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppTheme.primaryColor, width: 1.5)),
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppLocalizations.of(context)!.categoryName, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        _buildTextField(AppLocalizations.of(context)!.eGBreakfast),
        const SizedBox(height: 24),

        Text(AppLocalizations.of(context)!.assignExistingItems, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.grey.withOpacity(0.2)),
          ),
          child: Column(
            children: [
              _buildCheckboxItem(AppLocalizations.of(context)!.itemGrilledChicken),
              Divider(height: 1, color: Colors.grey.withOpacity(0.1)),
              _buildCheckboxItem(AppLocalizations.of(context)!.itemClassicBurger),
            ],
          ),
        ),
        const SizedBox(height: 24),

        Text(AppLocalizations.of(context)!.displayOrder, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        _buildTextField(AppLocalizations.of(context)!.eG1, keyboardType: TextInputType.number),
      ],
    );
  }

  Widget _buildTextField(String hint, {TextInputType? keyboardType, double? height}) {
    return SizedBox(
      height: height,
      child: TextField(
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: Theme.of(context).cardColor,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.withOpacity(0.3))),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey.withOpacity(0.3))),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: AppTheme.primaryColor, width: 1.5)),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        ),
      ),
    );
  }

  Widget _buildCheckboxItem(String title) {
    return CheckboxListTile(
      value: false,
      onChanged: (val) {},
      title: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(color: Colors.grey.withOpacity(0.2), borderRadius: BorderRadius.circular(4)),
          ),
          const SizedBox(width: 12),
          Text(title, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500)),
        ],
      ),
      activeColor: AppTheme.primaryColor,
      controlAffinity: ListTileControlAffinity.trailing,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    );
  }
}
