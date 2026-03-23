import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrdeer_app/theme.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            }
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Order #ORD-8942', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold)),
            Text('Placed at 12:45:22', style: GoogleFonts.inter(fontSize: 12, color: Colors.grey[600], fontWeight: FontWeight.w600)),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.blueAccent.withOpacity(0.2),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                'NEW ORDER',
                style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.bold, color: Color(0xFF1E4FD8), letterSpacing: 1),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 150), // Space for bottom action bar
            child: Column(
              children: [
                // Table Info Section
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          color: AppTheme.primaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.table_restaurant, color: AppTheme.primaryColor, size: 32),
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Table 04', style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold)),
                          Text('Dining Area - Main Floor', style: GoogleFonts.inter(fontSize: 14, color: Colors.grey[600], fontWeight: FontWeight.w600)),
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(height: 0.6, color: AppTheme.backgroundLight),

                // Order Items Section
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('ORDER ITEMS', style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 1)),
                          Text('3 items', style: GoogleFonts.inter(fontSize: 14, color: Colors.grey[600], fontWeight: FontWeight.w500)),
                        ],
                      ),
                      const SizedBox(height: 16),
                      _buildOrderItem(context, 'Bruschetta', 'Quantity: 2x', '25.000 TND', 'https://lh3.googleusercontent.com/aida-public/AB6AXuBR7KH0_caWfuCIxkhUBxAhLjLVNWm_yBk8taKaqHKurlyLLoqrFAwF0SJkof_oRdHMi29kSnHsO2VhGAk8t6UXtB7Ux1eEe8dH6x0Nu0plab9SXeq4-llt0qU7Nqp2oHk-WrHLjbhqS-tn_ZJOugJJqv99TW7NDzYh4H6P6ozdHe2aJYjU9D0GFA5ZypUcfGh4TSvs0pfbdWBzpvXVzUU5yfKLt-k42CL6vfe8wLCAOhMeAyuOAyickemGmhPzRKlwTA3LQJQhREQ'),
                      _buildOrderItem(context, 'Margherita Pizza', 'Quantity: 1x', '18.500 TND', 'https://lh3.googleusercontent.com/aida-public/AB6AXuCAw2GvnPImjgLZKWftFGbkCSAJ1FQUq4TlbBFdIcJZI02biwcxbGOfXE5-rcE007er-TvT7nDGVDq6LHkKUngZNg7x0Dq99epCTKjweBJVw2kwLE1txTja9LigdZvXaQ3YBvFk_AXmx2SKVq3umyH5vSUoeD6rXp1t2fBt_9SZiLw-_myDp4PEVN_wONu7GoULrJpvWC9xcVJnTNsx6B_yq1mf_exkEQihyknokTNdM0anMpa7Orp0JHjBmsbg_MvSBqbu6ogFMzk'),
                      _buildOrderItem(context, 'Mint Lemonade', 'Quantity: 1x', '7.500 TND', 'https://lh3.googleusercontent.com/aida-public/AB6AXuDIwi2VscDFy7gnHIJaFMP4JEJN2OxMIn77zcC2dYwxDqf7pmeO7AUYwusHe6xnZ3JNf9SF1rAiVTZqEl033kEw1RScoVspWSnEmbmH_-KZeCy9XNJWxdn-Tjs_9diV4CEYBm5yjGSk15Ue6K_gQjbCTG5MOjH9nXOtTFh3TBckGGUWa8sg_cJmqD3fTXD3cIhfeUrN41bZZ5ZjjcAmSBnUhXSbIoGPFOzvNzdZ7TrvfD4PH_aySyUlgC-lIcDewv116GwYSft49_g'),
                    ],
                  ),
                ),

                // Order Summary Section
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.grey.withOpacity(0.1)),
                  ),
                  child: Column(
                    children: [
                      _buildSummaryRow('Subtotal', '51.000 TND'),
                      const SizedBox(height: 12),
                      _buildSummaryRow('Tax (7%)', '3.570 TND'),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.0),
                        child: Divider(height: 0.02, color: Colors.grey),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total', style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold)),
                          Text('54.570 TND', style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.w800, color: AppTheme.primaryColor)),
                        ],
                      ),
                    ],
                  ),
                ),

                // Order Timeline
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('ORDER TIMELINE', style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold, letterSpacing: 1)),
                      const SizedBox(height: 16),
                      _buildTimelineItem(Icons.check, 'Order Received', '12:45:22', true, AppTheme.primaryColor),
                      _buildTimelineItem(Icons.restaurant, 'Preparing in Kitchen', '12:48:00', true, AppTheme.primaryColor.withOpacity(0.5)),
                      _buildTimelineItem(Icons.delivery_dining, 'Ready for Serving', 'Pending', false, Colors.grey),
                      _buildTimelineItem(Icons.payments, 'Paid', 'Pending', false, Colors.grey, isLast: true),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Bottom Action Bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(color: Colors.grey.withOpacity(0.2))),
                boxShadow: [
                  BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -5)),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.play_arrow),
                    label: Text('Next Step'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primaryColor,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 56),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 4,
                      textStyle: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.undo, size: 20),
                          label: Text('Previous Step', style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.bold, color: AppTheme.thirdColorLight)),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.grey[800],
                            minimumSize: const Size(double.infinity, 48),
                            side: BorderSide(color: Colors.grey.withOpacity(0.3)),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.cancel, size: 20),
                          label: Text('Cancel Order', style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.bold)),
                          style: TextButton.styleFrom(
                            foregroundColor: Colors.red,
                            minimumSize: const Size(double.infinity, 48),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOrderItem(BuildContext context, String title, String quantity, String price, String imageUrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              imageUrl,
              width: 64,
              height: 64,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.withOpacity(0.2)),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(quantity, style: GoogleFonts.inter(fontSize: 14, color: Colors.grey[600], fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(price, style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: GoogleFonts.inter(fontSize: 14, color: AppTheme.secondColorLight, fontWeight: FontWeight.w600)),
        Text(value, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildTimelineItem(IconData icon, String title, String time, bool isCompleted, Color iconColor, {bool isLast = false}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: isCompleted ? iconColor : Colors.grey.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 14, color: isCompleted ? Colors.white : Colors.grey),
            ),
            if (!isLast)
              Container(
                width: 2,
                height: 40,
                color: Colors.grey.withOpacity(0.2),
              ),
          ],
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold, color: isCompleted ? null : Colors.grey)),
            Text(time, style: GoogleFonts.inter(fontSize: 12, color: isCompleted ? Colors.grey[600] : Colors.grey, fontWeight: isCompleted ? FontWeight.w600 : FontWeight.normal)),
          ],
        ),
      ],
    );
  }
}
