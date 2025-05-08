import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'cashback_localizations_ar.dart';
import 'cashback_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of CashbackLocalizations
/// returned by `CashbackLocalizations.of(context)`.
///
/// Applications need to include `CashbackLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/cashback_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: CashbackLocalizations.localizationsDelegates,
///   supportedLocales: CashbackLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the CashbackLocalizations.supportedLocales
/// property.
abstract class CashbackLocalizations {
  CashbackLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static CashbackLocalizations of(BuildContext context) {
    return Localizations.of<CashbackLocalizations>(context, CashbackLocalizations)!;
  }

  static const LocalizationsDelegate<CashbackLocalizations> delegate = _CashbackLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en')
  ];

  /// No description provided for @points.
  ///
  /// In en, this message translates to:
  /// **'Points'**
  String get points;

  /// No description provided for @totalCollectedPoints.
  ///
  /// In en, this message translates to:
  /// **'Total Collected Points'**
  String get totalCollectedPoints;

  /// No description provided for @level.
  ///
  /// In en, this message translates to:
  /// **'Level'**
  String get level;

  /// No description provided for @point.
  ///
  /// In en, this message translates to:
  /// **'Point'**
  String get point;

  /// No description provided for @registry.
  ///
  /// In en, this message translates to:
  /// **'Registry'**
  String get registry;

  /// No description provided for @howToCollect.
  ///
  /// In en, this message translates to:
  /// **'How to collect?'**
  String get howToCollect;

  /// No description provided for @howToWin.
  ///
  /// In en, this message translates to:
  /// **'How to win?'**
  String get howToWin;

  /// No description provided for @collectMoreLabel.
  ///
  /// In en, this message translates to:
  /// **'Collect more points to join prize contests!'**
  String get collectMoreLabel;

  /// No description provided for @weeklyContest.
  ///
  /// In en, this message translates to:
  /// **'Weekly Contest'**
  String get weeklyContest;

  /// No description provided for @monthlyContest.
  ///
  /// In en, this message translates to:
  /// **'Monthly Contest'**
  String get monthlyContest;

  /// No description provided for @quarterlyContest.
  ///
  /// In en, this message translates to:
  /// **'Quarterly Contest'**
  String get quarterlyContest;

  /// No description provided for @rank.
  ///
  /// In en, this message translates to:
  /// **'Rank'**
  String get rank;

  /// No description provided for @toFirstRank.
  ///
  /// In en, this message translates to:
  /// **'To First Rank'**
  String get toFirstRank;

  /// No description provided for @rewardsTableLabel.
  ///
  /// In en, this message translates to:
  /// **'Leaderboard for Prizes'**
  String get rewardsTableLabel;

  /// No description provided for @competeToWinLabel.
  ///
  /// In en, this message translates to:
  /// **'Compete to reach the top before each contest ends to win the prize'**
  String get competeToWinLabel;

  /// No description provided for @win.
  ///
  /// In en, this message translates to:
  /// **'Win'**
  String get win;

  /// No description provided for @weekly.
  ///
  /// In en, this message translates to:
  /// **'Weekly'**
  String get weekly;

  /// No description provided for @monthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get monthly;

  /// No description provided for @quarterly.
  ///
  /// In en, this message translates to:
  /// **'Quarterly'**
  String get quarterly;

  /// No description provided for @lockedContestTableLabel.
  ///
  /// In en, this message translates to:
  /// **'Earn Your {period} Points'**
  String lockedContestTableLabel(String period);

  /// No description provided for @lockedContestTableBody.
  ///
  /// In en, this message translates to:
  /// **'Start competing for the {period} prize'**
  String lockedContestTableBody(String period);

  /// No description provided for @howToCollectSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Win prizes with every point!'**
  String get howToCollectSubtitle;

  /// No description provided for @howToCollectS1Label.
  ///
  /// In en, this message translates to:
  /// **'Collect points with every order'**
  String get howToCollectS1Label;

  /// No description provided for @howToCollectS1Body.
  ///
  /// In en, this message translates to:
  /// **'Every 1 EGP in your completed order gives you one point closer to winning amazing prizes'**
  String get howToCollectS1Body;

  /// No description provided for @howToCollectS2Label.
  ///
  /// In en, this message translates to:
  /// **'Level up to earn bonus points'**
  String get howToCollectS2Label;

  /// No description provided for @howToCollectS2Body.
  ///
  /// In en, this message translates to:
  /// **'The higher your level, the more points you earn'**
  String get howToCollectS2Body;

  /// No description provided for @howToCollectS3Label.
  ///
  /// In en, this message translates to:
  /// **'Look for special offers'**
  String get howToCollectS3Label;

  /// No description provided for @howToCollectS3Body.
  ///
  /// In en, this message translates to:
  /// **'Discover offers that boost your points even more'**
  String get howToCollectS3Body;

  /// No description provided for @howToCollectS4Label.
  ///
  /// In en, this message translates to:
  /// **'Don\'t miss special events'**
  String get howToCollectS4Label;

  /// No description provided for @howToCollectS4Body.
  ///
  /// In en, this message translates to:
  /// **'Watch out for special events where you can multiply your points'**
  String get howToCollectS4Body;

  /// No description provided for @theMoreYouCollectLabel.
  ///
  /// In en, this message translates to:
  /// **'The more points you collect, the more rewards you get!'**
  String get theMoreYouCollectLabel;

  /// No description provided for @startCollectingTody.
  ///
  /// In en, this message translates to:
  /// **'Start Collecting Today'**
  String get startCollectingTody;

  /// No description provided for @howToWinSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Join and rise to the top!'**
  String get howToWinSubtitle;

  /// No description provided for @howToWinS1Label.
  ///
  /// In en, this message translates to:
  /// **'Automatic enrollment'**
  String get howToWinS1Label;

  /// No description provided for @howToWinS1Body.
  ///
  /// In en, this message translates to:
  /// **'Get the required points and you\'ll be in the contest'**
  String get howToWinS1Body;

  /// No description provided for @howToWinS2Label.
  ///
  /// In en, this message translates to:
  /// **'Compete to be first'**
  String get howToWinS2Label;

  /// No description provided for @howToWinS2Body.
  ///
  /// In en, this message translates to:
  /// **'Compete with other pharmacies for first place and the grand prize'**
  String get howToWinS2Body;

  /// No description provided for @howToWinS3Label.
  ///
  /// In en, this message translates to:
  /// **'Track your progress'**
  String get howToWinS3Label;

  /// No description provided for @howToWinS3Body.
  ///
  /// In en, this message translates to:
  /// **'The leaderboard keeps you updated on your rank and progress'**
  String get howToWinS3Body;

  /// No description provided for @howToWinS4Label.
  ///
  /// In en, this message translates to:
  /// **'Win and claim your prize'**
  String get howToWinS4Label;

  /// No description provided for @howToWinS4Body.
  ///
  /// In en, this message translates to:
  /// **'At the end of each contest, the winner is announced. If it\'s you, a special window will guide you to claim your prize'**
  String get howToWinS4Body;

  /// No description provided for @pushToTheTop.
  ///
  /// In en, this message translates to:
  /// **'Keep Pushing to The Top'**
  String get pushToTheTop;

  /// No description provided for @collectedPointsRegistry.
  ///
  /// In en, this message translates to:
  /// **'Collected Points Registry'**
  String get collectedPointsRegistry;

  /// No description provided for @rewards.
  ///
  /// In en, this message translates to:
  /// **'Prizes'**
  String get rewards;

  /// No description provided for @noItemsFound.
  ///
  /// In en, this message translates to:
  /// **'No Items Found'**
  String get noItemsFound;

  /// No description provided for @noItemsFoundBody.
  ///
  /// In en, this message translates to:
  /// **'This list is currently empty'**
  String get noItemsFoundBody;

  /// No description provided for @completedRequest.
  ///
  /// In en, this message translates to:
  /// **'Request #{id} completed successfully'**
  String completedRequest(String id);

  /// No description provided for @currencyCode.
  ///
  /// In en, this message translates to:
  /// **'EGP'**
  String get currencyCode;
}

class _CashbackLocalizationsDelegate extends LocalizationsDelegate<CashbackLocalizations> {
  const _CashbackLocalizationsDelegate();

  @override
  Future<CashbackLocalizations> load(Locale locale) {
    return SynchronousFuture<CashbackLocalizations>(lookupCashbackLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_CashbackLocalizationsDelegate old) => false;
}

CashbackLocalizations lookupCashbackLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return CashbackLocalizationsAr();
    case 'en': return CashbackLocalizationsEn();
  }

  throw FlutterError(
    'CashbackLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
