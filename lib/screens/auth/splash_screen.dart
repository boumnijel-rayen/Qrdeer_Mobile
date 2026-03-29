import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrdeer_app/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _controller.forward();

    // Navigate to login after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        context.go('/login');
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          // Subtle gradient equivalent to the HTML's radial gradient
          gradient: RadialGradient(
            colors: [
              AppTheme.primaryColor.withOpacity(0.08),
              Theme.of(context).scaffoldBackgroundColor,
            ],
            center: Alignment.topRight,
            radius: 1.5,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Center Content
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Opacity(
                  opacity: _fadeAnimation.value,
                  child: Transform.scale(
                    scale: _scaleAnimation.value,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Logo Box
                        Container(
                          width: 112, // 28 * 4
                          height: 112,
                          decoration: BoxDecoration(
                            color: AppTheme.primaryColor,
                            borderRadius: BorderRadius.circular(24),
                            boxShadow: [
                              BoxShadow(
                                color: AppTheme.primaryColor.withOpacity(0.3),
                                blurRadius: 24,
                                spreadRadius: 8,
                              )
                            ],
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.qr_code_2,
                              color: Colors.white,
                              size: 60,
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        // Title
                        RichText(
                          text: TextSpan(
                            style: GoogleFonts.inter(
                                  fontSize: 36, // DisplaySmall default
                                  fontWeight: FontWeight.bold,
                                ),
                            children: [
                              const TextSpan(text: 'Qrdee', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w800)),
                              TextSpan(
                                text: 'r',
                                style: GoogleFonts.inter(color: AppTheme.primaryColor, fontWeight: FontWeight.w800),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Subtitle
                        Text(
                          'HOSPITALITY EXCELLENCE',
                          style: GoogleFonts.inter(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 2.0,
                            color: Theme.of(context).textTheme.bodySmall?.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            // Footer
            Positioned(
              bottom: 40,
              child: Text(
                'QRDEER TECHNOLOGIES © 2024',
                style: GoogleFonts.inter(
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 3.0,
                  color: Theme.of(context).textTheme.bodySmall?.color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
