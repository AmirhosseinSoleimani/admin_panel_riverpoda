import 'package:admin_panel/src/shared/resources/resources.dart';
import 'package:flutter/material.dart';

abstract class AppThemeData {
  ThemeData get materialThemeData;
}

class LightAppThemeData extends AppThemeData {

  @override
  ThemeData get materialThemeData => ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,

      primaryColor: ColorThemeManager.transparent,
      cardColor: ColorThemeManager.lightBlue,
      indicatorColor: ColorThemeManager.primary,

      colorScheme: ColorScheme(
        primary: ColorThemeManager.blue,
        onPrimary: ColorThemeManager.lightBlue,

        secondary: ColorThemeManager.greyStrong,
        onSecondary: ColorThemeManager.greyMedium,

        error: ColorThemeManager.redColor,
        onError: ColorThemeManager.redLight,

        surface: ColorThemeManager.whiteColor,
        onSurface: ColorThemeManager.colorHoloGreyPrimary,

        tertiary: ColorThemeManager.colorBlack,

        surfaceContainer: ColorThemeManager.lightBlue2,
        secondaryContainer: ColorThemeManager.grey,

        brightness: Brightness.light,
      ),

      textTheme: TextTheme(
        headlineLarge: getBoldStyle(fontSize: AppSize.s24, color: ColorThemeManager.colorBlack),
        headlineMedium: getSemiBoldStyle(fontSize: AppSize.s24, color: ColorThemeManager.colorBlack),
        headlineSmall: getRegularStyle(fontSize: AppSize.s24, color: ColorThemeManager.colorBlack),

        titleLarge: getBoldStyle(fontSize: AppSize.s18, color: ColorThemeManager.colorBlack),
        titleMedium: getSemiBoldStyle(fontSize: AppSize.s18, color: ColorThemeManager.colorBlack),
        titleSmall: getRegularStyle(fontSize: AppSize.s18, color: ColorThemeManager.colorBlack),

        displayLarge: getBoldStyle(fontSize: AppSize.s16, color: ColorThemeManager.colorBlack),
        displayMedium: getSemiBoldStyle(fontSize: AppSize.s16, color: ColorThemeManager.colorBlack),
        displaySmall: getRegularStyle(fontSize: AppSize.s16, color: ColorThemeManager.colorBlack),

        bodyLarge: getBoldStyle(fontSize: AppSize.s14, color: ColorThemeManager.colorBlack),
        bodyMedium: getSemiBoldStyle(fontSize: AppSize.s14, color: ColorThemeManager.colorBlack),
        bodySmall: getRegularStyle(fontSize: AppSize.s14, color: ColorThemeManager.colorBlack),

        labelLarge: getBoldStyle(fontSize: AppSize.s12, color: ColorThemeManager.colorBlack),
        labelMedium: getSemiBoldStyle(fontSize: AppSize.s12, color: ColorThemeManager.colorBlack),
        labelSmall: getRegularStyle(fontSize: AppSize.s12, color: ColorThemeManager.colorBlack),
      ).apply(fontFamily: FontConstants.fontFamily)
  );
}


class DarkAppThemeData extends AppThemeData{

  @override
  ThemeData get materialThemeData => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

      colorScheme: ColorScheme(
        primary: ColorThemeManager.blue,
        onPrimary: ColorThemeManager.lightBlue,

        secondary: Colors.white70,
        onSecondary: Colors.white60,

        error: ColorThemeManager.redColor,
        onError: ColorThemeManager.redLight,

        surface: ColorThemeManager.colorBlack,
        onSurface: ColorThemeManager.colorHoloGreyPrimary,

        tertiary: ColorThemeManager.colorBlack,

        surfaceContainer: ColorThemeManager.lightBlue2,
        secondaryContainer: Colors.white60,

        brightness: Brightness.light,
      ),

      textTheme: TextTheme(
        headlineLarge: getBoldStyle(fontSize: AppSize.s24, color: ColorThemeManager.whiteColor),
        headlineMedium: getSemiBoldStyle(fontSize: AppSize.s24, color: ColorThemeManager.whiteColor),
        headlineSmall: getRegularStyle(fontSize: AppSize.s24, color: ColorThemeManager.whiteColor),

        titleLarge: getBoldStyle(fontSize: AppSize.s18, color: ColorThemeManager.whiteColor),
        titleMedium: getSemiBoldStyle(fontSize: AppSize.s18, color: ColorThemeManager.whiteColor),
        titleSmall: getRegularStyle(fontSize: AppSize.s18, color: ColorThemeManager.whiteColor),

        displayLarge: getBoldStyle(fontSize: AppSize.s16, color: ColorThemeManager.whiteColor),
        displayMedium: getSemiBoldStyle(fontSize: AppSize.s16, color: ColorThemeManager.whiteColor),
        displaySmall: getRegularStyle(fontSize: AppSize.s16, color: ColorThemeManager.whiteColor),

        bodyLarge: getBoldStyle(fontSize: AppSize.s14, color: ColorThemeManager.whiteColor),
        bodyMedium: getSemiBoldStyle(fontSize: AppSize.s14, color: ColorThemeManager.whiteColor),
        bodySmall: getRegularStyle(fontSize: AppSize.s14, color: ColorThemeManager.whiteColor),

        labelLarge: getBoldStyle(fontSize: AppSize.s12, color: ColorThemeManager.whiteColor),
        labelMedium: getSemiBoldStyle(fontSize: AppSize.s12, color: ColorThemeManager.whiteColor),
        labelSmall: getRegularStyle(fontSize: AppSize.s12, color: ColorThemeManager.whiteColor),
      ).apply(fontFamily: FontConstants.fontFamily)
  );
}