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
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: AppTheme.primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.restaurant, color: AppTheme.primaryColor),
          ),
        ),
        title: const Text('Tables & QR'),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: ElevatedButton.icon(
              onPressed: () {
                context.push('/tables/view-qr');
              },
              icon: const Icon(Icons.add, size: 16),
              label: const Text('Add Table'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                textStyle: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
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
                _buildTableCard(context, 'Table 01', '4 Seats', 'ID: QR_T01_NORTH', true, 'https://lh3.googleusercontent.com/aida-public/AB6AXuAHhCulD1eMmnLnh_Qu2dliRECu4meOuAAjd99A7RUb1mUhCFSUlhM1sWdlOt89NsLrpbie_hUzmt-1XLT7jUfSAuu-wUv-mjyguj5wc8UVdjSt9TJvMn5kv4RTBToRetO1yAMfXoyc3KnnIW04HF0UH-tOoxWPxqDkVlnKopfvFc-_mZoTiq_8epPWWscGiF7mG7cFCQmqsdbui4LkvVQ_WJPxSBJT6URJgkHvQEIMLiwepV6vhtq3Y2RV82On2gvJZ6xElyihnok'),
                _buildTableCard(context, 'Table 02', '2 Seats', 'ID: QR_T02_WINDOW', false, 'https://lh3.googleusercontent.com/aida-public/AB6AXuCM8JwlTgew9S9SpxcDQyjTeaxW17tp0HAY8a7iz-cMul_2fU4vx0GtJb3bYUbfZg6IBVSYTpNKOjkLU6ioSBt4x_SxgdvlkuAsBJOlsQc2cyvWhLaFLOHsGxKL0bOo9Ukmh_ToFPnBhxOmtxWDl8--S60UwnpSCqB7qK4865JHIysaBTq9H53nE_j04xJSk06_H-xySCWsUpT2Iiyjmradds5yO4teRAGz9VOls5VSCfqw5MzfDB8sednsz6w-75S5R_nx3Svj3lE'),
                _buildTableCard(context, 'Table 03', '6 Seats', 'ID: QR_T03_CENTER', false, 'https://lh3.googleusercontent.com/aida-public/AB6AXuD5OE1HC40GcTyy1xwH8VDo8PflWrxalicxuKEDCF3SiDpvaThT4KvLUUhcW2PTSxIU_HAxP2lmJijRIr3Qaz0vXhqRWFx8CPO9i1JzdnBzk3oC6YHYzmH9W34utyrCwRm22w8rPl4YDo0z5cvLVL0wHtvEVY4Hn1oTxfWzWnIEf4knaVNfXZgQ6ZEsjB47xwHJ3G4cYbHLfxR1TEOwVUKeE8HfaZwKwbrANtrwxwMP6RcfrhVsUqyhKlkzndnVL1LsupG_WgHNnPU'),
                _buildTableCard(context, 'Table 04', '4 Seats', 'ID: QR_T04_PATIO', true, 'https://lh3.googleusercontent.com/aida-public/AB6AXuDLl6G9bgY2_9ps9b3c0OSo8YGwqypzlpwoTYAax705eOtTpw9rifkrSqY_LTzm6KSWpm2xMGQy1vDlq1BolDv5L4gJG4g7srHHdbQ5l9P8E_zWuEKb2WxcEr_YKW-bsKsLp-hWWwWtnQuHiZ4ckhnrQ5cbVTEyKdz-ZrIRz_1CULb6p-MtPNGBo1g53sJxokPCDeLhIL1iF5y-wgFa4NztmyVZnfaK5H2idoZJe7Ah7A1pDcNkpqbknG_cgv9a-mBsrMoumQP6XWM'),
                _buildTableCard(context, 'Table 05', '2 Seats', 'ID: QR_T05_BAR', false, 'https://lh3.googleusercontent.com/aida-public/AB6AXuApitQCwb06JBj33b_yulSUNXfIliigPpdyamLfLHjvVSDQ6xpiPF3m0yQuGHraFJ4NfTrLyj9xWbSiRW9QYBwOovE0wN0TnCDhdyFZdKn6eysFDwQLzd6XXngAVYwFUfUayCU3aiQCH8iP6FQD5eguGZwrY56oLxwCtNXTVBuAL1kR5Skt8FMoeZslwy8W6xvDPYhjozmPwIVJ3Zz62HtksnLkm4UvkQ85K62_K12u13dk7B9x7Xwh0VzY-B6rPjdqEIamW_BV9_M'),
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
                      color: isAvailable ? Colors.green.withOpacity(0.1) : Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      isAvailable ? 'AVAILABLE' : 'DISABLED',
                      style: GoogleFonts.inter(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: isAvailable ? Colors.green[700] : Colors.red[700],
                        letterSpacing: 0.5,
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
                    Text(seats, style: GoogleFonts.inter(fontSize: 12, color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 4),
                Text(id, style: GoogleFonts.inter(fontSize: 12, color: Colors.grey)),
                const SizedBox(height: 12),
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
                    child: Text('View QR Code', style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.bold)),
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
