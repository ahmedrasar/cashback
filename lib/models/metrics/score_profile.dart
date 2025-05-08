import 'package:cashback_feat/models/metrics/contest_profile.dart';

abstract class ScoreProfile {
  ScoreProfile({
    required this.points,
    required this.contestProfile,
    this.rank,
    this.topRankDelta,
  }) : assert(
         points >= 0 &&
             ((rank == null && topRankDelta == null) ||
                 (rank != null &&
                     rank >= 1 &&
                     topRankDelta != null &&
                     topRankDelta >= 0)),
       );

  final int points;
  final ContestProfile contestProfile;
  final int? rank;
  final int? topRankDelta;

  double get percent => (points / contestProfile.threshold).clamp(0.0, 1.0);
  bool get isRanked => rank != null;
}

class WeeklyScoreProfile extends ScoreProfile {
  WeeklyScoreProfile({required super.points, super.rank, super.topRankDelta})
    : super(contestProfile: ContestProfile.weekly);
}

class MonthlyScoreProfile extends ScoreProfile {
  MonthlyScoreProfile({required super.points, super.rank, super.topRankDelta})
    : super(contestProfile: ContestProfile.monthly);
}

class QuarterlyScoreProfile extends ScoreProfile {
  QuarterlyScoreProfile({required super.points, super.rank, super.topRankDelta})
    : super(contestProfile: ContestProfile.quarterly);
}
