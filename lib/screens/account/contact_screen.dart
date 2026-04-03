import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrdeer_app/theme.dart';
import 'package:qrdeer_app/l10n/app_localizations.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

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
        title: Text(AppLocalizations.of(context)!.contactSupportTitle, style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
              child: Text(
                'QRDEER',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.bold,
                  color: AppTheme.primaryColor.withOpacity(0.8),
                  letterSpacing: -0.5,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(AppLocalizations.of(context)!.haveAQuestion, style: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text(
                AppLocalizations.of(context)!.contactDesc,
                style: GoogleFonts.inter(fontSize: 14, color: AppTheme.secondColorLight, height: 1.5, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 32),

              // Subject Field
              Text(AppLocalizations.of(context)!.subject, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black)),
              const SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.subjectHint,
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
                ),
              ),
              const SizedBox(height: 24),

              // Message Field
              Text(AppLocalizations.of(context)!.message, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black)),
              const SizedBox(height: 8),
              TextFormField(
                maxLines: 6,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.messageHint,
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
                ),
              ),
              const SizedBox(height: 32),

              // Submit Button
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.send, size: 20),
                label: Text(AppLocalizations.of(context)!.sendMessage),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryColor,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  textStyle: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 32),

              // Footer Info
              Center(
                child: Text.rich(
                  TextSpan(
                    text: AppLocalizations.of(context)!.expectedResponseTime,
                    style: GoogleFonts.inter(fontSize: 14, color: Colors.grey[600], fontWeight: FontWeight.w500),
                    children: [
                      TextSpan(
                        text: AppLocalizations.of(context)!.within24Hours,
                        style: GoogleFonts.inter(fontWeight: FontWeight.w600, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
