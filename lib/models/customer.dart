import 'package:cashback_feat/models/history/history_record.dart';
import 'package:cashback_feat/models/metrics/points_profile.dart';

class Customer {
  Customer({
    required this.id,
    required this.name,
    required this.pointsProfile,
    required this.historyRecord,
  });

  final String id;
  final String name;
  final HistoryRecord historyRecord;
  final PointsProfile pointsProfile;
}
