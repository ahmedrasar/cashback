// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'cashback_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class CashbackLocalizationsEn extends CashbackLocalizations {
  CashbackLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get points => 'Points';

  @override
  String get totalCollectedPoints => 'Total Collected Points';

  @override
  String get level => 'Level';

  @override
  String get point => 'Point';

  @override
  String get registry => 'Registry';

  @override
  String get howToCollect => 'How to collect?';

  @override
  String get howToWin => 'How to win?';

  @override
  String get collectMoreLabel => 'Collect more points to join prize contests!';

  @override
  String get weeklyContest => 'Weekly Contest';

  @override
  String get monthlyContest => 'Monthly Contest';

  @override
  String get quarterlyContest => 'Quarterly Contest';

  @override
  String get rank => 'Rank';

  @override
  String get toFirstRank => 'To First Rank';

  @override
  String get rewardsTableLabel => 'Leaderboard for Prizes';

  @override
  String get competeToWinLabel => 'Compete to reach the top before each contest ends to win the prize';

  @override
  String get win => 'Win';

  @override
  String get weekly => 'Weekly';

  @override
  String get monthly => 'Monthly';

  @override
  String get quarterly => 'Quarterly';

  @override
  String lockedContestTableLabel(String period) {
    return 'Earn Your $period Points';
  }

  @override
  String lockedContestTableBody(String period) {
    return 'Start competing for the $period prize';
  }

  @override
  String get howToCollectSubtitle => 'Win prizes with every point!';

  @override
  String get howToCollectS1Label => 'Collect points with every order';

  @override
  String get howToCollectS1Body => 'Every 1 EGP in your completed order gives you one point closer to winning amazing prizes';

  @override
  String get howToCollectS2Label => 'Level up to earn bonus points';

  @override
  String get howToCollectS2Body => 'The higher your level, the more points you earn';

  @override
  String get howToCollectS3Label => 'Look for special offers';

  @override
  String get howToCollectS3Body => 'Discover offers that boost your points even more';

  @override
  String get howToCollectS4Label => 'Don\'t miss special events';

  @override
  String get howToCollectS4Body => 'Watch out for special events where you can multiply your points';

  @override
  String get theMoreYouCollectLabel => 'The more points you collect, the more rewards you get!';

  @override
  String get startCollectingTody => 'Start Collecting Today';

  @override
  String get howToWinSubtitle => 'Join and rise to the top!';

  @override
  String get howToWinS1Label => 'Automatic enrollment';

  @override
  String get howToWinS1Body => 'Get the required points and you\'ll be in the contest';

  @override
  String get howToWinS2Label => 'Compete to be first';

  @override
  String get howToWinS2Body => 'Compete with other pharmacies for first place and the grand prize';

  @override
  String get howToWinS3Label => 'Track your progress';

  @override
  String get howToWinS3Body => 'The leaderboard keeps you updated on your rank and progress';

  @override
  String get howToWinS4Label => 'Win and claim your prize';

  @override
  String get howToWinS4Body => 'At the end of each contest, the winner is announced. If it\'s you, a special window will guide you to claim your prize';

  @override
  String get pushToTheTop => 'Keep Pushing to The Top';

  @override
  String get collectedPointsRegistry => 'Collected Points Registry';

  @override
  String get rewards => 'Prizes';

  @override
  String get noItemsFound => 'No Items Found';

  @override
  String get noItemsFoundBody => 'This list is currently empty';

  @override
  String completedRequest(String id) {
    return 'Request #$id completed successfully';
  }

  @override
  String get currencyCode => 'EGP';
}
