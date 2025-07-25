import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'responsive_utils.dart';

class AppTheme {
  late BuildContext _context;
  AppTheme._(BuildContext context) {
    _context = context;
  }

  static AppTheme of(BuildContext context) {
    return AppTheme._(context);
  }

  double _scale(double fontSize) {
    return Sizer.of(_context).fontSize(fontSize);
  }

  // static const primaryColor = Color(0xff8FABC2);
  static const primaryColor = Color(0xff5FB1BA);
  static const secondaryColor = Color(0xff66BA7C);
  static const primaryGrayColor = Color(0xfff4f4f6);
  static const Color textDarkGreyColor = Color(0xff444444);
  static const Color fontDarkGreyColor = Color(0xff777777);
  ThemeData get appTheme => ThemeData(
        primarySwatch: const MaterialColor(0xffD96704, {
          50: Color(0xffFEE9D2),
          100: Color(0xffFDD4A5),
          200: Color(0xffFBBB76),
          300: Color(0xffF9A147),
          400: Color(0xffF88A1D),
          500: Color(0xffD96704),
          600: Color(0xffB04F03),
          700: Color(0xff8A3E03),
          800: Color(0xff662F02),
          900: Color(0xff4A2401),
        }),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppTheme.primaryColor,
          foregroundColor: Colors.white,
        ),
        primaryColor: AppTheme.primaryColor,
        secondaryHeaderColor: const Color(0xff395873),

        switchTheme: SwitchThemeData(
          thumbColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (!states.contains(WidgetState.selected)) {
              return AppTheme.fontDarkGreyColor.withValues(alpha: 102);
            }
            if (states.contains(WidgetState.disabled)) {
              return AppTheme.fontDarkGreyColor;
            }

            return AppTheme.primaryColor;
          }),
        ),
        appBarTheme: AppBarTheme(
          centerTitle: false,
          titleTextStyle: TextStyle(
            color: textDarkGreyColor,
            fontSize: _scale(20),
            fontWeight: FontWeight.w600,
          ),
          systemOverlayStyle: const SystemUiOverlayStyle(
            // Status bar color
            statusBarColor: Colors.transparent,

            // Status bar brightness (optional)
            statusBarIconBrightness:
                Brightness.dark, // For Android (dark icons)
            statusBarBrightness: Brightness.light, // For iOS (dark icons)
          ),
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: const BorderSide(
              color: AppTheme.primaryColor,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          hintStyle: TextStyle(
            color: Colors.grey.shade600,
            fontSize: _scale(16),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blueGrey.shade200,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: primaryColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
        ),
        colorScheme: const ColorScheme.light(
          primary: AppTheme.primaryColor,
          secondary: AppTheme.secondaryColor,
        ),
        fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        buttonTheme: const ButtonThemeData(
          buttonColor: AppTheme.primaryColor,
          textTheme: ButtonTextTheme.primary,
        ),
        // alert dialog theme
        dialogTheme: DialogThemeData(
          backgroundColor: Colors.white,
          titleTextStyle: TextStyle(
            color: Colors.grey.shade800,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
          ),
          contentTextStyle: TextStyle(
            color: Colors.grey.shade600,
            fontFamily: GoogleFonts.plusJakartaSans().fontFamily,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
          alignment: Alignment.center,
        ),

        textTheme: TextTheme(
          labelLarge:
              TextStyle(fontSize: _scale(16), fontWeight: FontWeight.w600),
          labelMedium:
              TextStyle(fontSize: _scale(14), fontWeight: FontWeight.w600),
          titleMedium: TextStyle(
            fontSize: _scale(18),
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade800,
          ),
          titleLarge: TextStyle(
            fontSize: _scale(20),
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade800,
          ),
          bodyMedium: TextStyle(
            fontSize: _scale(14),
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade700,
          ),
          bodySmall: TextStyle(
            fontSize: _scale(12),
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade600,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.resolveWith<Color>(
              (Set<WidgetState> states) {
                if (states.contains(WidgetState.disabled)) {
                  return AppTheme.primaryColor.withValues(alpha: 128);
                }

                if (states.contains(WidgetState.hovered)) {
                  return AppTheme.primaryColor.withValues(alpha: 204);
                }
                if (states.contains(WidgetState.pressed)) {
                  return AppTheme.primaryColor.withValues(alpha: 204);
                }

                return AppTheme.primaryColor;
              },
            ),
            foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
            textStyle: WidgetStateProperty.all<TextStyle>(
              const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      );
}
