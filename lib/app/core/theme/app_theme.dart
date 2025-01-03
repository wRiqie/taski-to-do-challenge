import 'package:flutter/material.dart';
import 'package:taski_to_do_challenge/app/core/theme/color_scheme.dart';

final appTheme = ThemeData(
  fontFamily: 'Urbanist',
  colorScheme: colorScheme,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    unselectedItemColor: colorScheme.onSurface.withOpacity(.4),
    unselectedLabelStyle:
        TextStyle(color: colorScheme.onSurface.withOpacity(.4)),
    selectedItemColor: colorScheme.primary,
    showUnselectedLabels: true,
    showSelectedLabels: true,
    type: BottomNavigationBarType.fixed,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      elevation: const WidgetStatePropertyAll(0),
      backgroundColor: WidgetStatePropertyAll(
        colorScheme.primary.withOpacity(.1),
      ),
      textStyle: const WidgetStatePropertyAll(
        TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  ),
);
