import 'dart:math' as math;

import 'package:cashback_feat/constants/constans.dart';
import 'package:cashback_feat/l10n/cashback_localizations.dart';
import 'package:flutter/material.dart';

class CashbackAlert extends StatelessWidget {
  const CashbackAlert({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.tips,
    required this.footer,
    required this.buttonLabel,
  });
  final String title;
  final String subtitle;
  final Widget icon;
  final List<({Widget widget, String title, String subtitle})> tips;
  final String footer;
  final String buttonLabel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = CashbackLocalizations.of(context);

    return AlertDialog(
      insetPadding: EdgeInsets.zero,
      title: Text(
        '$title\n$subtitle',
        style: theme.textTheme.titleSmall!.copyWith(color: Colors.orange),
      ),
      content: SizedBox(
        width: 300,
        height: 350,
        child: Stack(
          children: [
            _buildTips(theme, l10n),
            Align(
              alignment: AlignmentDirectional(1.1, -1.45),
              child: Transform.flip(
                flipX: Directionality.of(context) == TextDirection.ltr,
                child: Transform.rotate(angle: -math.pi / 10, child: icon),
              ),
              // child: Transform.rotate(angle: math.pi / 8, child: icon),
            ),
            Align(
              alignment: Alignment(0, 1),
              child: Text(footer, textAlign: TextAlign.center),
            ),
          ],
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        FilledButton(
          style: FilledButton.styleFrom(
            backgroundColor: ConstantColors.primaryColor,
            fixedSize: Size(300, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: () => Navigator.pop(context),
          child: Text(
            buttonLabel,
            style: theme.textTheme.titleMedium!.copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildTips(ThemeData theme, CashbackLocalizations l10n) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 25),
      child: Column(
        spacing: 10,
        children: List<Widget>.generate(
          tips.length,
          (index) => Row(
            spacing: 10,
            children: [
              tips[index].widget,
              Flexible(
                child: Text.rich(
                  maxLines: 5,
                  style: TextStyle(fontSize: 14),
                  TextSpan(
                    text: '${tips[index].title}\n',
                    children: [
                      TextSpan(
                        text: tips[index].subtitle,
                        style: theme.textTheme.bodySmall!.copyWith(
                          color: Colors.grey.shade500,
                          fontWeight: FontWeight.w200,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          growable: false,
        ),
      ),
    );
  }
}
