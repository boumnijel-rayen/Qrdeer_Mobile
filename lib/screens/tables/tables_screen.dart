import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrdeer_app/theme.dart';

class TablesScreen extends StatelessWidget {
  const TablesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 72,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(Icons.restaurant, color: Theme.of(context).cardColor, size: 24),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Tables Management', style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
                  Text('Main Street Bistro', style: GoogleFonts.inter(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w700)),
                ],
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ElevatedButton.icon(
              onPressed: () {
                context.push('/tables/view-qr');
              },
              icon: const Icon(Icons.add, size: 16,),
              label: const Text('Add Table'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                textStyle: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(3),
          child: Column(
              children: [
              Divider(height: 1, color: Colors.grey.withOpacity(0.2), thickness: 1),
          ])
        )
      ),
      body: Column(
        children: [
          // Tabs Navigation
          Container(
            color: Theme.of(context).cardColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildTab('All Tables', true),
                _buildTab('Available', false),
                _buildTab('Disabled', false),
              ],
            ),
          ),
          
          // Main Content (Scrollable Grid)
          Expanded(
            child: GridView.count(
              padding: const EdgeInsets.all(16),
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.75, // Adjust height based on content
              children: [
                _buildTableCard(context, 'Table 01', '4 Seats', 'ID: QR_T01_NORTH', true, 'https://lh3.googleusercontent.com/aida-public/AB6AXuCM8JwlTgew9S9SpxcDQyjTeaxW17tp0HAY8a7iz-cMul_2fU4vx0GtJb3bYUbfZg6IBVSYTpNKOjkLU6ioSBt4x_SxgdvlkuAsBJOlsQc2cyvWhLaFLOHsGxKL0bOo9Ukmh_ToFPnBhxOmtxWDl8--S60UwnpSCqB7qK4865JHIysaBTq9H53nE_j04xJSk06_H-xySCWsUpT2Iiyjmradds5yO4teRAGz9VOls5VSCfqw5MzfDB8sednsz6w-75S5R_nx3Svj3lE'),
                _buildTableCard(context, 'Table 02', '2 Seats', 'ID: QR_T02_WINDOW', false, 'https://lh3.googleusercontent.com/aida-public/AB6AXuCM8JwlTgew9S9SpxcDQyjTeaxW17tp0HAY8a7iz-cMul_2fU4vx0GtJb3bYUbfZg6IBVSYTpNKOjkLU6ioSBt4x_SxgdvlkuAsBJOlsQc2cyvWhLaFLOHsGxKL0bOo9Ukmh_ToFPnBhxOmtxWDl8--S60UwnpSCqB7qK4865JHIysaBTq9H53nE_j04xJSk06_H-xySCWsUpT2Iiyjmradds5yO4teRAGz9VOls5VSCfqw5MzfDB8sednsz6w-75S5R_nx3Svj3lE'),
                _buildTableCard(context, 'Table 03', '6 Seats', 'ID: QR_T03_CENTER', false, 'https://lh3.googleusercontent.com/aida-public/AB6AXuCM8JwlTgew9S9SpxcDQyjTeaxW17tp0HAY8a7iz-cMul_2fU4vx0GtJb3bYUbfZg6IBVSYTpNKOjkLU6ioSBt4x_SxgdvlkuAsBJOlsQc2cyvWhLaFLOHsGxKL0bOo9Ukmh_ToFPnBhxOmtxWDl8--S60UwnpSCqB7qK4865JHIysaBTq9H53nE_j04xJSk06_H-xySCWsUpT2Iiyjmradds5yO4teRAGz9VOls5VSCfqw5MzfDB8sednsz6w-75S5R_nx3Svj3lE'),
                _buildTableCard(context, 'Table 04', '4 Seats', 'ID: QR_T04_PATIO', true, 'https://lh3.googleusercontent.com/aida-public/AB6AXuCM8JwlTgew9S9SpxcDQyjTeaxW17tp0HAY8a7iz-cMul_2fU4vx0GtJb3bYUbfZg6IBVSYTpNKOjkLU6ioSBt4x_SxgdvlkuAsBJOlsQc2cyvWhLaFLOHsGxKL0bOo9Ukmh_ToFPnBhxOmtxWDl8--S60UwnpSCqB7qK4865JHIysaBTq9H53nE_j04xJSk06_H-xySCWsUpT2Iiyjmradds5yO4teRAGz9VOls5VSCfqw5MzfDB8sednsz6w-75S5R_nx3Svj3lE'),
                _buildTableCard(context, 'Table 05', '2 Seats', 'ID: QR_T05_BAR', false, 'https://lh3.googleusercontent.com/aida-public/AB6AXuCM8JwlTgew9S9SpxcDQyjTeaxW17tp0HAY8a7iz-cMul_2fU4vx0GtJb3bYUbfZg6IBVSYTpNKOjkLU6ioSBt4x_SxgdvlkuAsBJOlsQc2cyvWhLaFLOHsGxKL0bOo9Ukmh_ToFPnBhxOmtxWDl8--S60UwnpSCqB7qK4865JHIysaBTq9H53nE_j04xJSk06_H-xySCWsUpT2Iiyjmradds5yO4teRAGz9VOls5VSCfqw5MzfDB8sednsz6w-75S5R_nx3Svj3lE'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: isSelected ? AppTheme.primaryColor : Colors.transparent,
            width: 2,
          ),
        ),
      ),
      child: Text(
        label,
        style: GoogleFonts.inter(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: isSelected ? AppTheme.primaryColor : Colors.grey[500],
        ),
      ),
    );
  }

  Widget _buildTableCard(BuildContext context, String title, String seats, String id, bool isAvailable, String qrImageUrl) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 4, offset: const Offset(0, 2)),
        ],
      ),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.05),
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  ),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.network(
                      qrImageUrl,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                      opacity: const AlwaysStoppedAnimation(0.85),
                      errorBuilder: (_, __, ___) => const Center(
                        child: Icon(Icons.qr_code_2, size: 64, color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: isAvailable ? Color(0xFFD4F3DF) : Color(0xFFE2E8F0),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      isAvailable ? 'AVAILABLE' : 'DISABLED',
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                        color: isAvailable ? Colors.green[700] : AppTheme.thirdColorLight,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(title, style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 4),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      context.push('/tables/view-qr');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primaryColor.withOpacity(0.1),
                      foregroundColor: AppTheme.primaryColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Text('View QR Code', style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w700)),
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
