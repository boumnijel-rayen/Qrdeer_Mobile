// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Qrdeer';

  @override
  String get welcomeTo => 'Welcome to ';

  @override
  String get brandName => 'r';

  @override
  String get manageKitchenDesc =>
      'Manage your kitchen operations and staff with ease.';

  @override
  String get emailAddress => 'Email Address';

  @override
  String get emailHint => 'admin@qrdeer.com';

  @override
  String get password => 'Password';

  @override
  String get forgotPassword => 'Forgot Password?';

  @override
  String get loginToDashboard => 'Login to Dashboard';

  @override
  String get orLoginWith => 'OR LOGIN WITH';

  @override
  String get staffBioId => 'Staff Bio-ID';

  @override
  String get newStaffMember => 'New staff member? ';

  @override
  String get contactTeam => 'Contact Team';

  @override
  String get settings => 'Settings';

  @override
  String get adminAccess => 'ADMIN ACCESS';

  @override
  String get editProfileDetails => 'Edit Profile Details';

  @override
  String get restaurantDetailsTitle => 'RESTAURANT DETAILS';

  @override
  String get restaurantName => 'Restaurant Name';

  @override
  String get address => 'Address';

  @override
  String get subscriptionTitle => 'SUBSCRIPTION';

  @override
  String get currentPlan => 'CURRENT PLAN';

  @override
  String get activeStatus => 'Active';

  @override
  String nextBillingCycle(String date) {
    return 'Next billing cycle: $date';
  }

  @override
  String get generalSettingsTitle => 'GENERAL SETTINGS';

  @override
  String get menuManagement => 'Menu Management';

  @override
  String get menuManagementDesc => 'Update items, prices, and categories';

  @override
  String get staffAccess => 'Staff Access';

  @override
  String get staffAccessDesc => 'Manage roles and permissions';

  @override
  String get billingInvoices => 'Billing & Invoices';

  @override
  String get billingInvoicesDesc => 'View history and payment methods';

  @override
  String get claimingSupport => 'Claiming / Support';

  @override
  String get claimingSupportDesc => 'Get help with your restaurant profile';

  @override
  String get logout => 'Logout';

  @override
  String appVersion(String version) {
    return 'APP VERSION $version';
  }

  @override
  String get dashboard => 'Dashboard';

  @override
  String get weeklyRevenue => 'Weekly Revenue';

  @override
  String get last7Days => 'Last 7 Days vs Previous Period';

  @override
  String get mon => 'MON';

  @override
  String get tue => 'TUE';

  @override
  String get wed => 'WED';

  @override
  String get thu => 'THU';

  @override
  String get fri => 'FRI';

  @override
  String get sat => 'SAT';

  @override
  String get sun => 'SUN';

  @override
  String get peakHourStats => 'Peak Hour Statistics';

  @override
  String get live => 'LIVE';

  @override
  String get busiestHour => 'BUSIEST HOUR';

  @override
  String get kitchenLoad => 'KITCHEN LOAD';

  @override
  String get dailyRevenue => 'Daily Revenue';

  @override
  String get totalOrders => 'Total Orders';

  @override
  String get activeTables => 'Active Tables';

  @override
  String get liveStatus => 'Live Status';

  @override
  String get refresh => 'Refresh';

  @override
  String get currentActiveOrders => 'Current Active Orders';

  @override
  String ordersInPrep(String count) {
    return '$count orders are currently in preparation.';
  }

  @override
  String get preparing => 'Preparing';

  @override
  String get ready => 'Ready';

  @override
  String get viewKitchenDisplay => 'View Kitchen Display';

  @override
  String get efficiency => 'Efficiency';

  @override
  String get recentActivity => 'Recent Activity';

  @override
  String get tableAction => 'Table Action';

  @override
  String get recentNotifications => 'Recent Notifications';

  @override
  String get viewAllActivity => 'View All Activity';

  @override
  String get navHome => 'Home';

  @override
  String get navOrders => 'Orders';

  @override
  String get navTables => 'Tables';

  @override
  String get navSales => 'Sales';

  @override
  String get navAccount => 'Account';

  @override
  String get menuManagementTitle => 'Menu Management';

  @override
  String get newItem => 'New Item';

  @override
  String get tabCategories => 'Categories';

  @override
  String get tabAllItems => 'All Items';

  @override
  String get tabAvailability => 'Availability';

  @override
  String get tabMenuSettings => 'Menu Settings';

  @override
  String get categoryAppetizers => 'Appetizers';

  @override
  String get itemBruschetta => 'Bruschetta Classica';

  @override
  String get descBruschetta =>
      'Toasted rustic bread, vine-ripened tomatoes, garlic, basil';

  @override
  String get price12_5 => '12.500 TND';

  @override
  String get itemCalamari => 'Crispy Calamari';

  @override
  String get descCalamari =>
      'Golden fried squid rings with spicy marinara sauce';

  @override
  String get price18 => '18.000 TND';

  @override
  String get categoryMainCourse => 'Main Course';

  @override
  String get itemSalmon => 'Grilled Atlantic Salmon';

  @override
  String get descSalmon =>
      'With seasonal grilled vegetables and lemon butter sauce';

  @override
  String get price42 => '42.000 TND';

  @override
  String get itemSteak => 'Beef Tenderloin Steak';

  @override
  String get descSteak => '250g Prime beef, roasted potatoes, peppercorn sauce';

  @override
  String get price55 => '55.000 TND';

  @override
  String get categoryDrinks => 'Drinks';

  @override
  String get itemOrangeJuice => 'Fresh Orange Juice';

  @override
  String get descOrangeJuice => '100% freshly squeezed local oranges';

  @override
  String get priceFrom8_5 => 'From 8.500 TND';

  @override
  String itemCount(String count) {
    return '$count Items';
  }

  @override
  String get editCategory => 'Edit Category';

  @override
  String get addNew => 'Add New';

  @override
  String get item => 'Item';

  @override
  String get category => 'Category';

  @override
  String get categoryName => 'Category Name';

  @override
  String get eGMenu => 'e.g. Beverages, Main Courses';

  @override
  String get categoryVisibleHint =>
      'This category will be visible in your digital menu and POS system.';

  @override
  String get saveChanges => 'Save Changes';

  @override
  String get preview => 'Preview';

  @override
  String get deleteCategory => 'Delete Category';

  @override
  String get assignedItems => 'Assigned Items';

  @override
  String get itemGarlicBread => 'Garlic Bread with Herbs';

  @override
  String get price8_5 => '8.50 TND';

  @override
  String get itemCalamariRings => 'Crispy Calamari Rings';

  @override
  String get price14 => '14.00 TND';

  @override
  String get itemTomatoBruschetta => 'Tomato Bruschetta';

  @override
  String get price10 => '10.00 TND';

  @override
  String get itemCaesarSalad => 'Caesar Salad';

  @override
  String get price12 => '12.00 TND';

  @override
  String get itemBuffaloWings => 'Buffalo Wings (6pcs)';

  @override
  String get price11_5 => '11.50 TND';

  @override
  String get uploadDishImage => 'Upload Dish Image';

  @override
  String get jpgOrPng => 'JPG or PNG, max 5MB';

  @override
  String get selectImage => 'Select Image';

  @override
  String get itemName => 'Item Name';

  @override
  String get eGGrilledSeaBass => 'e.g. Grilled Sea Bass';

  @override
  String get selectCategory => 'Select Category';

  @override
  String get categoryDesserts => 'Desserts';

  @override
  String get hasMultipleSizes => 'Has multiple sizes?';

  @override
  String get priceTnd => 'Price (TND)';

  @override
  String get available => 'Available';

  @override
  String get sizes => 'Sizes';

  @override
  String get addSize => 'Add Size';

  @override
  String get sizeEgSmall => 'Size (e.g. Small)';

  @override
  String get price => 'Price';

  @override
  String get description => 'Description';

  @override
  String get describeIngredients =>
      'Describe the ingredients and preparation...';

  @override
  String get eGBreakfast => 'e.g. Breakfast Specialties';

  @override
  String get assignExistingItems => 'Assign Existing Items';

  @override
  String get itemGrilledChicken => 'Grilled Chicken';

  @override
  String get itemClassicBurger => 'Classic Burger';

  @override
  String get displayOrder => 'Display Order';

  @override
  String get eG1 => 'e.g. 1';

  @override
  String get ordersManagement => 'Orders Management';

  @override
  String get searchOrders => 'Search by order ID, table...';

  @override
  String get filterAll => 'All';

  @override
  String get filterNewOrder => 'New Order';

  @override
  String get filterPreparing => 'Preparing';

  @override
  String get filterReady => 'Ready';

  @override
  String get filterCancelled => 'Cancelled';

  @override
  String get filterPaid => 'Paid';

  @override
  String get filterCompleted => 'Completed';

  @override
  String ordersCount(String count) {
    return 'ORDERS ($count)';
  }

  @override
  String orderedAt(String time) {
    return 'Ordered $time';
  }

  @override
  String get tableUpper => 'TABLE';

  @override
  String get itemsUpper => 'ITEMS';

  @override
  String get totalUpper => 'TOTAL';

  @override
  String orderId(String id) {
    return 'Order $id';
  }

  @override
  String placedAt(String time) {
    return 'Placed at $time';
  }

  @override
  String get newOrderUpper => 'NEW ORDER';

  @override
  String get diningAreaMain => 'Dining Area - Main Floor';

  @override
  String get orderItemsUpper => 'ORDER ITEMS';

  @override
  String get orderTimelineUpper => 'ORDER TIMELINE';

  @override
  String get orderReceived => 'Order Received';

  @override
  String get preparingInKitchen => 'Preparing in Kitchen';

  @override
  String get readyForServing => 'Ready for Serving';

  @override
  String get pendingOrder => 'Pending';

  @override
  String get nextStep => 'Next Step';

  @override
  String get previousStep => 'Previous Step';

  @override
  String get cancelOrder => 'Cancel Order';

  @override
  String quantityX(String qty) {
    return 'Quantity: ${qty}x';
  }

  @override
  String get subtotal => 'Subtotal';

  @override
  String get tax7 => 'Tax (7%)';

  @override
  String get tax10 => 'Tax (10%)';

  @override
  String get total => 'Total';

  @override
  String get totalAmount => 'Total Amount';

  @override
  String get ordersHistory => 'Orders History';

  @override
  String get totalSalesToday => 'TOTAL SALES TODAY';

  @override
  String get vsYest => '+8% vs yest.';

  @override
  String get avgOrderValue => 'AVG ORDER VALUE';

  @override
  String get stable => 'Stable';

  @override
  String get filterToday => 'Today';

  @override
  String get filterYesterday => 'Yesterday';

  @override
  String get filterLast7Days => 'Last 7 Days';

  @override
  String get filters => 'Filters';

  @override
  String get recentOrdersUpper => 'RECENT ORDERS';

  @override
  String ordersFound(String count) {
    return '$count orders found';
  }

  @override
  String orderDetailsId(String id) {
    return 'Order Details $id';
  }

  @override
  String get completedAndPaid => 'COMPLETED & PAID';

  @override
  String get orderInformationUpper => 'ORDER INFORMATION';

  @override
  String get tableNumber => 'Table Number';

  @override
  String get dateTime => 'Date & Time';

  @override
  String get itemsOrdered => 'Items Ordered';

  @override
  String qtyXPrice(String qty, String price) {
    return 'Qty: $qty x $price';
  }

  @override
  String get tablesManagement => 'Tables Management';

  @override
  String get addTable => 'Add Table';

  @override
  String get allTables => 'All Tables';

  @override
  String get disabled => 'Disabled';

  @override
  String get viewQrCode => 'View QR Code';

  @override
  String seatsCount(String count) {
    return '$count Seats';
  }

  @override
  String tableId(String id) {
    return 'Table $id';
  }

  @override
  String get whenDisabledDesc =>
      'When disabled, customers cannot scan to order.';

  @override
  String get presentCodeDesc =>
      'Present this code to customers for instant ordering and contactless payment.';

  @override
  String get downloadQrCode => 'Download QR Code';

  @override
  String get verifyEmail => 'Verify Email';

  @override
  String get enter6DigitCode => 'Enter 6-digit code';

  @override
  String get codeSentTo => 'We\'ve sent a verification code to\n';

  @override
  String get verifyCode => 'Verify Code';

  @override
  String get didntReceiveCode => 'Didn\'t receive the code?';

  @override
  String get resendCode => 'Resend Code';

  @override
  String get changePasswordTitle => 'Change Password';

  @override
  String get updateSecurity => 'Update Security';

  @override
  String get changePasswordDesc =>
      'Please enter your current password to verify your identity, then choose a new strong password.';

  @override
  String get currentPassword => 'Current Password';

  @override
  String get newPassword => 'New Password';

  @override
  String get atLeast8Chars => 'At least 8 characters';

  @override
  String get includeNumbersSymbols =>
      'Include numbers and symbols for better security.';

  @override
  String get confirmNewPassword => 'Confirm New Password';

  @override
  String get repeatNewPassword => 'Repeat new password';

  @override
  String get savePassword => 'Save Password';

  @override
  String get forgotYourPassword => 'Forgot your password? ';

  @override
  String get resetItViaEmail => 'Reset it via email';

  @override
  String get addStaffMember => 'Add Staff Member';

  @override
  String get fullName => 'Full Name';

  @override
  String get egFullName => 'e.g. Ahmed Ben Ali';

  @override
  String get role => 'Role';

  @override
  String get seniorWaiter => 'Senior Waiter';

  @override
  String get waiter => 'Waiter';

  @override
  String get egEmail => 'name@restaurant.tn';

  @override
  String get phoneNumber => 'Phone Number';

  @override
  String get egPhone => '00 000 000';

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get cancel => 'Cancel';

  @override
  String get editProfileTitle => 'Edit Profile';

  @override
  String get adminAccount => 'Admin Account';

  @override
  String get updateProfileSettings => 'Update your profile settings';

  @override
  String get restaurantRole => 'Restaurant Role';

  @override
  String get security => 'Security';

  @override
  String get lastUpdated3MonthsAgo => 'Last updated 3 months ago';

  @override
  String get billingInvoicesTitle => 'Billing & Invoices';

  @override
  String get invoiceHistory => 'Invoice History';

  @override
  String get paid => 'PAID';

  @override
  String get pending => 'PENDING';

  @override
  String get contactSupportTitle => 'Contact Support';

  @override
  String get haveAQuestion => 'Have a question?';

  @override
  String get contactDesc =>
      'Send us a message and our team will get back to you as soon as possible.';

  @override
  String get subject => 'Subject';

  @override
  String get subjectHint => 'What is this regarding?';

  @override
  String get message => 'Message';

  @override
  String get messageHint => 'Explain your issue or question in detail...';

  @override
  String get sendMessage => 'Send Message';

  @override
  String get expectedResponseTime => 'Expected response time: ';

  @override
  String get within24Hours => 'within 24 hours';

  @override
  String get editRestaurantName => 'Edit Restaurant Name';

  @override
  String get editRestaurantNameDesc =>
      'Update your public-facing business identity. This name will appear on receipts and the customer app.';

  @override
  String get egRestaurantName => 'e.g. The Golden Fork';

  @override
  String get needHelp => 'Need help?';

  @override
  String get changingNameHelp =>
      'Changing your name frequently might affect your search rankings in delivery apps.';

  @override
  String get addStaff => 'Add Staff';

  @override
  String get roleManager => 'Manager';

  @override
  String activeMembersCount(String count) {
    return '$count Active members';
  }

  @override
  String get activeCaps => 'ACTIVE';

  @override
  String get inactiveCaps => 'INACTIVE';
}
