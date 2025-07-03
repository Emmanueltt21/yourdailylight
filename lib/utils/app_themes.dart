import 'package:flutter/material.dart';
import '../utils/my_colors.dart';

enum AppTheme { White, Dark }

/// Returns enum value name without enum class name.
String enumName(AppTheme anyEnum) {
  return anyEnum.toString().split('.')[1];
}

final appThemeData = {
  AppTheme.White: ThemeData(
    dialogTheme: DialogThemeData(
        titleTextStyle: TextStyle(
      color: Colors.black,
    )),
    brightness: Brightness.light,
    primaryColor: MyColors.primary,
    //primarySwatch: MyColors.primary,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      color: MyColors.primary,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    cardTheme: CardThemeData(
      color: Colors.white,
    ),
    iconTheme: IconThemeData(
      color: Colors.black87,
    ),

  ),
  AppTheme.Dark: ThemeData(
    //scaffoldBackgroundColor: MyColors.grey_90,
    //primaryColor: MyColors.grey_90,
    brightness: Brightness.dark,
    dialogTheme: DialogThemeData(
        titleTextStyle: TextStyle(
      color: Colors.white,
    )),
    bottomSheetTheme: BottomSheetThemeData(
        //backgroundColor: MyColors.grey_90,
        ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: MyColors.grey_95,
    ),
    bottomAppBarTheme: BottomAppBarTheme(color: MyColors.grey_95),
    appBarTheme: AppBarTheme(
      color: MyColors.primary,
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
    ),
    dividerColor: Colors.grey.shade800,
    //bottomAppBarTheme: BottomAppBarTheme(color: MyColors.grey_90),
    cardTheme: CardThemeData(
        //color: MyColors.grey_80,
        ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),

  ),
};
