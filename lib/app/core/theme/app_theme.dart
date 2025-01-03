import 'package:flutter/material.dart';

part 'color_scheme.dart';

final appTheme = ThemeData(
  fontFamily: 'Urbanist',
  colorScheme: _colorScheme,
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    unselectedItemColor: _colorScheme.onSurface.withOpacity(.4),
    unselectedLabelStyle:
        TextStyle(color: _colorScheme.onSurface.withOpacity(.4)),
    selectedItemColor: _colorScheme.primary,
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
        _colorScheme.primary.withOpacity(.1),
      ),
      textStyle: const WidgetStatePropertyAll(
        TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  ),
  textButtonTheme: const TextButtonThemeData(
    style: ButtonStyle(
      textStyle: WidgetStatePropertyAll(
        TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: InputBorder.none,
  ),
);
