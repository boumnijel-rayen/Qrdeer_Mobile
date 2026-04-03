import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('fr'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In fr, this message translates to:
  /// **'Qrdeer'**
  String get appTitle;

  /// No description provided for @welcomeTo.
  ///
  /// In fr, this message translates to:
  /// **'Bienvenue sur '**
  String get welcomeTo;

  /// No description provided for @brandName.
  ///
  /// In fr, this message translates to:
  /// **'r'**
  String get brandName;

  /// No description provided for @manageKitchenDesc.
  ///
  /// In fr, this message translates to:
  /// **'Gérez facilement vos opérations en cuisine et votre personnel.'**
  String get manageKitchenDesc;

  /// No description provided for @emailAddress.
  ///
  /// In fr, this message translates to:
  /// **'Adresse e-mail'**
  String get emailAddress;

  /// No description provided for @emailHint.
  ///
  /// In fr, this message translates to:
  /// **'admin@qrdeer.com'**
  String get emailHint;

  /// No description provided for @password.
  ///
  /// In fr, this message translates to:
  /// **'Mot de passe'**
  String get password;

  /// No description provided for @forgotPassword.
  ///
  /// In fr, this message translates to:
  /// **'Mot de passe oublié ?'**
  String get forgotPassword;

  /// No description provided for @loginToDashboard.
  ///
  /// In fr, this message translates to:
  /// **'Connexion au tableau de bord'**
  String get loginToDashboard;

  /// No description provided for @orLoginWith.
  ///
  /// In fr, this message translates to:
  /// **'OU CONNECTEZ-VOUS AVEC'**
  String get orLoginWith;

  /// No description provided for @staffBioId.
  ///
  /// In fr, this message translates to:
  /// **'Bio-ID personnel'**
  String get staffBioId;

  /// No description provided for @newStaffMember.
  ///
  /// In fr, this message translates to:
  /// **'Nouveau membre ? '**
  String get newStaffMember;

  /// No description provided for @contactTeam.
  ///
  /// In fr, this message translates to:
  /// **'Contacter l\'équipe'**
  String get contactTeam;

  /// No description provided for @settings.
  ///
  /// In fr, this message translates to:
  /// **'Paramètres'**
  String get settings;

  /// No description provided for @adminAccess.
  ///
  /// In fr, this message translates to:
  /// **'ACCÈS ADMIN'**
  String get adminAccess;

  /// No description provided for @editProfileDetails.
  ///
  /// In fr, this message translates to:
  /// **'Modifier le profil'**
  String get editProfileDetails;

  /// No description provided for @restaurantDetailsTitle.
  ///
  /// In fr, this message translates to:
  /// **'DÉTAILS DU RESTAURANT'**
  String get restaurantDetailsTitle;

  /// No description provided for @restaurantName.
  ///
  /// In fr, this message translates to:
  /// **'Nom du restaurant'**
  String get restaurantName;

  /// No description provided for @address.
  ///
  /// In fr, this message translates to:
  /// **'Adresse'**
  String get address;

  /// No description provided for @subscriptionTitle.
  ///
  /// In fr, this message translates to:
  /// **'ABONNEMENT'**
  String get subscriptionTitle;

  /// No description provided for @currentPlan.
  ///
  /// In fr, this message translates to:
  /// **'FORFAIT ACTUEL'**
  String get currentPlan;

  /// No description provided for @activeStatus.
  ///
  /// In fr, this message translates to:
  /// **'Actif'**
  String get activeStatus;

  /// No description provided for @nextBillingCycle.
  ///
  /// In fr, this message translates to:
  /// **'Prochain cycle de facturation : {date}'**
  String nextBillingCycle(String date);

  /// No description provided for @generalSettingsTitle.
  ///
  /// In fr, this message translates to:
  /// **'PARAMÈTRES GÉNÉRAUX'**
  String get generalSettingsTitle;

  /// No description provided for @menuManagement.
  ///
  /// In fr, this message translates to:
  /// **'Gestion du menu'**
  String get menuManagement;

  /// No description provided for @menuManagementDesc.
  ///
  /// In fr, this message translates to:
  /// **'Mettre à jour les articles, prix et catégories'**
  String get menuManagementDesc;

  /// No description provided for @staffAccess.
  ///
  /// In fr, this message translates to:
  /// **'Accès du personnel'**
  String get staffAccess;

  /// No description provided for @staffAccessDesc.
  ///
  /// In fr, this message translates to:
  /// **'Gérer les rôles et permissions'**
  String get staffAccessDesc;

  /// No description provided for @billingInvoices.
  ///
  /// In fr, this message translates to:
  /// **'Facturation & Factures'**
  String get billingInvoices;

  /// No description provided for @billingInvoicesDesc.
  ///
  /// In fr, this message translates to:
  /// **'Voir l\'historique et les méthodes de paiement'**
  String get billingInvoicesDesc;

  /// No description provided for @claimingSupport.
  ///
  /// In fr, this message translates to:
  /// **'Support / Réclamation'**
  String get claimingSupport;

  /// No description provided for @claimingSupportDesc.
  ///
  /// In fr, this message translates to:
  /// **'Obtenir de l\'aide avec le profil de votre restaurant'**
  String get claimingSupportDesc;

  /// No description provided for @logout.
  ///
  /// In fr, this message translates to:
  /// **'Déconnexion'**
  String get logout;

  /// No description provided for @appVersion.
  ///
  /// In fr, this message translates to:
  /// **'VERSION DE L\'APP {version}'**
  String appVersion(String version);

  /// No description provided for @dashboard.
  ///
  /// In fr, this message translates to:
  /// **'Tableau de bord'**
  String get dashboard;

  /// No description provided for @weeklyRevenue.
  ///
  /// In fr, this message translates to:
  /// **'Revenus hebdomadaires'**
  String get weeklyRevenue;

  /// No description provided for @last7Days.
  ///
  /// In fr, this message translates to:
  /// **'7 derniers jours vs Période précédente'**
  String get last7Days;

  /// No description provided for @mon.
  ///
  /// In fr, this message translates to:
  /// **'LUN'**
  String get mon;

  /// No description provided for @tue.
  ///
  /// In fr, this message translates to:
  /// **'MAR'**
  String get tue;

  /// No description provided for @wed.
  ///
  /// In fr, this message translates to:
  /// **'MER'**
  String get wed;

  /// No description provided for @thu.
  ///
  /// In fr, this message translates to:
  /// **'JEU'**
  String get thu;

  /// No description provided for @fri.
  ///
  /// In fr, this message translates to:
  /// **'VEN'**
  String get fri;

  /// No description provided for @sat.
  ///
  /// In fr, this message translates to:
  /// **'SAM'**
  String get sat;

  /// No description provided for @sun.
  ///
  /// In fr, this message translates to:
  /// **'DIM'**
  String get sun;

  /// No description provided for @peakHourStats.
  ///
  /// In fr, this message translates to:
  /// **'Statistiques des heures de pointe'**
  String get peakHourStats;

  /// No description provided for @live.
  ///
  /// In fr, this message translates to:
  /// **'EN DIRECT'**
  String get live;

  /// No description provided for @busiestHour.
  ///
  /// In fr, this message translates to:
  /// **'HEURE LA PLUS CHARGÉE'**
  String get busiestHour;

  /// No description provided for @kitchenLoad.
  ///
  /// In fr, this message translates to:
  /// **'CHARGE CUISINE'**
  String get kitchenLoad;

  /// No description provided for @dailyRevenue.
  ///
  /// In fr, this message translates to:
  /// **'Revenu quotidien'**
  String get dailyRevenue;

  /// No description provided for @totalOrders.
  ///
  /// In fr, this message translates to:
  /// **'Total commandes'**
  String get totalOrders;

  /// No description provided for @activeTables.
  ///
  /// In fr, this message translates to:
  /// **'Tables actives'**
  String get activeTables;

  /// No description provided for @liveStatus.
  ///
  /// In fr, this message translates to:
  /// **'Statut en direct'**
  String get liveStatus;

  /// No description provided for @refresh.
  ///
  /// In fr, this message translates to:
  /// **'Actualiser'**
  String get refresh;

  /// No description provided for @currentActiveOrders.
  ///
  /// In fr, this message translates to:
  /// **'Commandes actives actuelles'**
  String get currentActiveOrders;

  /// No description provided for @ordersInPrep.
  ///
  /// In fr, this message translates to:
  /// **'{count} commandes sont en cours de préparation.'**
  String ordersInPrep(String count);

  /// No description provided for @preparing.
  ///
  /// In fr, this message translates to:
  /// **'En préparation'**
  String get preparing;

  /// No description provided for @ready.
  ///
  /// In fr, this message translates to:
  /// **'Prêt'**
  String get ready;

  /// No description provided for @viewKitchenDisplay.
  ///
  /// In fr, this message translates to:
  /// **'Voir l\'écran cuisine'**
  String get viewKitchenDisplay;

  /// No description provided for @efficiency.
  ///
  /// In fr, this message translates to:
  /// **'Efficacité'**
  String get efficiency;

  /// No description provided for @recentActivity.
  ///
  /// In fr, this message translates to:
  /// **'Activité récente'**
  String get recentActivity;

  /// No description provided for @tableAction.
  ///
  /// In fr, this message translates to:
  /// **'Action sur table'**
  String get tableAction;

  /// No description provided for @recentNotifications.
  ///
  /// In fr, this message translates to:
  /// **'Notifications récentes'**
  String get recentNotifications;

  /// No description provided for @viewAllActivity.
  ///
  /// In fr, this message translates to:
  /// **'Voir toute l\'activité'**
  String get viewAllActivity;

  /// No description provided for @navHome.
  ///
  /// In fr, this message translates to:
  /// **'Accueil'**
  String get navHome;

  /// No description provided for @navOrders.
  ///
  /// In fr, this message translates to:
  /// **'Commandes'**
  String get navOrders;

  /// No description provided for @navTables.
  ///
  /// In fr, this message translates to:
  /// **'Tables'**
  String get navTables;

  /// No description provided for @navSales.
  ///
  /// In fr, this message translates to:
  /// **'Ventes'**
  String get navSales;

  /// No description provided for @navAccount.
  ///
  /// In fr, this message translates to:
  /// **'Compte'**
  String get navAccount;

  /// No description provided for @menuManagementTitle.
  ///
  /// In fr, this message translates to:
  /// **'Gestion du menu'**
  String get menuManagementTitle;

  /// No description provided for @newItem.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter'**
  String get newItem;

  /// No description provided for @tabCategories.
  ///
  /// In fr, this message translates to:
  /// **'Catégories'**
  String get tabCategories;

  /// No description provided for @tabAllItems.
  ///
  /// In fr, this message translates to:
  /// **'Tous les articles'**
  String get tabAllItems;

  /// No description provided for @tabAvailability.
  ///
  /// In fr, this message translates to:
  /// **'Disponibilité'**
  String get tabAvailability;

  /// No description provided for @tabMenuSettings.
  ///
  /// In fr, this message translates to:
  /// **'Paramètres du menu'**
  String get tabMenuSettings;

  /// No description provided for @categoryAppetizers.
  ///
  /// In fr, this message translates to:
  /// **'Entrées'**
  String get categoryAppetizers;

  /// No description provided for @itemBruschetta.
  ///
  /// In fr, this message translates to:
  /// **'Bruschetta Classica'**
  String get itemBruschetta;

  /// No description provided for @descBruschetta.
  ///
  /// In fr, this message translates to:
  /// **'Pain rustique grillé, tomates mûries sur vigne, ail, basilic'**
  String get descBruschetta;

  /// No description provided for @price12_5.
  ///
  /// In fr, this message translates to:
  /// **'12.500 TND'**
  String get price12_5;

  /// No description provided for @itemCalamari.
  ///
  /// In fr, this message translates to:
  /// **'Calamars croustillants'**
  String get itemCalamari;

  /// No description provided for @descCalamari.
  ///
  /// In fr, this message translates to:
  /// **'Anneaux de calmars frits dorés avec sauce marinara épicée'**
  String get descCalamari;

  /// No description provided for @price18.
  ///
  /// In fr, this message translates to:
  /// **'18.000 TND'**
  String get price18;

  /// No description provided for @categoryMainCourse.
  ///
  /// In fr, this message translates to:
  /// **'Plats principaux'**
  String get categoryMainCourse;

  /// No description provided for @itemSalmon.
  ///
  /// In fr, this message translates to:
  /// **'Saumon de l\'Atlantique grillé'**
  String get itemSalmon;

  /// No description provided for @descSalmon.
  ///
  /// In fr, this message translates to:
  /// **'Avec légumes grillés de saison et sauce au beurre citronné'**
  String get descSalmon;

  /// No description provided for @price42.
  ///
  /// In fr, this message translates to:
  /// **'42.000 TND'**
  String get price42;

  /// No description provided for @itemSteak.
  ///
  /// In fr, this message translates to:
  /// **'Steak de filet de bœuf'**
  String get itemSteak;

  /// No description provided for @descSteak.
  ///
  /// In fr, this message translates to:
  /// **'250g de bœuf de première qualité, pommes de terre rôties, sauce au poivre vert'**
  String get descSteak;

  /// No description provided for @price55.
  ///
  /// In fr, this message translates to:
  /// **'55.000 TND'**
  String get price55;

  /// No description provided for @categoryDrinks.
  ///
  /// In fr, this message translates to:
  /// **'Boissons'**
  String get categoryDrinks;

  /// No description provided for @itemOrangeJuice.
  ///
  /// In fr, this message translates to:
  /// **'Jus d\'orange frais'**
  String get itemOrangeJuice;

  /// No description provided for @descOrangeJuice.
  ///
  /// In fr, this message translates to:
  /// **'Oranges locales 100% fraîchement pressées'**
  String get descOrangeJuice;

  /// No description provided for @priceFrom8_5.
  ///
  /// In fr, this message translates to:
  /// **'À partir de 8.500 TND'**
  String get priceFrom8_5;

  /// No description provided for @itemCount.
  ///
  /// In fr, this message translates to:
  /// **'{count} Articles'**
  String itemCount(String count);

  /// No description provided for @editCategory.
  ///
  /// In fr, this message translates to:
  /// **'Modifier'**
  String get editCategory;

  /// No description provided for @addNew.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter nouveau'**
  String get addNew;

  /// No description provided for @item.
  ///
  /// In fr, this message translates to:
  /// **'Article'**
  String get item;

  /// No description provided for @category.
  ///
  /// In fr, this message translates to:
  /// **'Catégorie'**
  String get category;

  /// No description provided for @categoryName.
  ///
  /// In fr, this message translates to:
  /// **'Nom de la catégorie'**
  String get categoryName;

  /// No description provided for @eGMenu.
  ///
  /// In fr, this message translates to:
  /// **'ex. Boissons, Plats principaux'**
  String get eGMenu;

  /// No description provided for @categoryVisibleHint.
  ///
  /// In fr, this message translates to:
  /// **'Cette catégorie sera visible dans votre menu numérique et système POS.'**
  String get categoryVisibleHint;

  /// No description provided for @saveChanges.
  ///
  /// In fr, this message translates to:
  /// **'Enregistrer les modifications'**
  String get saveChanges;

  /// No description provided for @preview.
  ///
  /// In fr, this message translates to:
  /// **'Aperçu'**
  String get preview;

  /// No description provided for @deleteCategory.
  ///
  /// In fr, this message translates to:
  /// **'Supprimer la catégorie'**
  String get deleteCategory;

  /// No description provided for @assignedItems.
  ///
  /// In fr, this message translates to:
  /// **'Articles assignés'**
  String get assignedItems;

  /// No description provided for @itemGarlicBread.
  ///
  /// In fr, this message translates to:
  /// **'Pain à l\'ail aux herbes'**
  String get itemGarlicBread;

  /// No description provided for @price8_5.
  ///
  /// In fr, this message translates to:
  /// **'8.50 TND'**
  String get price8_5;

  /// No description provided for @itemCalamariRings.
  ///
  /// In fr, this message translates to:
  /// **'Anneaux de calmars croustillants'**
  String get itemCalamariRings;

  /// No description provided for @price14.
  ///
  /// In fr, this message translates to:
  /// **'14.00 TND'**
  String get price14;

  /// No description provided for @itemTomatoBruschetta.
  ///
  /// In fr, this message translates to:
  /// **'Bruschetta aux tomates'**
  String get itemTomatoBruschetta;

  /// No description provided for @price10.
  ///
  /// In fr, this message translates to:
  /// **'10.00 TND'**
  String get price10;

  /// No description provided for @itemCaesarSalad.
  ///
  /// In fr, this message translates to:
  /// **'Salade César'**
  String get itemCaesarSalad;

  /// No description provided for @price12.
  ///
  /// In fr, this message translates to:
  /// **'12.00 TND'**
  String get price12;

  /// No description provided for @itemBuffaloWings.
  ///
  /// In fr, this message translates to:
  /// **'Ailes Buffalo (6pcs)'**
  String get itemBuffaloWings;

  /// No description provided for @price11_5.
  ///
  /// In fr, this message translates to:
  /// **'11.50 TND'**
  String get price11_5;

  /// No description provided for @uploadDishImage.
  ///
  /// In fr, this message translates to:
  /// **'Télécharger l\'image du plat'**
  String get uploadDishImage;

  /// No description provided for @jpgOrPng.
  ///
  /// In fr, this message translates to:
  /// **'JPG ou PNG, max 5MB'**
  String get jpgOrPng;

  /// No description provided for @selectImage.
  ///
  /// In fr, this message translates to:
  /// **'Sélectionner l\'image'**
  String get selectImage;

  /// No description provided for @itemName.
  ///
  /// In fr, this message translates to:
  /// **'Nom de l\'article'**
  String get itemName;

  /// No description provided for @eGGrilledSeaBass.
  ///
  /// In fr, this message translates to:
  /// **'ex. Bar grillé'**
  String get eGGrilledSeaBass;

  /// No description provided for @selectCategory.
  ///
  /// In fr, this message translates to:
  /// **'Sélectionner une catégorie'**
  String get selectCategory;

  /// No description provided for @categoryDesserts.
  ///
  /// In fr, this message translates to:
  /// **'Desserts'**
  String get categoryDesserts;

  /// No description provided for @hasMultipleSizes.
  ///
  /// In fr, this message translates to:
  /// **'A plusieurs tailles ?'**
  String get hasMultipleSizes;

  /// No description provided for @priceTnd.
  ///
  /// In fr, this message translates to:
  /// **'Prix (TND)'**
  String get priceTnd;

  /// No description provided for @available.
  ///
  /// In fr, this message translates to:
  /// **'Disponible'**
  String get available;

  /// No description provided for @sizes.
  ///
  /// In fr, this message translates to:
  /// **'Tailles'**
  String get sizes;

  /// No description provided for @addSize.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter une taille'**
  String get addSize;

  /// No description provided for @sizeEgSmall.
  ///
  /// In fr, this message translates to:
  /// **'Taille (ex. Petit)'**
  String get sizeEgSmall;

  /// No description provided for @price.
  ///
  /// In fr, this message translates to:
  /// **'Prix'**
  String get price;

  /// No description provided for @description.
  ///
  /// In fr, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @describeIngredients.
  ///
  /// In fr, this message translates to:
  /// **'Décrivez les ingrédients et la préparation...'**
  String get describeIngredients;

  /// No description provided for @eGBreakfast.
  ///
  /// In fr, this message translates to:
  /// **'ex. Spécialités du petit-déjeuner'**
  String get eGBreakfast;

  /// No description provided for @assignExistingItems.
  ///
  /// In fr, this message translates to:
  /// **'Assigner des articles existants'**
  String get assignExistingItems;

  /// No description provided for @itemGrilledChicken.
  ///
  /// In fr, this message translates to:
  /// **'Poulet grillé'**
  String get itemGrilledChicken;

  /// No description provided for @itemClassicBurger.
  ///
  /// In fr, this message translates to:
  /// **'Burger classique'**
  String get itemClassicBurger;

  /// No description provided for @displayOrder.
  ///
  /// In fr, this message translates to:
  /// **'Ordre d\'affichage'**
  String get displayOrder;

  /// No description provided for @eG1.
  ///
  /// In fr, this message translates to:
  /// **'ex. 1'**
  String get eG1;

  /// No description provided for @ordersManagement.
  ///
  /// In fr, this message translates to:
  /// **'Gestion des commandes'**
  String get ordersManagement;

  /// No description provided for @searchOrders.
  ///
  /// In fr, this message translates to:
  /// **'Rechercher par ID de commande, table...'**
  String get searchOrders;

  /// No description provided for @filterAll.
  ///
  /// In fr, this message translates to:
  /// **'Tous'**
  String get filterAll;

  /// No description provided for @filterNewOrder.
  ///
  /// In fr, this message translates to:
  /// **'Nouvelle commande'**
  String get filterNewOrder;

  /// No description provided for @filterPreparing.
  ///
  /// In fr, this message translates to:
  /// **'En préparation'**
  String get filterPreparing;

  /// No description provided for @filterReady.
  ///
  /// In fr, this message translates to:
  /// **'Prêt'**
  String get filterReady;

  /// No description provided for @filterCancelled.
  ///
  /// In fr, this message translates to:
  /// **'Annulé'**
  String get filterCancelled;

  /// No description provided for @filterPaid.
  ///
  /// In fr, this message translates to:
  /// **'Payé'**
  String get filterPaid;

  /// No description provided for @filterCompleted.
  ///
  /// In fr, this message translates to:
  /// **'Terminé'**
  String get filterCompleted;

  /// No description provided for @ordersCount.
  ///
  /// In fr, this message translates to:
  /// **'COMMANDES ({count})'**
  String ordersCount(String count);

  /// No description provided for @orderedAt.
  ///
  /// In fr, this message translates to:
  /// **'Commandé à {time}'**
  String orderedAt(String time);

  /// No description provided for @tableUpper.
  ///
  /// In fr, this message translates to:
  /// **'TABLE'**
  String get tableUpper;

  /// No description provided for @itemsUpper.
  ///
  /// In fr, this message translates to:
  /// **'ARTICLES'**
  String get itemsUpper;

  /// No description provided for @totalUpper.
  ///
  /// In fr, this message translates to:
  /// **'TOTAL'**
  String get totalUpper;

  /// No description provided for @orderId.
  ///
  /// In fr, this message translates to:
  /// **'Commande {id}'**
  String orderId(String id);

  /// No description provided for @placedAt.
  ///
  /// In fr, this message translates to:
  /// **'Passée à {time}'**
  String placedAt(String time);

  /// No description provided for @newOrderUpper.
  ///
  /// In fr, this message translates to:
  /// **'NOUVELLE'**
  String get newOrderUpper;

  /// No description provided for @diningAreaMain.
  ///
  /// In fr, this message translates to:
  /// **'Espace repas - Rez-de-chaussée'**
  String get diningAreaMain;

  /// No description provided for @orderItemsUpper.
  ///
  /// In fr, this message translates to:
  /// **'ARTICLES DE LA COMMANDE'**
  String get orderItemsUpper;

  /// No description provided for @orderTimelineUpper.
  ///
  /// In fr, this message translates to:
  /// **'CHRONOLOGIE DE LA COMMANDE'**
  String get orderTimelineUpper;

  /// No description provided for @orderReceived.
  ///
  /// In fr, this message translates to:
  /// **'Commande reçue'**
  String get orderReceived;

  /// No description provided for @preparingInKitchen.
  ///
  /// In fr, this message translates to:
  /// **'Préparation en cuisine'**
  String get preparingInKitchen;

  /// No description provided for @readyForServing.
  ///
  /// In fr, this message translates to:
  /// **'Prêt à servir'**
  String get readyForServing;

  /// No description provided for @pendingOrder.
  ///
  /// In fr, this message translates to:
  /// **'En attente'**
  String get pendingOrder;

  /// No description provided for @nextStep.
  ///
  /// In fr, this message translates to:
  /// **'Étape suivante'**
  String get nextStep;

  /// No description provided for @previousStep.
  ///
  /// In fr, this message translates to:
  /// **'Étape précédente'**
  String get previousStep;

  /// No description provided for @cancelOrder.
  ///
  /// In fr, this message translates to:
  /// **'Annuler la commande'**
  String get cancelOrder;

  /// No description provided for @quantityX.
  ///
  /// In fr, this message translates to:
  /// **'Quantité : {qty}x'**
  String quantityX(String qty);

  /// No description provided for @subtotal.
  ///
  /// In fr, this message translates to:
  /// **'Sous-total'**
  String get subtotal;

  /// No description provided for @tax7.
  ///
  /// In fr, this message translates to:
  /// **'Taxe (7%)'**
  String get tax7;

  /// No description provided for @tax10.
  ///
  /// In fr, this message translates to:
  /// **'Taxe (10%)'**
  String get tax10;

  /// No description provided for @total.
  ///
  /// In fr, this message translates to:
  /// **'Total'**
  String get total;

  /// No description provided for @totalAmount.
  ///
  /// In fr, this message translates to:
  /// **'Montant total'**
  String get totalAmount;

  /// No description provided for @ordersHistory.
  ///
  /// In fr, this message translates to:
  /// **'Historique des commandes'**
  String get ordersHistory;

  /// No description provided for @totalSalesToday.
  ///
  /// In fr, this message translates to:
  /// **'VENTES TOTALES AUJOURD\'HUI'**
  String get totalSalesToday;

  /// No description provided for @vsYest.
  ///
  /// In fr, this message translates to:
  /// **'+8% vs hier'**
  String get vsYest;

  /// No description provided for @avgOrderValue.
  ///
  /// In fr, this message translates to:
  /// **'VALEUR MOYENNE COMMANDE'**
  String get avgOrderValue;

  /// No description provided for @stable.
  ///
  /// In fr, this message translates to:
  /// **'Stable'**
  String get stable;

  /// No description provided for @filterToday.
  ///
  /// In fr, this message translates to:
  /// **'Aujourd\'hui'**
  String get filterToday;

  /// No description provided for @filterYesterday.
  ///
  /// In fr, this message translates to:
  /// **'Hier'**
  String get filterYesterday;

  /// No description provided for @filterLast7Days.
  ///
  /// In fr, this message translates to:
  /// **'7 derniers jours'**
  String get filterLast7Days;

  /// No description provided for @filters.
  ///
  /// In fr, this message translates to:
  /// **'Filtres'**
  String get filters;

  /// No description provided for @recentOrdersUpper.
  ///
  /// In fr, this message translates to:
  /// **'COMMANDES RÉCENTES'**
  String get recentOrdersUpper;

  /// No description provided for @ordersFound.
  ///
  /// In fr, this message translates to:
  /// **'{count} commandes trouvées'**
  String ordersFound(String count);

  /// No description provided for @orderDetailsId.
  ///
  /// In fr, this message translates to:
  /// **'Détails de la commande {id}'**
  String orderDetailsId(String id);

  /// No description provided for @completedAndPaid.
  ///
  /// In fr, this message translates to:
  /// **'TERMINÉ & PAYÉ'**
  String get completedAndPaid;

  /// No description provided for @orderInformationUpper.
  ///
  /// In fr, this message translates to:
  /// **'INFORMATIONS SUR LA COMMANDE'**
  String get orderInformationUpper;

  /// No description provided for @tableNumber.
  ///
  /// In fr, this message translates to:
  /// **'Numéro de table'**
  String get tableNumber;

  /// No description provided for @dateTime.
  ///
  /// In fr, this message translates to:
  /// **'Date et heure'**
  String get dateTime;

  /// No description provided for @itemsOrdered.
  ///
  /// In fr, this message translates to:
  /// **'Articles commandés'**
  String get itemsOrdered;

  /// No description provided for @qtyXPrice.
  ///
  /// In fr, this message translates to:
  /// **'Qté : {qty} x {price}'**
  String qtyXPrice(String qty, String price);

  /// No description provided for @tablesManagement.
  ///
  /// In fr, this message translates to:
  /// **'Gestion des tables'**
  String get tablesManagement;

  /// No description provided for @addTable.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter'**
  String get addTable;

  /// No description provided for @allTables.
  ///
  /// In fr, this message translates to:
  /// **'Toutes les tables'**
  String get allTables;

  /// No description provided for @disabled.
  ///
  /// In fr, this message translates to:
  /// **'Désactivé'**
  String get disabled;

  /// No description provided for @viewQrCode.
  ///
  /// In fr, this message translates to:
  /// **'Voir le code QR'**
  String get viewQrCode;

  /// No description provided for @seatsCount.
  ///
  /// In fr, this message translates to:
  /// **'{count} Places'**
  String seatsCount(String count);

  /// No description provided for @tableId.
  ///
  /// In fr, this message translates to:
  /// **'Table {id}'**
  String tableId(String id);

  /// No description provided for @whenDisabledDesc.
  ///
  /// In fr, this message translates to:
  /// **'Lorsqu\'il est désactivé, les clients ne peuvent pas scanner pour commander.'**
  String get whenDisabledDesc;

  /// No description provided for @presentCodeDesc.
  ///
  /// In fr, this message translates to:
  /// **'Présentez ce code aux clients pour une commande instantanée et un paiement sans contact.'**
  String get presentCodeDesc;

  /// No description provided for @downloadQrCode.
  ///
  /// In fr, this message translates to:
  /// **'Télécharger le code QR'**
  String get downloadQrCode;

  /// No description provided for @verifyEmail.
  ///
  /// In fr, this message translates to:
  /// **'Vérifier l\'e-mail'**
  String get verifyEmail;

  /// No description provided for @enter6DigitCode.
  ///
  /// In fr, this message translates to:
  /// **'Entrez le code à 6 chiffres'**
  String get enter6DigitCode;

  /// No description provided for @codeSentTo.
  ///
  /// In fr, this message translates to:
  /// **'Nous avons envoyé un code de vérification à\n'**
  String get codeSentTo;

  /// No description provided for @verifyCode.
  ///
  /// In fr, this message translates to:
  /// **'Vérifier le code'**
  String get verifyCode;

  /// No description provided for @didntReceiveCode.
  ///
  /// In fr, this message translates to:
  /// **'Vous n\'avez pas reçu le code ?'**
  String get didntReceiveCode;

  /// No description provided for @resendCode.
  ///
  /// In fr, this message translates to:
  /// **'Renvoyer le code'**
  String get resendCode;

  /// No description provided for @changePasswordTitle.
  ///
  /// In fr, this message translates to:
  /// **'Changer le mot de passe'**
  String get changePasswordTitle;

  /// No description provided for @updateSecurity.
  ///
  /// In fr, this message translates to:
  /// **'Mettre à jour la sécurité'**
  String get updateSecurity;

  /// No description provided for @changePasswordDesc.
  ///
  /// In fr, this message translates to:
  /// **'Veuillez entrer votre mot de passe actuel pour vérifier votre identité, puis choisissez un nouveau mot de passe fort.'**
  String get changePasswordDesc;

  /// No description provided for @currentPassword.
  ///
  /// In fr, this message translates to:
  /// **'Mot de passe actuel'**
  String get currentPassword;

  /// No description provided for @newPassword.
  ///
  /// In fr, this message translates to:
  /// **'Nouveau mot de passe'**
  String get newPassword;

  /// No description provided for @atLeast8Chars.
  ///
  /// In fr, this message translates to:
  /// **'Au moins 8 caractères'**
  String get atLeast8Chars;

  /// No description provided for @includeNumbersSymbols.
  ///
  /// In fr, this message translates to:
  /// **'Incluez des chiffres et des symboles pour une meilleure sécurité.'**
  String get includeNumbersSymbols;

  /// No description provided for @confirmNewPassword.
  ///
  /// In fr, this message translates to:
  /// **'Confirmer le nouveau mot de passe'**
  String get confirmNewPassword;

  /// No description provided for @repeatNewPassword.
  ///
  /// In fr, this message translates to:
  /// **'Répéter le nouveau mot de passe'**
  String get repeatNewPassword;

  /// No description provided for @savePassword.
  ///
  /// In fr, this message translates to:
  /// **'Enregistrer le mot de passe'**
  String get savePassword;

  /// No description provided for @forgotYourPassword.
  ///
  /// In fr, this message translates to:
  /// **'Mot de passe oublié ? '**
  String get forgotYourPassword;

  /// No description provided for @resetItViaEmail.
  ///
  /// In fr, this message translates to:
  /// **'Le réinitialiser par e-mail'**
  String get resetItViaEmail;

  /// No description provided for @addStaffMember.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter un membre'**
  String get addStaffMember;

  /// No description provided for @fullName.
  ///
  /// In fr, this message translates to:
  /// **'Nom complet'**
  String get fullName;

  /// No description provided for @egFullName.
  ///
  /// In fr, this message translates to:
  /// **'ex. Ahmed Ben Ali'**
  String get egFullName;

  /// No description provided for @role.
  ///
  /// In fr, this message translates to:
  /// **'Rôle'**
  String get role;

  /// No description provided for @seniorWaiter.
  ///
  /// In fr, this message translates to:
  /// **'Serveur principal'**
  String get seniorWaiter;

  /// No description provided for @waiter.
  ///
  /// In fr, this message translates to:
  /// **'Serveur'**
  String get waiter;

  /// No description provided for @egEmail.
  ///
  /// In fr, this message translates to:
  /// **'nom@restaurant.tn'**
  String get egEmail;

  /// No description provided for @phoneNumber.
  ///
  /// In fr, this message translates to:
  /// **'Numéro de téléphone'**
  String get phoneNumber;

  /// No description provided for @egPhone.
  ///
  /// In fr, this message translates to:
  /// **'00 000 000'**
  String get egPhone;

  /// No description provided for @confirmPassword.
  ///
  /// In fr, this message translates to:
  /// **'Confirmer le mot de passe'**
  String get confirmPassword;

  /// No description provided for @cancel.
  ///
  /// In fr, this message translates to:
  /// **'Annuler'**
  String get cancel;

  /// No description provided for @editProfileTitle.
  ///
  /// In fr, this message translates to:
  /// **'Modifier le profil'**
  String get editProfileTitle;

  /// No description provided for @adminAccount.
  ///
  /// In fr, this message translates to:
  /// **'Compte administrateur'**
  String get adminAccount;

  /// No description provided for @updateProfileSettings.
  ///
  /// In fr, this message translates to:
  /// **'Mettre à jour vos paramètres de profil'**
  String get updateProfileSettings;

  /// No description provided for @restaurantRole.
  ///
  /// In fr, this message translates to:
  /// **'Rôle dans le restaurant'**
  String get restaurantRole;

  /// No description provided for @security.
  ///
  /// In fr, this message translates to:
  /// **'Sécurité'**
  String get security;

  /// No description provided for @lastUpdated3MonthsAgo.
  ///
  /// In fr, this message translates to:
  /// **'Dernière mise à jour il y a 3 mois'**
  String get lastUpdated3MonthsAgo;

  /// No description provided for @billingInvoicesTitle.
  ///
  /// In fr, this message translates to:
  /// **'Facturation & Factures'**
  String get billingInvoicesTitle;

  /// No description provided for @invoiceHistory.
  ///
  /// In fr, this message translates to:
  /// **'Historique des factures'**
  String get invoiceHistory;

  /// No description provided for @paid.
  ///
  /// In fr, this message translates to:
  /// **'PAYÉ'**
  String get paid;

  /// No description provided for @pending.
  ///
  /// In fr, this message translates to:
  /// **'EN ATTENTE'**
  String get pending;

  /// No description provided for @contactSupportTitle.
  ///
  /// In fr, this message translates to:
  /// **'Contacter le support'**
  String get contactSupportTitle;

  /// No description provided for @haveAQuestion.
  ///
  /// In fr, this message translates to:
  /// **'Vous avez une question ?'**
  String get haveAQuestion;

  /// No description provided for @contactDesc.
  ///
  /// In fr, this message translates to:
  /// **'Envoyez-nous un message et notre équipe vous répondra dans les plus brefs délais.'**
  String get contactDesc;

  /// No description provided for @subject.
  ///
  /// In fr, this message translates to:
  /// **'Sujet'**
  String get subject;

  /// No description provided for @subjectHint.
  ///
  /// In fr, this message translates to:
  /// **'De quoi s\'agit-il ?'**
  String get subjectHint;

  /// No description provided for @message.
  ///
  /// In fr, this message translates to:
  /// **'Message'**
  String get message;

  /// No description provided for @messageHint.
  ///
  /// In fr, this message translates to:
  /// **'Expliquez votre problème ou question en détail...'**
  String get messageHint;

  /// No description provided for @sendMessage.
  ///
  /// In fr, this message translates to:
  /// **'Envoyer le message'**
  String get sendMessage;

  /// No description provided for @expectedResponseTime.
  ///
  /// In fr, this message translates to:
  /// **'Temps de réponse estimé : '**
  String get expectedResponseTime;

  /// No description provided for @within24Hours.
  ///
  /// In fr, this message translates to:
  /// **'dans les 24 heures'**
  String get within24Hours;

  /// No description provided for @editRestaurantName.
  ///
  /// In fr, this message translates to:
  /// **'Modifier le nom du restaurant'**
  String get editRestaurantName;

  /// No description provided for @editRestaurantNameDesc.
  ///
  /// In fr, this message translates to:
  /// **'Mettez à jour votre identité commerciale publique. Ce nom apparaîtra sur les reçus et l\'application client.'**
  String get editRestaurantNameDesc;

  /// No description provided for @egRestaurantName.
  ///
  /// In fr, this message translates to:
  /// **'ex. La Fourchette d\'Or'**
  String get egRestaurantName;

  /// No description provided for @needHelp.
  ///
  /// In fr, this message translates to:
  /// **'Besoin d\'aide ?'**
  String get needHelp;

  /// No description provided for @changingNameHelp.
  ///
  /// In fr, this message translates to:
  /// **'Changer fréquemment de nom peut affecter votre classement de recherche dans les applications de livraison.'**
  String get changingNameHelp;

  /// No description provided for @addStaff.
  ///
  /// In fr, this message translates to:
  /// **'Ajouter'**
  String get addStaff;

  /// No description provided for @roleManager.
  ///
  /// In fr, this message translates to:
  /// **'Gérant'**
  String get roleManager;

  /// No description provided for @activeMembersCount.
  ///
  /// In fr, this message translates to:
  /// **'{count} membres actifs'**
  String activeMembersCount(String count);

  /// No description provided for @activeCaps.
  ///
  /// In fr, this message translates to:
  /// **'ACTIF'**
  String get activeCaps;

  /// No description provided for @inactiveCaps.
  ///
  /// In fr, this message translates to:
  /// **'INACTIF'**
  String get inactiveCaps;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'fr':
      return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
