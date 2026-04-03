import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrdeer_app/theme.dart';
import 'package:qrdeer_app/l10n/app_localizations.dart';

class AddStaffScreen extends StatefulWidget {
  const AddStaffScreen({super.key});

  @override
  State<AddStaffScreen> createState() => _AddStaffScreenState();
}

class _AddStaffScreenState extends State<AddStaffScreen> {
  String _selectedRole = 'waiter';

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
        title: Text(AppLocalizations.of(context)!.addStaffMember),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Full Name
            Text(AppLocalizations.of(context)!.fullName, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87)),
            const SizedBox(height: 8),
            TextFormField(
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.egFullName,
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

            // Role Selection
            Text(AppLocalizations.of(context)!.role, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87)),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(4),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedRole = 'senior_waiter';
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: _selectedRole == 'senior_waiter' ? Theme.of(context).cardColor : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: _selectedRole == 'senior_waiter' ? [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4)] : [],
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.seniorWaiter,
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: _selectedRole == 'senior_waiter' ? AppTheme.primaryColor : Colors.grey[600],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedRole = 'waiter';
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: _selectedRole == 'waiter' ? Theme.of(context).cardColor : Colors.transparent,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: _selectedRole == 'waiter' ? [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4)] : [],
                        ),
                        child: Text(
                          AppLocalizations.of(context)!.waiter,
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: _selectedRole == 'waiter' ? AppTheme.primaryColor : Colors.grey[600],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Email Address
            Text(AppLocalizations.of(context)!.emailAddress, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87)),
            const SizedBox(height: 8),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.egEmail,
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

            // Phone Number
            Text(AppLocalizations.of(context)!.phoneNumber, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87)),
            const SizedBox(height: 8),
            TextFormField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.egPhone,
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text('+216', style: GoogleFonts.inter(fontWeight: FontWeight.w500, color: Colors.grey))],
                  ),
                ),
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

            // Passwords
            Text(AppLocalizations.of(context)!.password, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87)),
            const SizedBox(height: 8),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: '••••••••',
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

            Text(AppLocalizations.of(context)!.confirmPassword, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black87)),
            const SizedBox(height: 8),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: '••••••••',
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

            // Action Buttons
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryColor,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 56),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                textStyle: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              child: Text(AppLocalizations.of(context)!.addStaffMember),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                if (context.canPop()) {
                  context.pop();
                }
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.grey[600],
                minimumSize: const Size(double.infinity, 56),
                textStyle: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              child: Text(AppLocalizations.of(context)!.cancel),
            ),
          ],
        ),
      ),
    );
  }
}
