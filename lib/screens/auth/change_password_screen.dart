import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrdeer_app/theme.dart';

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
        title: const Text('Change Password'),
        actions: const [
          SizedBox(width: 48), // Padding equivalent for centering
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Intro
              Text(
                'Update Security',
                style: GoogleFonts.inter(
                      fontSize: 18, // TitleLarge default
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 4),
              Text(
                'Please enter your current password to verify your identity, then choose a new strong password.',
                style: GoogleFonts.inter(
                      fontSize: 14, // BodyMedium default
                      color: Colors.grey[600],
                    ),
              ),
              const SizedBox(height: 32),

              // Current Password Field
              _buildLabel('Current Password'),
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
              _buildLabel('New Password'),
              const SizedBox(height: 6),
              _buildPasswordField(
                hint: 'At least 8 characters',
                obscureText: _obscureNew,
                onToggle: () {
                  setState(() {
                    _obscureNew = !_obscureNew;
                  });
                },
              ),
              const SizedBox(height: 8),
              Text(
                'Include numbers and symbols for better security.',
                style: GoogleFonts.inter(fontSize: 12, color: Colors.grey),
              ),
              const SizedBox(height: 24),

              // Confirm Password Field
              _buildLabel('Confirm New Password'),
              const SizedBox(height: 6),
              _buildPasswordField(
                hint: 'Repeat new password',
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
                child: Text('Save Password', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 48),

              // Support Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Forgot your password? ', style: GoogleFonts.inter(color: Colors.grey, fontSize: 14)),
                  InkWell(
                    onTap: () {},
                    child: Text('Reset it via email', style: GoogleFonts.inter(color: AppTheme.primaryColor, fontWeight: FontWeight.w500, fontSize: 14)),
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
      style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500),
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
