import 'package:cashback_feat/models/history/points_history.dart';
import 'package:cashback_feat/models/history/rewards_history.dart';

class HistoryRecord {
  final PointsHistory points;
  final RewardsHistory rewards;

  HistoryRecord({required this.points, required this.rewards});
}
