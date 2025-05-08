import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:cashback_feat/l10n/cashback_localizations.dart';
import 'package:cashback_feat/models/customer.dart';
import 'package:cashback_feat/models/metrics/metrics.dart';
import 'package:cashback_feat/models/history/history.dart';
import 'package:cashback_feat/ui/feature/cashback/cashback_screen.dart';
import 'themes/themes.dart';

final customer = Customer(
  id: "12345",
  name: 'احمد محمد',
  pointsProfile: PointsProfile(
    totalPoints: 247345,
    weekly: WeeklyScoreProfile(points: 600),
    monthly: MonthlyScoreProfile(points: 2300, rank: 454, topRankDelta: 4000),
    quarterly: QuarterlyScoreProfile(points: 6332),
    levelProfile: LevelProfile.l3,
  ),
  historyRecord: HistoryRecord(
    points: PointsHistory([
      PointsHistoryTuple(requestId: "28472414719841", redeemedPoints: 200),
      PointsHistoryTuple(requestId: "55472414719822", redeemedPoints: 246),
      PointsHistoryTuple(requestId: "28472414229841", redeemedPoints: 210),
      PointsHistoryTuple(requestId: "28422414719841", redeemedPoints: 400),
      PointsHistoryTuple(requestId: "66472414719841", redeemedPoints: 50),
      PointsHistoryTuple(requestId: "28322414719841", redeemedPoints: 550),
    ]),
    rewards: RewardsHistory([
      // RewardsHistoryTuple(date: DateTime(2025, 1, 1), earnedAmount: 400),
      // RewardsHistoryTuple(date: DateTime(2025, 3, 1), earnedAmount: 70),
      // RewardsHistoryTuple(date: DateTime(2025, 1, 14), earnedAmount: 500),
      // RewardsHistoryTuple(date: DateTime(2025, 2, 2), earnedAmount: 200),
      // RewardsHistoryTuple(date: DateTime(2025, 3, 5), earnedAmount: 130),
    ]),
  ),
);

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [Provider<Customer>(create: (_) => customer)],
      child: MaterialApp(
        theme: lightTheme,
        darkTheme: darktheme,
        themeMode: ThemeMode.dark, // Comment/Uncomment to toggle
        supportedLocales: [Locale('en'), Locale('ar')],
        // locale: Locale('ar'), // Comment/Uncomment to toggle
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          CashbackLocalizations.delegate,
        ],
        home: Scaffold(body: CashbackScreen(popUpCallback: () {})),
      ),
    );
  }
}
