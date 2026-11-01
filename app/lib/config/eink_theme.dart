import 'package:flutter/material.dart';

const eInkPaper = Color(0xFFFFFFFF);
const eInkInk = Color(0xFF000000);
const eInkMuted = Color(0xFF4A4A4A);

/// A deliberately monochrome Material theme for electrophoretic displays.
///
/// E-ink panels render grey transitions as extra full/partial refreshes, so this
/// theme avoids shadows, ripples, translucent surfaces and colour-only state.
ThemeData getEInkTheme() {
  const border = BorderSide(color: eInkInk, width: 1.4);
  const roundedBorder = RoundedRectangleBorder(
    side: border,
    borderRadius: BorderRadius.all(Radius.circular(4)),
  );
  const colorScheme = ColorScheme.light(
    primary: eInkInk,
    onPrimary: eInkPaper,
    primaryContainer: eInkInk,
    onPrimaryContainer: eInkPaper,
    secondary: eInkInk,
    onSecondary: eInkPaper,
    secondaryContainer: eInkPaper,
    onSecondaryContainer: eInkInk,
    tertiary: eInkInk,
    onTertiary: eInkPaper,
    error: eInkInk,
    onError: eInkPaper,
    surface: eInkPaper,
    onSurface: eInkInk,
    onSurfaceVariant: eInkMuted,
    outline: eInkInk,
    outlineVariant: eInkMuted,
    shadow: eInkInk,
    scrim: eInkInk,
    inverseSurface: eInkInk,
    onInverseSurface: eInkPaper,
    inversePrimary: eInkPaper,
    surfaceTint: Colors.transparent,
  );

  ButtonStyle textButtonStyle() {
    return TextButton.styleFrom(
      foregroundColor: eInkInk,
      minimumSize: const Size(48, 48),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      tapTargetSize: MaterialTapTargetSize.padded,
      shape: roundedBorder,
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
    );
  }

  return ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: colorScheme,
    scaffoldBackgroundColor: eInkPaper,
    canvasColor: eInkPaper,
    cardColor: eInkPaper,
    dividerColor: eInkInk,
    disabledColor: eInkMuted,
    splashFactory: NoSplash.splashFactory,
    highlightColor: Colors.transparent,
    hoverColor: Colors.transparent,
    focusColor: eInkInk.withValues(alpha: 0.12),
    visualDensity: const VisualDensity(horizontal: 0, vertical: 1),
    materialTapTargetSize: MaterialTapTargetSize.padded,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: _NoPageTransitionsBuilder(),
        TargetPlatform.iOS: _NoPageTransitionsBuilder(),
        TargetPlatform.linux: _NoPageTransitionsBuilder(),
        TargetPlatform.macOS: _NoPageTransitionsBuilder(),
        TargetPlatform.windows: _NoPageTransitionsBuilder(),
      },
    ),
    textTheme: const TextTheme(
      displaySmall: TextStyle(
        fontSize: 40,
        height: 1.15,
        fontWeight: FontWeight.w700,
        color: eInkInk,
      ),
      headlineMedium: TextStyle(
        fontSize: 30,
        height: 1.2,
        fontWeight: FontWeight.w700,
        color: eInkInk,
      ),
      headlineSmall: TextStyle(
        fontSize: 26,
        height: 1.2,
        fontWeight: FontWeight.w700,
        color: eInkInk,
      ),
      titleLarge: TextStyle(
        fontSize: 24,
        height: 1.3,
        fontWeight: FontWeight.w700,
        color: eInkInk,
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        height: 1.35,
        fontWeight: FontWeight.w600,
        color: eInkInk,
      ),
      titleSmall: TextStyle(
        fontSize: 17,
        height: 1.35,
        fontWeight: FontWeight.w600,
        color: eInkInk,
      ),
      bodyLarge: TextStyle(fontSize: 18, height: 1.45, color: eInkInk),
      bodyMedium: TextStyle(fontSize: 16, height: 1.45, color: eInkInk),
      bodySmall: TextStyle(fontSize: 14, height: 1.4, color: eInkMuted),
      labelLarge: TextStyle(
        fontSize: 17,
        height: 1.3,
        fontWeight: FontWeight.w600,
        color: eInkInk,
      ),
      labelMedium: TextStyle(
        fontSize: 15,
        height: 1.3,
        fontWeight: FontWeight.w600,
        color: eInkInk,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: eInkPaper,
      foregroundColor: eInkInk,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: eInkInk,
      ),
      shape: Border(bottom: border),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: eInkPaper,
      surfaceTintColor: Colors.transparent,
      indicatorColor: eInkInk,
      elevation: 0,
      height: 76,
      labelTextStyle: WidgetStateProperty.resolveWith(
        (states) => TextStyle(
          color: states.contains(WidgetState.selected) ? eInkInk : eInkMuted,
          fontSize: 14,
          fontWeight: states.contains(WidgetState.selected) ? FontWeight.w700 : FontWeight.w500,
        ),
      ),
      iconTheme: WidgetStateProperty.resolveWith(
        (states) => IconThemeData(
          color: states.contains(WidgetState.selected) ? eInkPaper : eInkInk,
          size: 28,
        ),
      ),
    ),
    navigationRailTheme: const NavigationRailThemeData(
      backgroundColor: eInkPaper,
      indicatorColor: eInkInk,
      selectedIconTheme: IconThemeData(color: eInkPaper, size: 28),
      unselectedIconTheme: IconThemeData(color: eInkInk, size: 28),
      selectedLabelTextStyle: TextStyle(
        color: eInkInk,
        fontSize: 16,
        fontWeight: FontWeight.w700,
      ),
      unselectedLabelTextStyle: TextStyle(
        color: eInkMuted,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      useIndicator: true,
    ),
    cardTheme: const CardThemeData(
      color: eInkPaper,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      shadowColor: Colors.transparent,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        side: border,
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
    ),
    dialogTheme: const DialogThemeData(
      backgroundColor: eInkPaper,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        side: border,
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: eInkPaper,
      surfaceTintColor: Colors.transparent,
      modalBackgroundColor: eInkPaper,
      elevation: 0,
      modalElevation: 0,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: eInkInk, width: 1.4),
        borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
      ),
    ),
    popupMenuTheme: const PopupMenuThemeData(
      color: eInkPaper,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        side: border,
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      filled: false,
      border: OutlineInputBorder(
        borderSide: border,
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: border,
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: eInkInk, width: 2.4),
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: eInkInk,
        foregroundColor: eInkPaper,
        disabledBackgroundColor: eInkPaper,
        disabledForegroundColor: eInkMuted,
        elevation: 0,
        minimumSize: const Size(52, 52),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        tapTargetSize: MaterialTapTargetSize.padded,
        shape: roundedBorder,
        textStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: eInkInk,
        foregroundColor: eInkPaper,
        elevation: 0,
        minimumSize: const Size(52, 52),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        shape: roundedBorder,
        textStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: eInkInk,
        minimumSize: const Size(52, 52),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        side: border,
        shape: roundedBorder,
        textStyle: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
      ),
    ),
    textButtonTheme: TextButtonThemeData(style: textButtonStyle()),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        foregroundColor: eInkInk,
        minimumSize: const Size(52, 52),
        shape: roundedBorder,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: eInkInk,
      foregroundColor: eInkPaper,
      elevation: 0,
      focusElevation: 0,
      hoverElevation: 0,
      highlightElevation: 0,
      shape: RoundedRectangleBorder(
        side: border,
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.selected) ? eInkPaper : eInkPaper,
      ),
      trackColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.selected) ? eInkInk : eInkPaper,
      ),
      trackOutlineColor: const WidgetStatePropertyAll(eInkInk),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.selected) ? eInkInk : eInkPaper,
      ),
      checkColor: const WidgetStatePropertyAll(eInkPaper),
      side: border,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith(
        (states) => states.contains(WidgetState.selected) ? eInkInk : eInkMuted,
      ),
    ),
    dividerTheme: const DividerThemeData(
      color: eInkInk,
      thickness: 1,
      space: 1,
    ),
    listTileTheme: const ListTileThemeData(
      iconColor: eInkInk,
      textColor: eInkInk,
      minVerticalPadding: 14,
      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: eInkInk, width: 1.4),
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
    ),
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: eInkInk,
      linearTrackColor: eInkPaper,
      circularTrackColor: eInkPaper,
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: eInkInk,
      contentTextStyle: TextStyle(color: eInkPaper, fontSize: 16),
      shape: RoundedRectangleBorder(
        side: border,
        borderRadius: BorderRadius.all(Radius.circular(4)),
      ),
      behavior: SnackBarBehavior.floating,
    ),
    tooltipTheme: const TooltipThemeData(
      decoration: BoxDecoration(
        color: eInkInk,
        border: Border.fromBorderSide(border),
      ),
      textStyle: TextStyle(color: eInkPaper, fontSize: 15),
      waitDuration: Duration(milliseconds: 500),
    ),
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: eInkInk,
      selectionColor: Color(0xFFBDBDBD),
      selectionHandleColor: eInkInk,
    ),
  );
}

class _NoPageTransitionsBuilder extends PageTransitionsBuilder {
  const _NoPageTransitionsBuilder();

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child;
  }
}
