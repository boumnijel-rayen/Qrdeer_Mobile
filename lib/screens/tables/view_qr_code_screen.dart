import 'package:flutter/material.dart';
import 'package:qrdeer_app/l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrdeer_app/theme.dart';

class ViewQrCodeScreen extends StatefulWidget {
  const ViewQrCodeScreen({super.key});

  @override
  State<ViewQrCodeScreen> createState() => _ViewQrCodeScreenState();
}

class _ViewQrCodeScreenState extends State<ViewQrCodeScreen> {
  bool _isAvailable = true;

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
        title: Text(AppLocalizations.of(context)!.tableId('04'), style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 24),
              child: Column(
                children: [
                  // Status Selector
                  Padding(
                    padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
                    child: Container(
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
                                  _isAvailable = true;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: _isAvailable ? Theme.of(context).cardColor : Colors.transparent,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: _isAvailable ? [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4)] : [],
                                ),
                                child: Text(
                                  AppLocalizations.of(context)!.available,
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: _isAvailable ? FontWeight.bold : FontWeight.w500,
                                    color: _isAvailable ? AppTheme.primaryColor : Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isAvailable = false;
                                });
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: !_isAvailable ? Theme.of(context).cardColor : Colors.transparent,
                                  borderRadius: BorderRadius.circular(8),
                                  boxShadow: !_isAvailable ? [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4)] : [],
                                ),
                                child: Text(
                                  AppLocalizations.of(context)!.disabled,
                                  style: GoogleFonts.inter(
                                    fontSize: 14,
                                    fontWeight: !_isAvailable ? FontWeight.bold : FontWeight.w500,
                                    color: !_isAvailable ? AppTheme.primaryColor : Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Text(
                      AppLocalizations.of(context)!.whenDisabledDesc,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.inter(fontSize: 12, color: AppTheme.secondColorLight, fontWeight: FontWeight.w600),
                    ),
                  ),

                  // QR Code Display
                  Container(
                    margin: const EdgeInsets.all(34),
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.withOpacity(0.2)),
                      boxShadow: [
                        BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 8, offset: const Offset(0, 4)),
                      ],
                    ),
                    child: Center(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              'https://fragrant.mobiletransaction.org/wp-content/uploads/2019/09/qr-code-for-wikipedia.png.webp',
                              width: 200,
                              height: 200,
                              fit: BoxFit.contain,
                              errorBuilder: (_, __, ___) => Container(
                                width: 200,
                                height: 200,
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: const Icon(Icons.qr_code_scanner, size: 100, color: Colors.grey),
                              ),
                            ),
                          ),
                          Container(
                            width: 48,
                            height: 48,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(color: AppTheme.primaryColor.withOpacity(0.2), width: 2),
                            ),
                            child: const Icon(Icons.restaurant, color: AppTheme.primaryColor, size: 28),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // Table Info
                  Text(AppLocalizations.of(context)!.tableId('04'), style: GoogleFonts.inter(fontSize: 32, fontWeight: FontWeight.w800)),
                  Container(
                    margin: const EdgeInsets.all(24),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: const Border(left: BorderSide(color: AppTheme.primaryColor, width: 4)),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.info, color: AppTheme.primaryColor, size: 20),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            AppLocalizations.of(context)!.presentCodeDesc,
                            style: GoogleFonts.inter(fontSize: 14, color: AppTheme.thirdColorLight, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Action Buttons
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.download),
                  label: Text(AppLocalizations.of(context)!.downloadQrCode),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primaryColor,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 56),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    textStyle: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
