import 'package:flutter/material.dart';
import 'package:localsend_app/config/theme.dart';
import 'package:localsend_app/util/native/platform_check.dart';
import 'package:localsend_app/widget/responsive_builder.dart';

class BigButton extends StatelessWidget {
  static const double desktopWidth = 100.0;
  static const double mobileWidth = 90.0;

  final IconData icon;
  final String label;
  final bool filled;
  final double? width;
  final VoidCallback onTap;

  const BigButton({
    required this.icon,
    required this.label,
    required this.filled,
    this.width,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final sizingInformation = SizingInformation(
      MediaQuery.sizeOf(context).width,
    );
    final eInk = checkPlatform([TargetPlatform.android]);
    final buttonWidth = width ?? (eInk ? 132.0 : (sizingInformation.isDesktop ? desktopWidth : mobileWidth));
    return SizedBox(
      width: buttonWidth,
      height: eInk ? 98.0 : 65.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: filled ? colorScheme.primary : (eInk ? colorScheme.surface : colorScheme.secondaryContainerIfDark),
          foregroundColor: filled ? colorScheme.onPrimary : (eInk ? colorScheme.onSurface : colorScheme.onSecondaryContainerIfDark),
          side: eInk ? BorderSide(color: colorScheme.outline, width: 1.4) : null,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(eInk ? 4 : 10),
          ),
          padding: EdgeInsets.only(
            left: 4,
            right: 4,
            top: eInk ? 12 : 10,
            bottom: eInk ? 12 : 8,
          ),
        ),
        onPressed: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(icon, size: eInk ? 30 : 24),
            FittedBox(
              alignment: Alignment.bottomCenter,
              child: Text(
                label,
                maxLines: 1,
                style: eInk ? const TextStyle(fontSize: 16, fontWeight: FontWeight.w600) : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
