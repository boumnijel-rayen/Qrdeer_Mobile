// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Qrdeer';

  @override
  String get welcomeTo => 'Bienvenue sur ';

  @override
  String get brandName => 'r';

  @override
  String get manageKitchenDesc =>
      'Gérez facilement vos opérations en cuisine et votre personnel.';

  @override
  String get emailAddress => 'Adresse e-mail';

  @override
  String get emailHint => 'admin@qrdeer.com';

  @override
  String get password => 'Mot de passe';

  @override
  String get forgotPassword => 'Mot de passe oublié ?';

  @override
  String get loginToDashboard => 'Connexion au tableau de bord';

  @override
  String get orLoginWith => 'OU CONNECTEZ-VOUS AVEC';

  @override
  String get staffBioId => 'Bio-ID personnel';

  @override
  String get newStaffMember => 'Nouveau membre ? ';

  @override
  String get contactTeam => 'Contacter l\'équipe';

  @override
  String get settings => 'Paramètres';

  @override
  String get adminAccess => 'ACCÈS ADMIN';

  @override
  String get editProfileDetails => 'Modifier le profil';

  @override
  String get restaurantDetailsTitle => 'DÉTAILS DU RESTAURANT';

  @override
  String get restaurantName => 'Nom du restaurant';

  @override
  String get address => 'Adresse';

  @override
  String get subscriptionTitle => 'ABONNEMENT';

  @override
  String get currentPlan => 'FORFAIT ACTUEL';

  @override
  String get activeStatus => 'Actif';

  @override
  String nextBillingCycle(String date) {
    return 'Prochain cycle de facturation : $date';
  }

  @override
  String get generalSettingsTitle => 'PARAMÈTRES GÉNÉRAUX';

  @override
  String get menuManagement => 'Gestion du menu';

  @override
  String get menuManagementDesc =>
      'Mettre à jour les articles, prix et catégories';

  @override
  String get staffAccess => 'Accès du personnel';

  @override
  String get staffAccessDesc => 'Gérer les rôles et permissions';

  @override
  String get billingInvoices => 'Facturation & Factures';

  @override
  String get billingInvoicesDesc =>
      'Voir l\'historique et les méthodes de paiement';

  @override
  String get claimingSupport => 'Support / Réclamation';

  @override
  String get claimingSupportDesc =>
      'Obtenir de l\'aide avec le profil de votre restaurant';

  @override
  String get logout => 'Déconnexion';

  @override
  String appVersion(String version) {
    return 'VERSION DE L\'APP $version';
  }

  @override
  String get dashboard => 'Tableau de bord';

  @override
  String get weeklyRevenue => 'Revenus hebdomadaires';

  @override
  String get last7Days => '7 derniers jours vs Période précédente';

  @override
  String get mon => 'LUN';

  @override
  String get tue => 'MAR';

  @override
  String get wed => 'MER';

  @override
  String get thu => 'JEU';

  @override
  String get fri => 'VEN';

  @override
  String get sat => 'SAM';

  @override
  String get sun => 'DIM';

  @override
  String get peakHourStats => 'Statistiques des heures de pointe';

  @override
  String get live => 'EN DIRECT';

  @override
  String get busiestHour => 'HEURE LA PLUS CHARGÉE';

  @override
  String get kitchenLoad => 'CHARGE CUISINE';

  @override
  String get dailyRevenue => 'Revenu quotidien';

  @override
  String get totalOrders => 'Total commandes';

  @override
  String get activeTables => 'Tables actives';

  @override
  String get liveStatus => 'Statut en direct';

  @override
  String get refresh => 'Actualiser';

  @override
  String get currentActiveOrders => 'Commandes actives actuelles';

  @override
  String ordersInPrep(String count) {
    return '$count commandes sont en cours de préparation.';
  }

  @override
  String get preparing => 'En préparation';

  @override
  String get ready => 'Prêt';

  @override
  String get viewKitchenDisplay => 'Voir l\'écran cuisine';

  @override
  String get efficiency => 'Efficacité';

  @override
  String get recentActivity => 'Activité récente';

  @override
  String get tableAction => 'Action sur table';

  @override
  String get recentNotifications => 'Notifications récentes';

  @override
  String get viewAllActivity => 'Voir toute l\'activité';

  @override
  String get navHome => 'Accueil';

  @override
  String get navOrders => 'Commandes';

  @override
  String get navTables => 'Tables';

  @override
  String get navSales => 'Ventes';

  @override
  String get navAccount => 'Compte';

  @override
  String get menuManagementTitle => 'Gestion du menu';

  @override
  String get newItem => 'Ajouter';

  @override
  String get tabCategories => 'Catégories';

  @override
  String get tabAllItems => 'Tous les articles';

  @override
  String get tabAvailability => 'Disponibilité';

  @override
  String get tabMenuSettings => 'Paramètres du menu';

  @override
  String get categoryAppetizers => 'Entrées';

  @override
  String get itemBruschetta => 'Bruschetta Classica';

  @override
  String get descBruschetta =>
      'Pain rustique grillé, tomates mûries sur vigne, ail, basilic';

  @override
  String get price12_5 => '12.500 TND';

  @override
  String get itemCalamari => 'Calamars croustillants';

  @override
  String get descCalamari =>
      'Anneaux de calmars frits dorés avec sauce marinara épicée';

  @override
  String get price18 => '18.000 TND';

  @override
  String get categoryMainCourse => 'Plats principaux';

  @override
  String get itemSalmon => 'Saumon de l\'Atlantique grillé';

  @override
  String get descSalmon =>
      'Avec légumes grillés de saison et sauce au beurre citronné';

  @override
  String get price42 => '42.000 TND';

  @override
  String get itemSteak => 'Steak de filet de bœuf';

  @override
  String get descSteak =>
      '250g de bœuf de première qualité, pommes de terre rôties, sauce au poivre vert';

  @override
  String get price55 => '55.000 TND';

  @override
  String get categoryDrinks => 'Boissons';

  @override
  String get itemOrangeJuice => 'Jus d\'orange frais';

  @override
  String get descOrangeJuice => 'Oranges locales 100% fraîchement pressées';

  @override
  String get priceFrom8_5 => 'À partir de 8.500 TND';

  @override
  String itemCount(String count) {
    return '$count Articles';
  }

  @override
  String get editCategory => 'Modifier';

  @override
  String get addNew => 'Ajouter nouveau';

  @override
  String get item => 'Article';

  @override
  String get category => 'Catégorie';

  @override
  String get categoryName => 'Nom de la catégorie';

  @override
  String get eGMenu => 'ex. Boissons, Plats principaux';

  @override
  String get categoryVisibleHint =>
      'Cette catégorie sera visible dans votre menu numérique et système POS.';

  @override
  String get saveChanges => 'Enregistrer les modifications';

  @override
  String get preview => 'Aperçu';

  @override
  String get deleteCategory => 'Supprimer la catégorie';

  @override
  String get assignedItems => 'Articles assignés';

  @override
  String get itemGarlicBread => 'Pain à l\'ail aux herbes';

  @override
  String get price8_5 => '8.50 TND';

  @override
  String get itemCalamariRings => 'Anneaux de calmars croustillants';

  @override
  String get price14 => '14.00 TND';

  @override
  String get itemTomatoBruschetta => 'Bruschetta aux tomates';

  @override
  String get price10 => '10.00 TND';

  @override
  String get itemCaesarSalad => 'Salade César';

  @override
  String get price12 => '12.00 TND';

  @override
  String get itemBuffaloWings => 'Ailes Buffalo (6pcs)';

  @override
  String get price11_5 => '11.50 TND';

  @override
  String get uploadDishImage => 'Télécharger l\'image du plat';

  @override
  String get jpgOrPng => 'JPG ou PNG, max 5MB';

  @override
  String get selectImage => 'Sélectionner l\'image';

  @override
  String get itemName => 'Nom de l\'article';

  @override
  String get eGGrilledSeaBass => 'ex. Bar grillé';

  @override
  String get selectCategory => 'Sélectionner une catégorie';

  @override
  String get categoryDesserts => 'Desserts';

  @override
  String get hasMultipleSizes => 'A plusieurs tailles ?';

  @override
  String get priceTnd => 'Prix (TND)';

  @override
  String get available => 'Disponible';

  @override
  String get sizes => 'Tailles';

  @override
  String get addSize => 'Ajouter une taille';

  @override
  String get sizeEgSmall => 'Taille (ex. Petit)';

  @override
  String get price => 'Prix';

  @override
  String get description => 'Description';

  @override
  String get describeIngredients =>
      'Décrivez les ingrédients et la préparation...';

  @override
  String get eGBreakfast => 'ex. Spécialités du petit-déjeuner';

  @override
  String get assignExistingItems => 'Assigner des articles existants';

  @override
  String get itemGrilledChicken => 'Poulet grillé';

  @override
  String get itemClassicBurger => 'Burger classique';

  @override
  String get displayOrder => 'Ordre d\'affichage';

  @override
  String get eG1 => 'ex. 1';

  @override
  String get ordersManagement => 'Gestion des commandes';

  @override
  String get searchOrders => 'Rechercher par ID de commande, table...';

  @override
  String get filterAll => 'Tous';

  @override
  String get filterNewOrder => 'Nouvelle commande';

  @override
  String get filterPreparing => 'En préparation';

  @override
  String get filterReady => 'Prêt';

  @override
  String get filterCancelled => 'Annulé';

  @override
  String get filterPaid => 'Payé';

  @override
  String get filterCompleted => 'Terminé';

  @override
  String ordersCount(String count) {
    return 'COMMANDES ($count)';
  }

  @override
  String orderedAt(String time) {
    return 'Commandé à $time';
  }

  @override
  String get tableUpper => 'TABLE';

  @override
  String get itemsUpper => 'ARTICLES';

  @override
  String get totalUpper => 'TOTAL';

  @override
  String orderId(String id) {
    return 'Commande $id';
  }

  @override
  String placedAt(String time) {
    return 'Passée à $time';
  }

  @override
  String get newOrderUpper => 'NOUVELLE';

  @override
  String get diningAreaMain => 'Espace repas - Rez-de-chaussée';

  @override
  String get orderItemsUpper => 'ARTICLES DE LA COMMANDE';

  @override
  String get orderTimelineUpper => 'CHRONOLOGIE DE LA COMMANDE';

  @override
  String get orderReceived => 'Commande reçue';

  @override
  String get preparingInKitchen => 'Préparation en cuisine';

  @override
  String get readyForServing => 'Prêt à servir';

  @override
  String get pendingOrder => 'En attente';

  @override
  String get nextStep => 'Étape suivante';

  @override
  String get previousStep => 'Étape précédente';

  @override
  String get cancelOrder => 'Annuler la commande';

  @override
  String quantityX(String qty) {
    return 'Quantité : ${qty}x';
  }

  @override
  String get subtotal => 'Sous-total';

  @override
  String get tax7 => 'Taxe (7%)';

  @override
  String get tax10 => 'Taxe (10%)';

  @override
  String get total => 'Total';

  @override
  String get totalAmount => 'Montant total';

  @override
  String get ordersHistory => 'Historique des commandes';

  @override
  String get totalSalesToday => 'VENTES TOTALES AUJOURD\'HUI';

  @override
  String get vsYest => '+8% vs hier';

  @override
  String get avgOrderValue => 'VALEUR MOYENNE COMMANDE';

  @override
  String get stable => 'Stable';

  @override
  String get filterToday => 'Aujourd\'hui';

  @override
  String get filterYesterday => 'Hier';

  @override
  String get filterLast7Days => '7 derniers jours';

  @override
  String get filters => 'Filtres';

  @override
  String get recentOrdersUpper => 'COMMANDES RÉCENTES';

  @override
  String ordersFound(String count) {
    return '$count commandes trouvées';
  }

  @override
  String orderDetailsId(String id) {
    return 'Détails de la commande $id';
  }

  @override
  String get completedAndPaid => 'TERMINÉ & PAYÉ';

  @override
  String get orderInformationUpper => 'INFORMATIONS SUR LA COMMANDE';

  @override
  String get tableNumber => 'Numéro de table';

  @override
  String get dateTime => 'Date et heure';

  @override
  String get itemsOrdered => 'Articles commandés';

  @override
  String qtyXPrice(String qty, String price) {
    return 'Qté : $qty x $price';
  }

  @override
  String get tablesManagement => 'Gestion des tables';

  @override
  String get addTable => 'Ajouter';

  @override
  String get allTables => 'Toutes les tables';

  @override
  String get disabled => 'Désactivé';

  @override
  String get viewQrCode => 'Voir le code QR';

  @override
  String seatsCount(String count) {
    return '$count Places';
  }

  @override
  String tableId(String id) {
    return 'Table $id';
  }

  @override
  String get whenDisabledDesc =>
      'Lorsqu\'il est désactivé, les clients ne peuvent pas scanner pour commander.';

  @override
  String get presentCodeDesc =>
      'Présentez ce code aux clients pour une commande instantanée et un paiement sans contact.';

  @override
  String get downloadQrCode => 'Télécharger le code QR';

  @override
  String get verifyEmail => 'Vérifier l\'e-mail';

  @override
  String get enter6DigitCode => 'Entrez le code à 6 chiffres';

  @override
  String get codeSentTo => 'Nous avons envoyé un code de vérification à\n';

  @override
  String get verifyCode => 'Vérifier le code';

  @override
  String get didntReceiveCode => 'Vous n\'avez pas reçu le code ?';

  @override
  String get resendCode => 'Renvoyer le code';

  @override
  String get changePasswordTitle => 'Changer le mot de passe';

  @override
  String get updateSecurity => 'Mettre à jour la sécurité';

  @override
  String get changePasswordDesc =>
      'Veuillez entrer votre mot de passe actuel pour vérifier votre identité, puis choisissez un nouveau mot de passe fort.';

  @override
  String get currentPassword => 'Mot de passe actuel';

  @override
  String get newPassword => 'Nouveau mot de passe';

  @override
  String get atLeast8Chars => 'Au moins 8 caractères';

  @override
  String get includeNumbersSymbols =>
      'Incluez des chiffres et des symboles pour une meilleure sécurité.';

  @override
  String get confirmNewPassword => 'Confirmer le nouveau mot de passe';

  @override
  String get repeatNewPassword => 'Répéter le nouveau mot de passe';

  @override
  String get savePassword => 'Enregistrer le mot de passe';

  @override
  String get forgotYourPassword => 'Mot de passe oublié ? ';

  @override
  String get resetItViaEmail => 'Le réinitialiser par e-mail';

  @override
  String get addStaffMember => 'Ajouter un membre';

  @override
  String get fullName => 'Nom complet';

  @override
  String get egFullName => 'ex. Ahmed Ben Ali';

  @override
  String get role => 'Rôle';

  @override
  String get seniorWaiter => 'Serveur principal';

  @override
  String get waiter => 'Serveur';

  @override
  String get egEmail => 'nom@restaurant.tn';

  @override
  String get phoneNumber => 'Numéro de téléphone';

  @override
  String get egPhone => '00 000 000';

  @override
  String get confirmPassword => 'Confirmer le mot de passe';

  @override
  String get cancel => 'Annuler';

  @override
  String get editProfileTitle => 'Modifier le profil';

  @override
  String get adminAccount => 'Compte administrateur';

  @override
  String get updateProfileSettings => 'Mettre à jour vos paramètres de profil';

  @override
  String get restaurantRole => 'Rôle dans le restaurant';

  @override
  String get security => 'Sécurité';

  @override
  String get lastUpdated3MonthsAgo => 'Dernière mise à jour il y a 3 mois';

  @override
  String get billingInvoicesTitle => 'Facturation & Factures';

  @override
  String get invoiceHistory => 'Historique des factures';

  @override
  String get paid => 'PAYÉ';

  @override
  String get pending => 'EN ATTENTE';

  @override
  String get contactSupportTitle => 'Contacter le support';

  @override
  String get haveAQuestion => 'Vous avez une question ?';

  @override
  String get contactDesc =>
      'Envoyez-nous un message et notre équipe vous répondra dans les plus brefs délais.';

  @override
  String get subject => 'Sujet';

  @override
  String get subjectHint => 'De quoi s\'agit-il ?';

  @override
  String get message => 'Message';

  @override
  String get messageHint => 'Expliquez votre problème ou question en détail...';

  @override
  String get sendMessage => 'Envoyer le message';

  @override
  String get expectedResponseTime => 'Temps de réponse estimé : ';

  @override
  String get within24Hours => 'dans les 24 heures';

  @override
  String get editRestaurantName => 'Modifier le nom du restaurant';

  @override
  String get editRestaurantNameDesc =>
      'Mettez à jour votre identité commerciale publique. Ce nom apparaîtra sur les reçus et l\'application client.';

  @override
  String get egRestaurantName => 'ex. La Fourchette d\'Or';

  @override
  String get needHelp => 'Besoin d\'aide ?';

  @override
  String get changingNameHelp =>
      'Changer fréquemment de nom peut affecter votre classement de recherche dans les applications de livraison.';

  @override
  String get addStaff => 'Ajouter';

  @override
  String get roleManager => 'Gérant';

  @override
  String activeMembersCount(String count) {
    return '$count membres actifs';
  }

  @override
  String get activeCaps => 'ACTIF';

  @override
  String get inactiveCaps => 'INACTIF';
}
