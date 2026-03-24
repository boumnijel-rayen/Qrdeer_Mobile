import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrdeer_app/theme.dart';

class OrderDetailsHistoryScreen extends StatelessWidget {
  const OrderDetailsHistoryScreen({super.key});

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
        title: Text('Order Details #ORD-8939', style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Status Badge & Actions
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.check_circle, size: 16, color: Colors.green[700]),
                            const SizedBox(width: 6),
                            Text(
                              'COMPLETED & PAID',
                              style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.green[700], letterSpacing: 0.5),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          _buildActionButton(Icons.download),
                          const SizedBox(width: 8),
                          _buildActionButton(Icons.mail),
                        ],
                      ),
                    ],
                  ),
                ),

                // Order Info Card
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey.withOpacity(0.2)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('ORDER INFORMATION', style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.bold, color: AppTheme.secondColorLight, letterSpacing: 1)),
                        const SizedBox(height: 16),
                        _buildInfoRow(Icons.table_restaurant, 'Table Number', 'Table 04'),
                        const SizedBox(height: 12),
                        _buildInfoRow(Icons.schedule, 'Date & Time', 'Oct 24, 2023, 14:30', isNormalValue: true),
                      ],
                    ),
                  ),
                ),

                // Itemized List
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
                  child: Text('Items Ordered', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold)),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey.withOpacity(0.2)),
                  ),
                  child: Column(
                    children: [
                      _buildOrderItem('Mediterranean Salad', 'Qty: 2 x 12.500 TND', '25.000 TND', true, 'https://lh3.googleusercontent.com/aida-public/AB6AXuDb3VtPScpeH49Anx74fWdbFRLd5yu92Tf4lWmrokdgRPuZaZiI3h30BUc6uat-zh_n6l5RfZkcD7MMzStvInfSzvQNa8AKmW_6rpaQesNEyXkAb40_1ekW2iwLsnSS9PCluGgTi2yu4xsk9IjQeJCtnH-wtQ5ilUnmA4_VTG82klYRy0Y6e63LmIVSSHkHDiGuLk2TuP7rkI_2-V9YKpMbSmBJ_BGlDiXVo3Vvn7qp1ma9XiTsGG-4UOzmJoC8C-QgnwOzMEwYzz8'),
                      _buildOrderItem('Classic Pancakes', 'Qty: 1 x 15.000 TND', '15.000 TND', true, 'https://lh3.googleusercontent.com/aida-public/AB6AXuAJIZl4v1WaF7kSyDtRGwLKeCStcQtxJbx06gGYCQrsa5N1zBkm44G_991_FbRE1KR4_-V2D4dNW-h_pn9OLMlB5J8O9MlRENxEeHIcax4KyX3Q_JX6Ir2Ks_dM2MKWDmc8RDuMkLOWoTTsHiuMuNpSNFdyp4_rSIbH3aEA8E4WbJyUh5wL2yYG19I5QFeHwQs_XgRYzGUF5q-RAHpgCgzdK0ssxuaXtoC9167_Fr6jLoU0JsJ8wLjpAGV3HaR-YaGztgkJFS6oUHE'),
                      _buildOrderItem('Caffe Latte', 'Qty: 2 x 6.500 TND', '13.000 TND', false, 'https://lh3.googleusercontent.com/aida-public/AB6AXuDPbOlOkfGfuFFWOpJXGaovnss9ntdvV8C3z6PFmqf18QsPT1j7Qr6vd7h8_UWrLt76utaneggZn5iU1AKR17uS4roWyfD5vObTBeGwVV6FA5DcjV_9ys209PEKJfS6hbD_nSW4LK1mtN4R54TN6ZXBfV8iR9FGu8LXRetzC2Xz4MoAP0PccGyMw3UE6tD2NfIn0FcqvcKpTtFjwYzSG4V0xmO3hwIp2APPBa523lf6n0YUpnx3bxJYdXQniUB0MZ8mhhhRlknvMBU'),
                    ],
                  ),
                ),

                // Financial Summary
                Container(
                  margin: const EdgeInsets.all(16.0),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey.withOpacity(0.2)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Subtotal', style: GoogleFonts.inter(fontSize: 14, color: Colors.grey)),
                          Text('53.000 TND', style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500)),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Tax (10%)', style: GoogleFonts.inter(fontSize: 14, color: Colors.grey)),
                          Text('5.300 TND', style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500)),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        child: Divider(height: 0.2, color: Colors.grey,),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total Amount', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold)),
                          Text('58.300 TND', style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w700, color: AppTheme.primaryColor)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(IconData icon) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.withOpacity(0.3)),
      ),
      child: Icon(icon, size: 20, color: Colors.grey[700]),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value, {bool isNormalValue = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, size: 20, color: AppTheme.primaryColor),
            const SizedBox(width: 12),
            Text(label, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w500)),
          ],
        ),
        Text(value, style: GoogleFonts.inter(fontSize: 14, fontWeight: isNormalValue ? FontWeight.normal : FontWeight.bold)),
      ],
    );
  }

  Widget _buildOrderItem(String title, String qty, String price, bool showDivider, String imageUrl) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  imageUrl,
                  width: 48,
                  height: 48,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.fastfood, color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text(qty, style: GoogleFonts.inter(fontSize: 12, color: AppTheme.secondColorLight, fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
              Text(price, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold, color: AppTheme.primaryColor)),
            ],
          ),
        ),
        if (showDivider)
          Divider(height: 1, color: Colors.grey.withOpacity(0.1)),
      ],
    );
  }
}
