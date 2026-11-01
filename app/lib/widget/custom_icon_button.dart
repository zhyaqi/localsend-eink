import 'package:flutter/material.dart';
import 'package:localsend_app/util/native/platform_check.dart';

class CustomIconButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget child;

  const CustomIconButton({
    required this.onPressed,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final eInk = checkPlatform([TargetPlatform.android]);
    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Theme.of(context).colorScheme.onSurface,
        iconSize: eInk ? 28 : 24,
        tapTargetSize: eInk
            ? MaterialTapTargetSize.padded
            : MaterialTapTargetSize.shrinkWrap,
        minimumSize: eInk ? const Size(52, 52) : Size.zero,
        shape: eInk
            ? const RoundedRectangleBorder(
                side: BorderSide(width: 1.4),
                borderRadius: BorderRadius.all(Radius.circular(4)),
              )
            : const CircleBorder(),
        padding: eInk
            ? const EdgeInsets.all(12)
            : (checkPlatformIsDesktop()
                  ? const EdgeInsets.symmetric(horizontal: 8, vertical: 16)
                  : const EdgeInsets.all(8)),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
