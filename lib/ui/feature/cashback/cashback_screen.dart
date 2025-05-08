import 'package:cashback_feat/constants/constans.dart';
import 'package:cashback_feat/l10n/cashback_localizations.dart';
import 'package:cashback_feat/models/metrics/metrics.dart';
import 'package:cashback_feat/models/customer.dart';
import 'package:cashback_feat/ui/feature/cashback/widgets/how_to_alert.dart';
import 'package:cashback_feat/ui/feature/cashback/widgets/customer_info_app_bar.dart';
import 'package:cashback_feat/ui/feature/cashback/widgets/ranking_chart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart' show NumberFormat;

class CashbackScreen extends StatefulWidget {
  const CashbackScreen({super.key, required this.popUpCallback});

  /// Callback function to be executed when the back button is pressed.
  /// Should handle the navigation logic.
  final void Function() popUpCallback;

  @override
  State<CashbackScreen> createState() => _CashbackScreenState();
}

class _CashbackScreenState extends State<CashbackScreen> {
  late CashbackLocalizations l10n;
  late ThemeData theme;
  late Customer customer;
  ContestProfile selectedContest = ContestProfile.weekly;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    l10n = CashbackLocalizations.of(context);
    theme = Theme.of(context);
    customer = context.read<Customer>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomerInfoAppBar(popUpCallback: widget.popUpCallback),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildHowToButton(
                    text: l10n.howToCollect,
                    svgAssetPath: ConstantPaths.handWithCoinsSvg,
                    onPressed: _showHowToCollectAlert,
                  ),
                  _buildHowToButton(
                    text: l10n.howToWin,
                    svgAssetPath: ConstantPaths.trophySvg,
                    onPressed: _showHowToWinAlert,
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                spacing: 10,
                children: [
                  _buildDivider(),
                  Row(
                    spacing: 10,
                    children: [
                      SvgPicture.asset(ConstantPaths.medalSvg),
                      Flexible(child: Text(l10n.collectMoreLabel)),
                    ],
                  ),
                  SizedBox(height: 5),
                  _buildRankingCharts(),
                  _buildDivider(),
                  _buildContestTable(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRankingCharts() {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      alignment: WrapAlignment.spaceEvenly,
      children: [
        RankingChart(scoreProfile: customer.pointsProfile.weekly),
        RankingChart(scoreProfile: customer.pointsProfile.monthly),
        RankingChart(scoreProfile: customer.pointsProfile.quarterly),
      ],
    );
  }

  Widget _buildContestTable() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              spacing: 10,
              children: [
                SvgPicture.asset(ConstantPaths.trophySvg),
                Text(l10n.rewardsTableLabel),
              ],
            ),
            Row(
              spacing: 10,
              children: [
                SvgPicture.asset(ConstantPaths.currencySvg),
                Text(
                  '${l10n.win} ${NumberFormat().format(selectedContest.reward)} ${l10n.currencyCode}',
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: ConstantColors.secondaryColor,
                  ),
                ),
              ],
            ),
          ],
        ),
        Text(l10n.competeToWinLabel),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            spacing: 5,
            children:
                _buttonsLabels.asMap().entries.map((entry) {
                  final isSelected = entry.key == selectedContest.index;
                  return OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: DefaultTextStyle.of(context).style.color,
                      backgroundColor: isSelected ? Colors.orange : null,
                    ),
                    onPressed:
                        () => setState(() {
                          selectedContest = ContestProfile.values[entry.key];
                        }),
                    child: Text(entry.value),
                  );
                }).toList(),
          ),
        ),
        IndexedStack(
          index: selectedContest.index,
          children: [
            _buildTable(customer.pointsProfile.weekly),
            _buildTable(customer.pointsProfile.monthly),
            _buildTable(customer.pointsProfile.quarterly),
          ],
        ),
      ],
    );
  }

  List<String> get _buttonsLabels => [
    l10n.weekly,
    l10n.monthly,
    l10n.quarterly,
  ];

  OutlinedButton _buildHowToButton({
    required String text,
    required String svgAssetPath,
    required void Function() onPressed,
  }) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        padding: EdgeInsets.symmetric(horizontal: 10),
      ),
      child: Row(
        spacing: 10,
        children: [
          SvgPicture.asset(svgAssetPath, width: 20),
          Text(text, style: theme.textTheme.bodySmall),
        ],
      ),
    );
  }

  Widget _buildDivider() => const Divider(thickness: 3, color: Colors.grey);

  void _showHowToCollectAlert() async {
    await showDialog(
      context: context,
      builder:
          (context) => CashbackAlert(
            title: l10n.howToCollect,
            subtitle: l10n.howToCollectSubtitle,
            icon: SvgPicture.asset(ConstantPaths.handWithCoinsSvg, width: 100),
            tips: [
              (
                widget: SvgPicture.asset(ConstantPaths.cartSvg),
                title: l10n.howToCollectS1Label,
                subtitle: l10n.howToCollectS1Body,
              ),
              (
                widget: SvgPicture.asset(ConstantPaths.doubleArrowUpSvg),
                title: l10n.howToCollectS2Label,
                subtitle: l10n.howToCollectS2Body,
              ),
              (
                widget: SvgPicture.asset(ConstantPaths.smilyStarSvg),
                title: l10n.howToCollectS3Label,
                subtitle: l10n.howToCollectS3Body,
              ),
              (
                widget: SvgPicture.asset(ConstantPaths.calenderSvg),
                title: l10n.howToCollectS4Label,
                subtitle: l10n.howToCollectS4Body,
              ),
            ],
            footer: l10n.collectMoreLabel,
            buttonLabel: l10n.startCollectingTody,
          ),
    );
  }

  void _showHowToWinAlert() async {
    await showDialog(
      context: context,
      builder:
          (context) => CashbackAlert(
            title: l10n.howToWin,
            subtitle: l10n.howToWinSubtitle,
            icon: SvgPicture.asset(ConstantPaths.trophySvg, width: 100),
            tips: [
              (
                widget: Icon(
                  Icons.auto_awesome_outlined,
                  color: ConstantColors.primaryColor,
                  size: 36,
                ),
                title: l10n.howToWinS1Label,
                subtitle: l10n.howToWinS1Body,
              ),
              (
                widget: SvgPicture.asset(ConstantPaths.chartSvg),
                title: l10n.howToWinS2Label,
                subtitle: l10n.howToWinS2Body,
              ),
              (
                widget: SvgPicture.asset(ConstantPaths.upChartSvg),
                title: l10n.howToWinS3Label,
                subtitle: l10n.howToWinS3Body,
              ),
              (
                widget: SvgPicture.asset(ConstantPaths.trophyOutlinedSvg),
                title: l10n.howToWinS4Label,
                subtitle: l10n.howToWinS4Body,
              ),
            ],
            footer: l10n.collectMoreLabel,
            buttonLabel: l10n.pushToTheTop,
          ),
    );
  }

  Widget _buildTable(ScoreProfile tournament) {
    return Container(
      width: double.infinity,
      height: 300,
      decoration: BoxDecoration(
        color: theme.colorScheme.onInverseSurface,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 5,
        children: [
          Icon(Icons.lock_open_rounded),
          Text(
            l10n.lockedContestTableLabel(
              tournament.contestProfile.periodName(l10n),
            ),
            style: theme.textTheme.headlineSmall,
          ),
          Text(
            l10n.lockedContestTableBody(
              tournament.contestProfile.periodName(l10n).toLowerCase(),
            ),
            style: theme.textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
