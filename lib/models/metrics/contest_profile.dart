import 'package:cashback_feat/l10n/cashback_localizations.dart';

enum ContestProfile {
  weekly(1000, 500),
  monthly(3000, 1000),
  quarterly(10000, 3000);

  final int threshold;
  final int reward;
  const ContestProfile(this.threshold, this.reward);

  String contestName(CashbackLocalizations l10n) => switch (this) {
    weekly => l10n.weeklyContest,
    monthly => l10n.monthlyContest,
    quarterly => l10n.quarterlyContest,
  };

  String periodName(CashbackLocalizations l10n) => switch (this) {
    weekly => l10n.weekly,
    monthly => l10n.monthly,
    quarterly => l10n.quarterly,
  };
}
