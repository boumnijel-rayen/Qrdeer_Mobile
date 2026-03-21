import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qrdeer_app/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                  Text('Dashboard', style: GoogleFonts.inter(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black)),
                  Text('Main Street Bistro', style: GoogleFonts.inter(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w700)),
                ],
              ),
            ],
          ),
        ),
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.notifications, color: AppTheme.secondColorLight),
                onPressed: () {
                  _showNotificationPopup(context);
                },
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                    border: Border.all(color: Theme.of(context).scaffoldBackgroundColor, width: 2),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildWeeklyChart(context),
              const SizedBox(height: 24),
              _buildPeakHourStats(context),
              const SizedBox(height: 24),
              _buildStatsGrid(context),
              const SizedBox(height: 24),
              _buildLiveStatus(context),
              const SizedBox(height: 24),
              _buildRecentActivity(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWeeklyChart(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.primaryColor.withOpacity(0.05)),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 4, offset: const Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Weekly Revenue', style: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.grey[600])),
                    const SizedBox(height: 4),
                    Text('12,450 TND', style: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w800)),
                    const SizedBox(height: 4),
                    Text('Last 7 Days vs Previous Period', style: GoogleFonts.inter(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
              Row(
                children: [
                  _buildPeriodChip('7D', true),
                  const SizedBox(width: 4),
                  _buildPeriodChip('1M', false),
                  const SizedBox(width: 4),
                  _buildPeriodChip('1Y', false),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Chart placeholder
          SizedBox(
            height: 150,
            width: double.infinity,
            child: CustomPaint(
              painter: _CurveChartPainter(
                data: [35, 28, 45, 40, 65, 50, 75],
                color: AppTheme.primaryColor,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN']
                .map((d) => Text(d, style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.grey[600])))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildPeriodChip(String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isSelected ? AppTheme.primaryColor : Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        label,
        style: GoogleFonts.inter(
          fontSize: 10,
          fontWeight: FontWeight.w800,
          color: isSelected ? Colors.white : Colors.grey,
        ),
      ),
    );
  }

  Widget _buildPeakHourStats(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.primaryColor.withOpacity(0.05)),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 4, offset: const Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Peak Hour Statistics', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2.5),
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text('LIVE', style: GoogleFonts.inter(fontSize: 10, fontWeight: FontWeight.w800, color: AppTheme.primaryColor)),
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Bar chart
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildBarGroup('12:00', 48, false, context),
              _buildBarGroup('13:00', 64, false, context),
              _buildBarGroup('14:00', 96, true, context),
              _buildBarGroup('15:00', 80, false, context),
              _buildBarGroup('16:00', 40, false, context),
              _buildBarGroup('17:00', 56, false, context),
              _buildBarGroup('18:00', 88, false, context),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.withOpacity(0.1)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.03),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('BUSIEST HOUR', style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey[600])),
                      const SizedBox(height: 4),
                      Text('14:00 - 15:00', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w800)),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.withOpacity(0.1)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.03),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('KITCHEN LOAD', style: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.grey[600])),
                      const SizedBox(height: 4),
                      Text('82% High', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w800, color: AppTheme.primaryColor)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBarGroup(String time, double height, bool isPrimary, BuildContext context) {
    return Column(
      children: [
        Container(
          width: 32,
          height: height,
          decoration: BoxDecoration(
            color: isPrimary ? AppTheme.primaryColor : AppTheme.primaryColor.withOpacity(0.2),
            borderRadius: const BorderRadius.vertical(top: Radius.circular(2)),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          time,
          style: GoogleFonts.inter(
            fontSize: 10,
            fontWeight: FontWeight.bold,
            color: isPrimary ? AppTheme.primaryColor : Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildStatsGrid(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            _buildStatCard(context, 'Daily Revenue', '+12.5%', '1,240.50 TND', 0.7, constraints.maxWidth),
            _buildStatCard(context, 'Total Orders', '+5.2%', '48', 0.45, constraints.maxWidth),
            _buildStatCard(context, 'Active Tables', 'LIVE', '12/20', 0.6, constraints.maxWidth, isLive: true),
          ],
        );
      },
    );
  }

  Widget _buildStatCard(BuildContext context, String title, String badge, String value, double progress, double maxWidth, {bool isLive = false}) {
    // Determine card width based on screen size: if it's wide enough for 3 then use 1/3, else 1/2 or full
    double cardWidth = maxWidth > 600 ? (maxWidth - 24) / 3 : maxWidth; // Simplification for mobile view

    return Container(
      width: cardWidth,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.primaryColor.withOpacity(0.05)),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 4, offset: const Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey[600])),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2.5),
                decoration: BoxDecoration(
                  color: isLive ? AppTheme.primaryColor.withOpacity(0.1) : Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  badge,
                  style: GoogleFonts.inter(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: isLive ? AppTheme.primaryColor : Colors.green,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(value, style: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.w700, letterSpacing: -0.5)),
          const SizedBox(height: 16),
          Container(
            height: 4,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(2),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: progress,
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.primaryColor,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLiveStatus(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Live Status', style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold)),
            TextButton(
              onPressed: () {},
              child: Text('Refresh', style: GoogleFonts.inter(color: AppTheme.primaryColor, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppTheme.primaryColor.withOpacity(0.05)),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 4, offset: const Offset(0, 2)),
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Current Active Orders', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    Text('8 orders are currently in preparation.', style: GoogleFonts.inter(fontSize: 14, color: Colors.grey[600], fontWeight: FontWeight.w500)),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        _buildStatusIndicator(Colors.orange, '5 Preparing'),
                        const SizedBox(width: 24),
                        _buildStatusIndicator(Colors.green, '3 Ready'),
                      ],
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Text('View Kitchen Display', style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: Colors.white)),
                      label: const Icon(Icons.arrow_forward, size: 18),
                      // Quick flip for row direction icon at end
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.primaryColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppTheme.lightTheme.cardColor,
                  borderRadius: const BorderRadius.vertical(bottom: Radius.circular(12)),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 128,
                      width: 128,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CustomPaint(
                            size: const Size(128, 128),
                            painter: _DonutChartPainter(value: 0.75),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('75%', style: GoogleFonts.inter(fontSize: 24, fontWeight: FontWeight.bold)),
                              Text('Efficiency', style: GoogleFonts.inter(fontSize: 10, color: Colors.grey[600], fontWeight: FontWeight.w600)),
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
        ),
      ],
    );
  }

  Widget _buildStatusIndicator(Color color, String text) {
    return Row(
      children: [
        Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(width: 8),
        Text(text, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600)),
      ],
    );
  }

  Widget _buildRecentActivity(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Recent Activity', style: GoogleFonts.inter(fontSize: 18, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppTheme.primaryColor.withOpacity(0.05)),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 4, offset: const Offset(0, 2)),
            ],
          ),
          child: Column(
            children: [
              _buildActivityItem(
                context,
                icon: Icons.qr_code_2,
                iconColor: AppTheme.primaryColor,
                title: 'Table 4 scanned',
                time: '2 minutes ago',
                trailingWidget: _buildActivityBadge('Active', AppTheme.thirdColorLight),
              ),
              Divider(height: 1, color: Colors.grey.withOpacity(0.2)),
              _buildActivityItem(
                context,
                icon: Icons.payments,
                iconColor: Colors.green,
                title: 'Payment received - Table 12',
                time: '15 minutes ago',
                trailingWidget: Text('64.20 TND', style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: AppTheme.primaryColor)),
              ),
              Divider(height: 1, color: Colors.grey.withOpacity(0.2)),
              _buildActivityItem(
                context,
                icon: Icons.shopping_cart,
                iconColor: Colors.orange,
                title: 'New order - Table 7',
                time: '22 minutes ago',
                trailingWidget: _buildActivityBadge('Pending', AppTheme.thirdColorLight),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActivityItem(BuildContext context, {required IconData icon, required Color iconColor, required String title, required String time, required Widget trailingWidget}) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: iconColor),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold)),
                  Text(time, style: GoogleFonts.inter(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.w600)),
                ],
              ),
            ],
          ),
          trailingWidget,
        ],
      ),
    );
  }

  Widget _buildActivityBadge(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        text,
        style: GoogleFonts.inter(
          fontSize: 12,
          fontWeight: FontWeight.w800,
          color: color,
        ),
      ),
    );
  }

  void _showNotificationPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.notifications_active, color: AppTheme.primaryColor),
                          const SizedBox(width: 8),
                          Text('Recent Notifications', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold)),
                        ],
                      ),
                      IconButton(
                        icon: const Icon(Icons.close, color: Colors.grey),
                        onPressed: () => Navigator.of(context).pop(),
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                      ),
                    ],
                  ),
                ),
                Divider(height: 1, color: Colors.grey.withOpacity(0.1)),
                _buildActivityItem(
                  context,
                  icon: Icons.qr_code_2,
                  iconColor: AppTheme.primaryColor,
                  title: 'Table 4 scanned',
                  time: '2 minutes ago',
                  trailingWidget: _buildActivityBadge('Active', Colors.grey),
                ),
                Divider(height: 1, color: Colors.grey.withOpacity(0.1)),
                _buildActivityItem(
                  context,
                  icon: Icons.payments,
                  iconColor: Colors.green,
                  title: 'Payment received - Table 12',
                  time: '15 minutes ago',
                  trailingWidget: Text('64.20 TND', style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: AppTheme.primaryColor)),
                ),
                Divider(height: 1, color: Colors.grey.withOpacity(0.1)),
                _buildActivityItem(
                  context,
                  icon: Icons.shopping_cart,
                  iconColor: Colors.orange,
                  title: 'New order - Table 7',
                  time: '22 minutes ago',
                  trailingWidget: _buildActivityBadge('Pending', Colors.grey),
                ),
                Divider(height: 1, color: Colors.grey.withOpacity(0.1)),
                TextButton(
                  onPressed: () {},
                  child: Text('View All Activity', style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: AppTheme.primaryColor)),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _DonutChartPainter extends CustomPainter {
  final double value; // 0.0 to 1.0

  _DonutChartPainter({required this.value});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width / 2) - 10;
    const strokeWidth = 14.0;
    const startAngle = -1.5708; // -90 degrees (top)

    // Background track
    final trackPaint = Paint()
      ..color = const Color(0xFFE2E8F0) // slate-200
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, trackPaint);

    // Foreground arc
    final arcPaint = Paint()
      ..color = const Color(0xFF9B2330) // primary
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      2 * 3.14159265 * value,
      false,
      arcPaint,
    );
  }

  @override
  bool shouldRepaint(_DonutChartPainter oldDelegate) => oldDelegate.value != value;
}

class _CurveChartPainter extends CustomPainter {
  final List<double> data;
  final Color color;

  _CurveChartPainter({required this.data, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    if (data.isEmpty) return;

    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    final path = Path();
    final double stepX = size.width / (data.length - 1);
    final double maxY = data.reduce((a, b) => a > b ? a : b);
    final double minY = data.reduce((a, b) => a < b ? a : b);
    final double rangeY = (maxY - minY == 0) ? 1 : (maxY - minY);

    double getY(double value) {
      // Scale data to fit 80% of height, with 10% padding on top and bottom
      return size.height - ((value - minY) / rangeY * size.height * 0.8 + size.height * 0.1);
    }

    path.moveTo(0, getY(data[0]));

    for (int i = 0; i < data.length - 1; i++) {
      final x1 = i * stepX;
      final y1 = getY(data[i]);
      final x2 = (i + 1) * stepX;
      final y2 = getY(data[i + 1]);

      // Cubic Bezier curve for smoothness
      final cx1 = x1 + (x2 - x1) / 2;
      final cy1 = y1;
      final cx2 = x1 + (x2 - x1) / 2;
      final cy2 = y2;

      path.cubicTo(cx1, cy1, cx2, cy2, x2, y2);
    }

    // Draw the gradient fill
    final fillPath = Path.from(path);
    fillPath.lineTo(size.width, size.height);
    fillPath.lineTo(0, size.height);
    fillPath.close();

    final fillPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          color.withOpacity(0.2),
          color.withOpacity(0.0),
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawPath(fillPath, fillPaint);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
