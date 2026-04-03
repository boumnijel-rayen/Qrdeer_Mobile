import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrdeer_app/theme.dart';
import 'package:qrdeer_app/l10n/app_localizations.dart';

class EditRestaurantScreen extends StatelessWidget {
  const EditRestaurantScreen({super.key});

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
        toolbarHeight: 68,
        title: Text(AppLocalizations.of(context)!.settings, style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(AppLocalizations.of(context)!.editRestaurantName, style: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text(
                    AppLocalizations.of(context)!.editRestaurantNameDesc,
                    style: GoogleFonts.inter(fontSize: 14, color: AppTheme.secondColorLight, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 32),

                  // Form Section
                  Text(AppLocalizations.of(context)!.restaurantName, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black)),
                  const SizedBox(height: 8),
                  TextFormField(
                    initialValue: 'The Golden Fork',
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.egRestaurantName,
                      hintStyle: GoogleFonts.inter(fontSize: 16, color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white,
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
                        borderSide: const BorderSide(color: AppTheme.primaryColor, width: 2),
                      ),
                    ),
                    style: GoogleFonts.inter(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 24),
                  
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primaryColor,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 56),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      textStyle: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    child: Text(AppLocalizations.of(context)!.saveChanges),
                  ),

                  const SizedBox(height: 48),

                  // Additional Help Info
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.withOpacity(0.3), style: BorderStyle.solid),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.info, color: AppTheme.primaryColor),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(AppLocalizations.of(context)!.needHelp, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600)),
                              const SizedBox(height: 4),
                              Text(
                                AppLocalizations.of(context)!.changingNameHelp,
                                style: GoogleFonts.inter(fontSize: 12, color: Colors.grey[600]),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
