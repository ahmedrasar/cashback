import 'package:cashback_feat/l10n/cashback_localizations.dart';
import 'package:cashback_feat/models/customer.dart';
import 'package:cashback_feat/ui/widgets/back_arrow_icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart' show NumberFormat, DateFormat;

class RegistryScreen extends StatelessWidget {
  const RegistryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = CashbackLocalizations.of(context);
    final historyRecord = context.read<Customer>().historyRecord;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: BackArrowIconButton(onPressed: () => Navigator.pop(context)),
          title: Text(l10n.collectedPointsRegistry),
          bottom: TabBar(
            labelPadding: EdgeInsets.symmetric(vertical: 10),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: Colors.orange,
            indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
            indicatorWeight: 3,
            dividerHeight: 1,
            dividerColor: Colors.orange.shade400,
            unselectedLabelColor: Colors.grey,
            tabs: [Text(l10n.registry), Text(l10n.rewards)],
          ),
        ),
        body: TabBarView(
          children: [
            _buildTable(
              historyRecord.points.tuples,
              theme,
              l10n,
              leading: (tuple) => l10n.completedRequest(tuple.requestId),
              trailing:
                  (tuple) =>
                      '${NumberFormat().format(tuple.redeemedPoints)} ${l10n.point}',
            ),
            _buildTable(
              historyRecord.rewards.tuples,
              theme,
              l10n,
              leading:
                  (tuple) =>
                      DateFormat.yMMMd(l10n.localeName).format(tuple.date),
              trailing:
                  (tuple) =>
                      '${NumberFormat().format(tuple.earnedAmount)} ${l10n.currencyCode}',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTable<T>(
    List<T> list,
    ThemeData theme,
    CashbackLocalizations l10n, {
    required String Function(T tuple) leading,
    required String Function(T tuple) trailing,
  }) {
    return list.isEmpty
        ? _buildEmptyTab(theme, l10n)
        : ListView.builder(
          itemCount: list.length,
          itemBuilder:
              (context, index) => ListTile(
                minTileHeight: 30,
                leading: Text(leading(list[index])),
                trailing: Text(
                  trailing(list[index]),
                  style: TextStyle(color: Colors.orange),
                ),
              ),
        );
  }

  Widget _buildEmptyTab(ThemeData theme, CashbackLocalizations l10n) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 20,
      children: [
        Text(l10n.noItemsFound, style: theme.textTheme.displaySmall),
        Text(l10n.noItemsFoundBody, style: theme.textTheme.bodyLarge),
      ],
    );
  }
}
