import 'package:cashback_feat/constants/constans.dart';
import 'package:cashback_feat/l10n/cashback_localizations.dart';
import 'package:cashback_feat/models/customer.dart';
import 'package:cashback_feat/ui/feature/cashback/registry_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart' show NumberFormat;

class CustomerInfoAppBar extends StatelessWidget {
  const CustomerInfoAppBar({super.key, required this.popUpCallback});
  final Function() popUpCallback;

  @override
  Widget build(BuildContext context) {
    final l10n = CashbackLocalizations.of(context);
    final customer = context.read<Customer>();
    // Overwrite the default text color to contrast with the background.
    final textTheme = Theme.of(
      context,
    ).textTheme.apply(bodyColor: Colors.white, displayColor: Colors.white);

    const borderRadius = BorderRadius.only(
      bottomLeft: Radius.circular(15),
      bottomRight: Radius.circular(15),
    );

    return SliverAppBar(
      pinned: true,
      title: Text(l10n.points, style: textTheme.titleLarge),
      // Simulates a fade-in effect with the background image when the app bar is collapsing.
      backgroundColor: Colors.black,
      leading: IconButton(
        onPressed: popUpCallback,
        padding: EdgeInsetsDirectional.only(start: 28),
        icon: Icon(Icons.arrow_back_ios, size: 36, color: Colors.blue),
      ),
      expandedHeight: 300,
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          decoration: const BoxDecoration(
            borderRadius: borderRadius,
            image: DecorationImage(
              image: AssetImage(ConstantPaths.backgourndSkydustImg),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 25,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildPointsHeader(customer, l10n, textTheme),
                  _buildLevelHeader(customer, l10n, textTheme),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCustomerHeader(customer, textTheme),
                  _buildRegistryHeader(context, l10n, textTheme),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextButton _buildRegistryHeader(
    BuildContext context,
    CashbackLocalizations l10n,
    TextTheme textTheme,
  ) {
    return TextButton(
      style: TextButton.styleFrom(padding: EdgeInsets.zero),
      onPressed:
          () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RegistryScreen()),
          ),

      child: Row(
        spacing: 5,
        children: [
          Text(l10n.registry, style: textTheme.bodyLarge),
          Icon(Icons.arrow_forward_ios, size: 20, color: Colors.white),
        ],
      ),
    );
  }

  Column _buildCustomerHeader(Customer customer, TextTheme textTheme) {
    return Column(
      children: [
        Text(customer.name, style: textTheme.titleMedium),
        Text(
          'ID: ${customer.id}',
          textDirection: TextDirection.ltr,
          style: textTheme.titleMedium,
        ),
      ],
    );
  }

  Column _buildLevelHeader(
    Customer customer,
    CashbackLocalizations l10n,
    TextTheme textTheme,
  ) {
    return Column(
      spacing: 5,
      children: [
        Text(
          '${l10n.level} ${customer.pointsProfile.levelProfile.level}',
          style: textTheme.bodyLarge?.copyWith(
            color: ConstantColors.primaryColor,
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: ColoredBox(
            color: ConstantColors.primaryColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text('${l10n.point}x', style: textTheme.bodyLarge),
                  Text(
                    customer.pointsProfile.levelProfile.pointsMultiplier
                        .toStringAsPrecision(2),
                    style: textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Column _buildPointsHeader(
    Customer customer,
    CashbackLocalizations l10n,
    TextTheme textTheme,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5,
      children: [
        Text(
          l10n.totalCollectedPoints,
          style: textTheme.titleMedium?.copyWith(fontSize: 16),
        ),
        Row(
          spacing: 5,
          children: [
            Text(
              NumberFormat().format(customer.pointsProfile.totalPoints),
              textAlign: TextAlign.start,
              style: TextStyle(
                color: ConstantColors.primaryColor,
                fontSize: 20,
              ),
            ),
            Icon(Icons.star, size: 28, color: ConstantColors.primaryColor),
          ],
        ),
      ],
    );
  }
}
