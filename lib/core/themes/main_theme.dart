// ignore_for_file: unused_element

import 'package:flutter/material.dart';

import '../colors/color_swatch.dart';
import '../colors/colors.dart';
import '../fonts/fonts.dart';
import '../values/const/double_const.dart';

ThemeData get darkTheme {
  return ThemeData(
    brightness: Brightness.dark,
    primaryColor: _setColorPrimiaryIsThemeModeDark(true),
    appBarTheme: _appBarTheme(true),
    textTheme: _textTheme(true),
    switchTheme: _switchTheme(true),
    floatingActionButtonTheme: _floatingActionButtonTheme(true),
    elevatedButtonTheme: _elevatedButtonTheme(true),
    outlinedButtonTheme: _outlinedButtonTheme(true),
    textSelectionTheme: _textSelectionTheme(true),
    // primaryTextTheme: _primaryTextTheme(true),
    // colorScheme: _colorScheme(true),
    // inputDecorationTheme: _inputDecorationTheme(true),
    textButtonTheme: _textButtonTheme(),
    menuButtonTheme: _menuButtonThemeData(),
    cardTheme: _cardThemeData(),
  );
}

ThemeData get lightTheme {
  return ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: _setColorPrimiaryIsThemeModeDark(false),
    appBarTheme: _appBarTheme(false),
    textTheme: _textTheme(false),
    switchTheme: _switchTheme(false),
    floatingActionButtonTheme: _floatingActionButtonTheme(false),
    elevatedButtonTheme: _elevatedButtonTheme(false),
    outlinedButtonTheme: _outlinedButtonTheme(false),
    textSelectionTheme: _textSelectionTheme(false),
    // primaryTextTheme: _primaryTextTheme(false),
    colorScheme: _colorScheme(false),
    inputDecorationTheme: _inputDecorationTheme(false),
    textButtonTheme: _textButtonTheme(),
    // menuButtonTheme: _menuButtonThemeData(),
    cardTheme: _cardThemeData(),
  );
}

TextButtonThemeData _textButtonTheme() {
  return TextButtonThemeData(
    style: TextButton.styleFrom(
      textStyle: CustomFonts.montserratMedium14,
      padding: EdgeInsets.zero,
      minimumSize: Size.zero,
      foregroundColor: Colors.white10,
      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    ),
  );
}

OutlinedButtonThemeData _outlinedButtonTheme(bool isDark) {
  return OutlinedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.transparent,
      foregroundColor: _setColorPrimiaryIsThemeModeDark(isDark),
      textStyle: CustomFonts.montserratMedium14,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          ConstDouble.DEFAULT_BORDER_RADIUES,
        ),
      ),
      minimumSize: const Size.fromHeight(ConstDouble.DEFAULT_BUTTON_HEIGHT),
      side: BorderSide(
        width: 1.5,
        color: _setColorPrimiaryIsThemeModeDark(isDark),
      ),
    ).merge(
      ButtonStyle(
        elevation: MaterialStateProperty.resolveWith<double>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) return 0;
            return 0;
          },
        ),
      ),
    ),
  );
}

FloatingActionButtonThemeData _floatingActionButtonTheme(bool isDark) {
  return FloatingActionButtonThemeData(
    elevation: 0,
    highlightElevation: 0,
    backgroundColor: _setColorPrimiaryIsThemeModeDark(isDark),
  );
}

SwitchThemeData _switchTheme(bool isDark) {
  return SwitchThemeData(
    thumbColor: MaterialStateProperty.all(
      _setColorIsThemeModeDark(!isDark),
    ),
    trackColor: MaterialStateProperty.all(
      _setColorIsThemeModeDark(!isDark).withOpacity(.5),
    ),
  );
}

TextTheme _textTheme(bool isDark) {
  return TextTheme(
    titleLarge: CustomFonts.montserratSemibold16.copyWith(
      color: _setColorIsThemeModeDark(isDark),
    ),
    titleMedium: CustomFonts.montserratMedium14.copyWith(
      color: _setColorIsThemeModeDark(isDark),
    ),
    titleSmall: CustomFonts.montserratSemibold12.copyWith(
      color: _setColorIsThemeModeDark(isDark),
    ),
    bodyLarge: CustomFonts.montserratRegular16.copyWith(
      color: _setColorIsThemeModeDark(isDark),
    ),
    bodyMedium: CustomFonts.montserratRegular14.copyWith(
      color: _setColorIsThemeModeDark(isDark),
    ),
    bodySmall: CustomFonts.montserratRegular12.copyWith(
      color: _setColorIsThemeModeDark(isDark),
    ),
  );
}

ElevatedButtonThemeData _elevatedButtonTheme(bool isDark) {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      disabledBackgroundColor: CustomColor.INPUT_DISABLE_COLOR,
      foregroundColor: CustomColor.WHITE,
      backgroundColor: _setColorPrimiaryIsThemeModeDark(isDark),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ConstDouble.DEFAULT_BORDER_RADIUES),
      ),
      minimumSize: const Size.fromHeight(ConstDouble.DEFAULT_BUTTON_HEIGHT),
    ).merge(
      ButtonStyle(
        elevation: MaterialStateProperty.resolveWith<double>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) return 0;
            return 0;
          },
        ),
      ),
    ),
  );
}

InputDecorationTheme _inputDecorationTheme(bool isDark) {
  return InputDecorationTheme(
    errorMaxLines: 1,
    iconColor: CustomColor.PRIMARY,
    isDense: true,
    filled: true,
    fillColor: CustomColor.INPUT_FILL_COLOR,
    hintStyle: CustomFonts.montserratRegular12.copyWith(
      color: CustomSwatch.DISABLE[600],
    ),
    errorStyle: CustomFonts.montserratRegular10.copyWith(
      color: CustomSwatch.DANGER,
    ),
    contentPadding: const EdgeInsets.symmetric(
      vertical: ConstDouble.CONTENT_PADDING_VERTICAL,
      horizontal: ConstDouble.CONTENT_PADDING_HORIZONTAL,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        ConstDouble.DEFAULT_BORDER_RADIUES,
      ),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        ConstDouble.DEFAULT_BORDER_RADIUES,
      ),
      borderSide: BorderSide.none,
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        ConstDouble.DEFAULT_BORDER_RADIUES,
      ),
      borderSide: const BorderSide(
        width: 1,
        color: CustomSwatch.DANGER,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(
        ConstDouble.DEFAULT_BORDER_RADIUES,
      ),
      borderSide: const BorderSide(
        width: 1,
        color: CustomSwatch.DANGER,
      ),
    ),
    // focusedBorder: OutlineInputBorder(
    //   borderRadius: BorderRadius.circular(
    //     ConstDouble.DEFAULT_BORDER_RADIUES,
    //   ),
    //   borderSide: BorderSide(
    //     width: 1,
    //     color: CustomColor.INPUT_DISABLE_COLOR,
    //   ),
    // ),
    // errorBorder: OutlineInputBorder(
    //   borderRadius: BorderRadius.circular(
    //     ConstDouble.DEFAULT_BORDER_RADIUES,
    //   ),
    //   borderSide: BorderSide(
    //     width: 1,
    //     color: CustomSwatch.DANGER,
    //   ),
    // ),
  );
}

ColorScheme _colorScheme(bool isDark) {
  return ColorScheme.fromSwatch(
    primarySwatch: CustomSwatch.PRIMARY,
  ).copyWith(
    secondary: _setColorPrimiaryIsThemeModeDark(isDark),
  );
}

TextTheme _primaryTextTheme(bool isDark) {
  return TextTheme(
    displayLarge: CustomFonts.montserratRegular16.copyWith(
      color: _setColorIsThemeModeDark(isDark),
    ),
    displayMedium: CustomFonts.montserratRegular14.copyWith(
      color: _setColorIsThemeModeDark(isDark),
    ),
    displaySmall: CustomFonts.montserratRegular12.copyWith(
      color: _setColorIsThemeModeDark(isDark),
    ),
    headlineLarge: CustomFonts.montserratBold16.copyWith(
      color: _setColorIsThemeModeDark(isDark),
    ),
    headlineMedium: CustomFonts.montserratBold14.copyWith(
      color: _setColorIsThemeModeDark(isDark),
    ),
    headlineSmall: CustomFonts.montserratBold12.copyWith(
      color: _setColorIsThemeModeDark(isDark),
    ),
    labelLarge: CustomFonts.montserratMedium16.copyWith(
      color: _setColorIsThemeModeDark(isDark),
    ),
    labelMedium: CustomFonts.montserratMedium14.copyWith(
      color: _setColorIsThemeModeDark(isDark),
    ),
    labelSmall: CustomFonts.montserratMedium12.copyWith(
      color: _setColorIsThemeModeDark(isDark),
    ),
    bodyLarge: CustomFonts.montserratRegular16.copyWith(
      color: _setColorIsThemeModeDark(isDark),
    ),
    bodyMedium: CustomFonts.montserratRegular14.copyWith(
      color: _setColorIsThemeModeDark(isDark),
    ),
    bodySmall: CustomFonts.montserratRegular12.copyWith(
      color: _setColorIsThemeModeDark(isDark),
    ),
    titleLarge: CustomFonts.montserratSemibold16.copyWith(
      color: _setColorIsThemeModeDark(isDark),
    ),
    titleMedium: CustomFonts.montserratSemibold14.copyWith(
      color: _setColorIsThemeModeDark(isDark),
    ),
    titleSmall: CustomFonts.montserratSemibold12.copyWith(
      color: _setColorIsThemeModeDark(isDark),
    ),
  );
}

TextSelectionThemeData _textSelectionTheme(bool isDark) {
  return TextSelectionThemeData(
    cursorColor: _setColorIsThemeModeDark(isDark),
  );
}

AppBarTheme _appBarTheme(bool isDark) {
  return AppBarTheme(
    toolbarHeight: ConstDouble.DEFAULT_APPBAR_HEIGHT,
    backgroundColor: CustomColor.PRIMARY,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(
          ConstDouble.DEFAULT_BORDER_RADIUES,
        ),
      ),
    ),
    iconTheme: const IconThemeData(color: CustomColor.WHITE),
    centerTitle: false,
    elevation: 0,
    toolbarTextStyle: const TextTheme().bodyLarge,
    titleTextStyle: CustomFonts.montserratBold16.copyWith(
      color: CustomColor.WHITE,
    ),
  );
}

MenuButtonThemeData _menuButtonThemeData() {
  return MenuButtonThemeData(
    style: MenuItemButton.styleFrom(
      disabledBackgroundColor: CustomColor.INPUT_DISABLE_COLOR,
      foregroundColor: CustomColor.WHITE,
      backgroundColor: Colors.red,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(ConstDouble.DEFAULT_BORDER_RADIUES),
      ),
      minimumSize: const Size.fromHeight(ConstDouble.DEFAULT_BUTTON_HEIGHT),
    ),
  );
}

CardTheme _cardThemeData() {
  return CardTheme(
    color: CustomColor.PRIMARY,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    elevation: 0,
    margin: EdgeInsets.zero,
  );
}

Color _setColorIsThemeModeDark(bool isDark) =>
    isDark ? CustomColor.WHITE : CustomSwatch.TEXT;

Color _setColorPrimiaryIsThemeModeDark(bool isDark) =>
    isDark ? CustomColor.SECONDARY : CustomColor.Glacier;
