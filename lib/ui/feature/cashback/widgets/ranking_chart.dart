import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:intl/intl.dart' show NumberFormat;
import 'package:cashback_feat/l10n/cashback_localizations.dart';
import 'package:cashback_feat/models/metrics/score_profile.dart';

class RankingChart extends StatelessWidget {
  const RankingChart({super.key, required this.scoreProfile});

  final ScoreProfile scoreProfile;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = CashbackLocalizations.of(context);

    return DefaultTextStyle(
      style: theme.textTheme.bodySmall!,
      child: IntrinsicWidth(
        child:
            scoreProfile.isRanked
                ? Row(
                  spacing: 5,
                  children: [
                    _buildRankedCircle(l10n),
                    Column(
                      children: [
                        Text(scoreProfile.contestProfile.contestName(l10n)),
                        _buildRankedStatus(theme, l10n),
                      ],
                    ),
                  ],
                )
                : Row(
                  spacing: 5,
                  children: [
                    _buildLockedPieChart(),
                    Column(
                      children: [
                        Text(scoreProfile.contestProfile.contestName(l10n)),
                        _buildLockedStatus(
                          l10n,
                          DefaultTextStyle.of(context).style,
                        ),
                      ],
                    ),
                  ],
                ),
      ),
    );
  }

  Widget _buildLockedPieChart() {
    return CircularPercentIndicator(
      radius: 30,
      lineWidth: 6.0,
      percent: scoreProfile.percent,
      backgroundColor: Colors.grey,
      progressColor: Colors.orange,
      circularStrokeCap: CircularStrokeCap.round,
      center: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.lock_open_rounded, color: Colors.grey, size: 20),
          Text(
            NumberFormat.percentPattern().format(scoreProfile.percent),
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  Widget _buildRankedCircle(CashbackLocalizations l10n) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.orange,
        border: Border.all(width: 6, color: Colors.orange.shade200),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(l10n.rank, style: TextStyle(color: Colors.white, fontSize: 14)),
          Text(
            scoreProfile.rank!.toString(),
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }

  Widget _buildRankedStatus(ThemeData theme, CashbackLocalizations l10n) {
    return Text.rich(
      TextSpan(
        text:
            "${NumberFormat().format(scoreProfile.topRankDelta!)} ${l10n.point}\n",
        style: theme.textTheme.bodySmall!.copyWith(
          color: Colors.orange.shade500,
        ),
        children: [
          TextSpan(
            text: l10n.toFirstRank,
            style: theme.textTheme.bodySmall!.copyWith(
              color: theme.textTheme.bodySmall!.color!.withAlpha(200),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLockedStatus(CashbackLocalizations l10n, TextStyle textStyle) {
    return Text.rich(
      TextSpan(
        text: NumberFormat().format(scoreProfile.points),
        style: TextStyle(color: Colors.orange),
        children: [
          TextSpan(
            text:
                '/${NumberFormat().format(scoreProfile.contestProfile.threshold)} ${l10n.point}',
            style: TextStyle(color: textStyle.color!.withAlpha(200)),
          ),
        ],
      ),
    );
  }
}
