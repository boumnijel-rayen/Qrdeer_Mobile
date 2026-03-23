import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

import 'package:qrdeer_app/screens/auth/splash_screen.dart';
import 'package:qrdeer_app/screens/auth/login_screen.dart';
import 'package:qrdeer_app/screens/auth/email_verification_screen.dart';
import 'package:qrdeer_app/screens/auth/change_password_screen.dart';
import 'package:qrdeer_app/screens/dashboard/home_screen.dart';
import 'package:qrdeer_app/screens/menu/menu_management_screen.dart';
import 'package:qrdeer_app/screens/menu/add_category_screen.dart';
import 'package:qrdeer_app/screens/menu/edit_category_screen.dart';
import 'package:qrdeer_app/screens/menu/add_item_screen.dart';
import 'package:qrdeer_app/screens/orders/orders_screen.dart';
import 'package:qrdeer_app/screens/orders/order_details_screen.dart';
import 'package:qrdeer_app/screens/orders/order_history_screen.dart';
import 'package:qrdeer_app/screens/orders/order_details_history_screen.dart';
import 'package:qrdeer_app/screens/tables/tables_screen.dart';
import 'package:qrdeer_app/screens/tables/view_qr_code_screen.dart';
import 'package:qrdeer_app/screens/account/account_screen.dart';
import 'package:qrdeer_app/screens/account/edit_profile_screen.dart';
import 'package:qrdeer_app/screens/account/edit_restaurant_screen.dart';
import 'package:qrdeer_app/screens/account/staff_access_screen.dart';
import 'package:qrdeer_app/screens/account/add_staff_screen.dart';
import 'package:qrdeer_app/screens/account/billing_invoices_screen.dart';
import 'package:qrdeer_app/screens/account/contact_screen.dart';
import 'package:qrdeer_app/widgets/main_layout.dart';

// Placeholder screens - we will create these in the screens folder next
class PlaceholderScreen extends StatelessWidget {
  final String title;
  const PlaceholderScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text(title)),
    );
  }
}

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/splash',
  routes: [
    // 2. Authentication & Onboarding
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/email-verification',
      builder: (context, state) => const EmailVerificationScreen(),
    ),
    GoRoute(
      path: '/change-password',
      builder: (context, state) => const ChangePasswordScreen(),
    ),

    // Shell Route for Main Navigation
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return MainLayout(child: child);
      },
      routes: [
        // 3. Core Dashboard
        GoRoute(
          path: '/home',
          pageBuilder: (context, state) => const NoTransitionPage(child: HomeScreen()),
        ),

        // 4. Menu Management
        GoRoute(
          path: '/menu',
          pageBuilder: (context, state) => const NoTransitionPage(child: MenuManagementScreen()),
          routes: [
            GoRoute(
              path: 'add-category',
              parentNavigatorKey: _rootNavigatorKey,
              builder: (context, state) => const AddCategoryScreen(),
            ),
            GoRoute(
              path: 'edit-category',
              parentNavigatorKey: _rootNavigatorKey,
              builder: (context, state) => const EditCategoryScreen(),
            ),
            GoRoute(
              path: 'add-item',
              parentNavigatorKey: _rootNavigatorKey,
              builder: (context, state) => const AddItemScreen(),
            ),
            GoRoute(
              path: 'add-item-sizes',
              parentNavigatorKey: _rootNavigatorKey,
              builder: (context, state) => const AddItemScreen(),
            ),
          ],
        ),

        // 5. Orders Management
        GoRoute(
          path: '/orders',
          pageBuilder: (context, state) => const NoTransitionPage(child: OrdersScreen()),
          routes: [
            GoRoute(
              path: 'details',
              builder: (context, state) => const OrderDetailsScreen(),
            ),
            GoRoute(
              path: 'history',
              parentNavigatorKey: _rootNavigatorKey,
              builder: (context, state) => const OrderHistoryScreen(),
            ),
            GoRoute(
              path: 'history/details',
              parentNavigatorKey: _rootNavigatorKey,
              builder: (context, state) => const OrderDetailsHistoryScreen(),
            ),
          ],
        ),

        // 6. Table & QR Management
        GoRoute(
          path: '/tables',
          pageBuilder: (context, state) => const NoTransitionPage(child: TablesScreen()),
          routes: [
            GoRoute(
              path: 'view-qr',
              parentNavigatorKey: _rootNavigatorKey,
              builder: (context, state) => const ViewQrCodeScreen(),
            ),
          ],
        ),

        // Sales (In Bottom Nav)
        GoRoute(
          path: '/sales',
          pageBuilder: (context, state) => const NoTransitionPage(child: OrderHistoryScreen()),
        ),

        // 7. Settings & Staff (Account)
        GoRoute(
          path: '/account',
          pageBuilder: (context, state) => const NoTransitionPage(child: AccountScreen()),
          routes: [
            GoRoute(
              path: 'edit-profile',
              parentNavigatorKey: _rootNavigatorKey,
              builder: (context, state) => const EditProfileScreen(),
            ),
            GoRoute(
              path: 'edit-restaurant',
              parentNavigatorKey: _rootNavigatorKey,
              builder: (context, state) => const EditRestaurantScreen(),
            ),
            GoRoute(
              path: 'staff',
              parentNavigatorKey: _rootNavigatorKey,
              builder: (context, state) => const StaffAccessScreen(),
              routes: [
                GoRoute(
                  path: 'add',
                  parentNavigatorKey: _rootNavigatorKey,
                  builder: (context, state) => const AddStaffScreen(),
                ),
              ],
            ),
            GoRoute(
              path: 'billing',
              parentNavigatorKey: _rootNavigatorKey,
              builder: (context, state) => const BillingInvoicesScreen(),
            ),
            GoRoute(
              path: 'contact',
              parentNavigatorKey: _rootNavigatorKey,
              builder: (context, state) => const ContactScreen(),
            ),
          ],
        ),
      ],
    ),
  ],
);

