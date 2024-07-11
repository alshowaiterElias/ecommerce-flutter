import 'package:flutter/material.dart';
import 'package:football_app/utils/theme/custom_themes/TBotton_sheet_theme.dart';
import 'package:football_app/utils/theme/custom_themes/TCheckBoxTheme.dart';
import 'package:football_app/utils/theme/custom_themes/TelevatedButtonTheme.dart';
import 'package:football_app/utils/theme/custom_themes/appbar_theme.dart';
import 'package:football_app/utils/theme/custom_themes/chipTheme.dart';
import 'package:football_app/utils/theme/custom_themes/outlined_button_theme.dart';
import 'package:football_app/utils/theme/custom_themes/text_filed_theme.dart';
import 'package:football_app/utils/theme/custom_themes/text_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.light,
      primaryColor: Colors.green,
      scaffoldBackgroundColor: Colors.white,
      textTheme: TTextTheme.lightTextTheme,
      appBarTheme: TappbarTheme.lightAppbarTheme,
      bottomSheetTheme: TbottonSheetTheme.lightBottomSheetTheme,
      chipTheme: TChipTheme.lightChipTheme,
      checkboxTheme: Tcheckboxtheme.lightCheckboxTheme,
      elevatedButtonTheme: TelevatedButtonTheme.lightElevatedButtonTheme,
      outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonThemeData,
      inputDecorationTheme: TTextFiledTheme.lightInputDecorationTheme);
  static ThemeData darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.dark,
      primaryColor: Colors.green,
      scaffoldBackgroundColor: Colors.black,
      textTheme: TTextTheme.darkTextTheme,
      appBarTheme: TappbarTheme.lightAppbarTheme,
      bottomSheetTheme: TbottonSheetTheme.lightBottomSheetTheme,
      chipTheme: TChipTheme.darkChipTheme,
      checkboxTheme: Tcheckboxtheme.darkCheckboxTheme,
      elevatedButtonTheme: TelevatedButtonTheme.darkElevatedButtonTheme,
      outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonThemeData,
      inputDecorationTheme: TTextFiledTheme.darkInputDecorationTheme);
}
