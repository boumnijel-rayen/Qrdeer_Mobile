import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrdeer_app/theme.dart';

class StaffAccessScreen extends StatelessWidget {
  const StaffAccessScreen({super.key});

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
        title: const Text('Staff Access'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: ElevatedButton.icon(
              onPressed: () {
                context.push('/account/staff/add');
              },
              icon: const Icon(Icons.add, size: 18),
              label: const Text('Add Staff'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primaryColor,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                textStyle: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.bold),
                elevation: 0,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 24),
          // Filters
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              children: [
                _buildFilterChip('All', true),
                _buildFilterChip('Manager', false),
                _buildFilterChip('Senior Waiter', false),
                _buildFilterChip('Waiter', false),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              '5 Active members',
              style: GoogleFonts.inter(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Staff List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              children: [
                _buildStaffCard(context, 'Johnathan Doe', 'Manager', true, imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuD6m8ez-DHVyccs_OxoxR319qc5ceb13z4NRaqZTILgD0T1J_vmxQZdwf8s-gTwEq-4eayKoj20_dYhPmgdD8gTcLxYaZY0mA16B0wN7f_dUspBiecoi7-t0PlTc5atulB4jcoxxbUy3y6lba3nglLYY5FW1cwveiZae3e409AVjICX_W-jkCnV2gmLI5rJou9vidL2ngpXo3jyVnKnFU4xyxSRhHMAywXO1BC3NCSmo0HhykpAY1KUhNa2B_t6iVZGHIrPtwaiT_g'),
                _buildStaffCard(context, 'Sarah Jenkins', 'Senior Waiter', true, imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuB11_96LrLd-lnVJpspLYmY5xd2Yiowo2-a9uSfaimc2Qim3xmpaU5FxQzb-L8_SGDUtX62d1gN4-CjqLJJL5uJmFT6YHzUyRkxqqyMt1vflh0EAq_4Yhc8bVsKQiYNfCpW6-BoUkEhpKyyGxfHgF16WZNnUF1XVjvJlWmwbtoNrCsiXeJ6rcMejkHTB03CeWc0cY-NRSbNhMULrE_GIMYiSRKuDCnF-4Dg288XRJCI48a7DFL1I3ZRA0RxaxsOIoV56Z05rYBnPtE'),
                _buildStaffCard(context, 'Marcus Chen', 'Waiter', true, imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDOIgfQABkV8KMk64_LqHoQ7hNiO7pK3PRyL3ZlCimWFiHg2zXVjuYsZrNDe3U3bM79xy73k5inUoNkwfRxHfBLjYd11ZTQy0_Ih955z7JoxZ0zM3MTXJr2XVYIHpsVKrzz8gblY0zCPR0haV5dvftIVc7eplFc1GPBrszkAFPfbc_OSYXDkZXhc07gJY3RSgsBqqOpKRZWVaNhMgkpG0CIFeRjQqqoFOnNJqBl1UKiquiY_6WxDS0EhMC5580ZH3xtvr91kmVLSFs'),
                _buildStaffCard(context, 'Emily Wang', 'Waiter', true, imageUrl: 'https://lh3.googleusercontent.com/aida-public/AB6AXuDEcw4M6pDTHWgpPsRLzTiQ9SbgXUHB-RT1aqDaOaVVF_kUm3EJh2Zo5VhNNkEWNz65PvQ-GGsnmKt76bumywFQHcQ23kAVKhdRJcrT4vu-TcmviqPoct5Uruy9v7aN6sT-qmlpAiMptMQF38s6TibJQLaailiueNiWfdNfRRRlqcn5HVVQjo0y_WtPFqfydF68hDrmDXW_DW8oE2c_avgVNqKIJngKER_JPdnPvy6dYiz3CG2xtfSs_cvJqI8miZMG4vKE3gRUD7Q'),
                _buildStaffCard(context, 'Alex Rivera', 'Waiter', false),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 8.0),
      child: FilterChip(
        label: Text(label),
        selected: isSelected,
        onSelected: (bool value) {},
        backgroundColor: Colors.grey[100],
        selectedColor: AppTheme.primaryColor,
        labelStyle: GoogleFonts.inter(
          color: isSelected ? Colors.white : Colors.grey[700],
          fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        showCheckmark: false,
      ),
    );
  }

  Widget _buildStaffCard(BuildContext context, String name, String role, bool isActive, {String? imageUrl}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 4, offset: const Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          // Avatar
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              shape: BoxShape.circle,
              border: Border.all(color: AppTheme.primaryColor.withOpacity(0.2), width: 2),
            ),
            child: imageUrl != null
                ? ClipOval(child: Image.network(imageUrl, width: 56, height: 56, fit: BoxFit.cover))
                : Icon(Icons.person, color: Colors.grey[400], size: 32),
          ),
          const SizedBox(width: 16),

          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: isActive ? Colors.green.withOpacity(0.1) : Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        isActive ? 'ACTIVE' : 'INACTIVE',
                        style: GoogleFonts.inter(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: isActive ? Colors.green[700] : Colors.grey[600],
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(role, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500, color: AppTheme.primaryColor)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.mail, size: 16, color: Colors.grey[400]),
                    const SizedBox(width: 12),
                    Icon(Icons.call, size: 16, color: Colors.grey[400]),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),

          // Edit Button
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit, size: 20),
            color: Colors.grey[600],
            style: IconButton.styleFrom(
              backgroundColor: Colors.grey[50],
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ],
      ),
    );
  }
}
