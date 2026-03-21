import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrdeer_app/theme.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Decorative Element (fork & knife icon, subtle)
          Positioned(
            top: 0,
            right: 0,
            child: IgnorePointer(
              child: Opacity(
                opacity: 0.05,
                child: Transform.rotate(
                  angle: 12 * 3.1415927 / 180,
                  child: const Icon(
                    Icons.restaurant,
                    size: 300,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Logo Area
                      const Icon(
                        Icons.qr_code_2,
                        size: 64,
                        color: AppTheme.primaryColor,
                      ),
                      const SizedBox(height: 24),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                        style: GoogleFonts.inter(
                              fontSize: 28, // HeadlineMedium default
                              fontWeight: FontWeight.bold,
                            ),
                        children: [
                          const TextSpan(text: 'Welcome to Qrdee'),
                          TextSpan(
                            text: 'r',
                            style: GoogleFonts.inter(color: AppTheme.primaryColor),
                          ),
                        ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Manage your kitchen operations and staff with ease.',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.inter(
                              fontSize: 14, // BodyMedium default
                              color: Colors.grey,
                            ),
                      ),
                      const SizedBox(height: 48),

                      // Email
                      _buildLabel('Email Address'),
                      const SizedBox(height: 8),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'admin@restaurant.com',
                          prefixIcon: const Icon(Icons.mail_outline),
                          filled: true,
                          fillColor: Theme.of(context).cardColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: AppTheme.primaryColor, width: 2),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      // Password
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildLabel('Password'),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              minimumSize: Size.zero,
                              padding: EdgeInsets.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Text('Forgot Password?', style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        obscureText: _obscurePassword,
                        decoration: InputDecoration(
                          hintText: '••••••••',
                          prefixIcon: const Icon(Icons.lock_outline),
                          suffixIcon: IconButton(
                            icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                          filled: true,
                          fillColor: Theme.of(context).cardColor,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: AppTheme.primaryColor, width: 2),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),

                      // Login Button
                      ElevatedButton(
                        onPressed: () {
                          context.go('/home');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.primaryColor,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 4,
                          shadowColor: AppTheme.primaryColor.withOpacity(0.5),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Login to Dashboard', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold)),
                            const SizedBox(width: 8),
                            const Icon(Icons.arrow_forward, size: 20),
                          ],
                        ),
                      ),

                      const SizedBox(height: 40),

                      // Biometric Divider
                      Row(
                        children: [
                          Expanded(child: Divider(color: Colors.grey.withOpacity(0.3))),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'OR LOGIN WITH',
                              style: GoogleFonts.inter(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.bold, letterSpacing: 1.5),
                            ),
                          ),
                          Expanded(child: Divider(color: Colors.grey.withOpacity(0.3))),
                        ],
                      ),
                      const SizedBox(height: 32),

                      // Biometric Button
                      OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.fingerprint, color: AppTheme.primaryColor, size: 28),
                        label: Text('Staff Bio-ID', style: GoogleFonts.inter(color: Colors.black, fontWeight: FontWeight.bold)),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          side: BorderSide(color: Colors.grey.withOpacity(0.3)),
                        ),
                      ),

                      const SizedBox(height: 32),
                      // Contact Team
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('New staff member? ', style: GoogleFonts.inter(color: Colors.grey)),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              'Contact Team',
                              style: GoogleFonts.inter(color: AppTheme.primaryColor, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Text(
        text,
        style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600),
      ),
    );
  }
}
