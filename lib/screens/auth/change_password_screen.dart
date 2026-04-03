import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrdeer_app/theme.dart';
import 'package:qrdeer_app/l10n/app_localizations.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool _obscureCurrent = true;
  bool _obscureNew = true;
  bool _obscureConfirm = true;

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
        title: Text(AppLocalizations.of(context)!.changePasswordTitle, style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Intro
              Text(
                AppLocalizations.of(context)!.updateSecurity,
                style: GoogleFonts.inter(
                      fontSize: 18, // TitleLarge default
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                AppLocalizations.of(context)!.changePasswordDesc,
                style: GoogleFonts.inter(
                      fontSize: 14, // BodyMedium default
                      color: AppTheme.secondColorLight,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const SizedBox(height: 32),

              // Current Password Field
              _buildLabel(AppLocalizations.of(context)!.currentPassword),
              const SizedBox(height: 6),
              _buildPasswordField(
                hint: '••••••••',
                obscureText: _obscureCurrent,
                onToggle: () {
                  setState(() {
                    _obscureCurrent = !_obscureCurrent;
                  });
                },
              ),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 16),

              // New Password Field
              _buildLabel(AppLocalizations.of(context)!.newPassword),
              const SizedBox(height: 6),
              _buildPasswordField(
                hint: AppLocalizations.of(context)!.atLeast8Chars,
                obscureText: _obscureNew,
                onToggle: () {
                  setState(() {
                    _obscureNew = !_obscureNew;
                  });
                },
              ),
              const SizedBox(height: 8),
              Text(
                AppLocalizations.of(context)!.includeNumbersSymbols,
                style: GoogleFonts.inter(fontSize: 12, color: Colors.grey[600], fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 24),

              // Confirm Password Field
              _buildLabel(AppLocalizations.of(context)!.confirmNewPassword),
              const SizedBox(height: 6),
              _buildPasswordField(
                hint: AppLocalizations.of(context)!.repeatNewPassword,
                obscureText: _obscureConfirm,
                onToggle: () {
                  setState(() {
                    _obscureConfirm = !_obscureConfirm;
                  });
                },
              ),
              const SizedBox(height: 32),

              // Save Button
              ElevatedButton(
                onPressed: () {
                  context.push('/email-verification');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryColor,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(AppLocalizations.of(context)!.savePassword, style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 48),

              // Support Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppLocalizations.of(context)!.forgotYourPassword, style: GoogleFonts.inter(color: AppTheme.secondColorLight, fontWeight: FontWeight.w600)),
                  InkWell(
                    onTap: () {},
                    child: Text(AppLocalizations.of(context)!.resetItViaEmail, style: GoogleFonts.inter(color: AppTheme.primaryColor, fontWeight: FontWeight.w500, fontSize: 14)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),
    );
  }

  Widget _buildPasswordField({
    required String hint,
    required bool obscureText,
    required VoidCallback onToggle,
  }) {
    return TextField(
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: GoogleFonts.inter(fontSize: 16, color: Colors.grey),
        suffixIcon: IconButton(
          icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility, color: Colors.grey),
          onPressed: onToggle,
        ),
        filled: true,
        fillColor: Theme.of(context).cardColor,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: AppTheme.primaryColor, width: 1.5),
        ),
      ),
    );
  }
}
