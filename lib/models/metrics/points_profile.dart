import 'package:cashback_feat/models/metrics/level_profile.dart';
import 'package:cashback_feat/models/metrics/score_profile.dart';

class PointsProfile {
  PointsProfile({
    required this.totalPoints,
    required this.levelProfile,
    required this.weekly,
    required this.monthly,
    required this.quarterly,
  }) : assert(totalPoints >= 0);

  final int totalPoints;
  final LevelProfile levelProfile;

  final WeeklyScoreProfile weekly;
  final MonthlyScoreProfile monthly;
  final QuarterlyScoreProfile quarterly;
}
