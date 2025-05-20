import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppTheme {
  // Main colors extracted from dapp.bagguild.com
  static const Color primaryPurple = Color(0xFF9353D3); // rgb(147, 83, 211)
  static const Color accentMagenta = Color(0xFFF31260); // rgb(243, 18, 96)
  static const Color accentGreen = Color(0xFF17C964); // rgb(23, 201, 100)
  static const Color darkBackground = Color(0xFF000000); // rgb(0, 0, 0)
  static const Color lightBackground = Color(0xFFF5F5F5); // Light mode background
  static const Color textWhite = Color(0xFFFFFFFF); // rgb(255, 255, 255)
  static const Color textGray = Color(0xFFA1A1AA); // rgb(161, 161, 170)
  static const Color textLightGray = Color(0xFFD1D5DB); // rgb(209, 213, 219)
  static const Color textDark = Color(0xFF1A1A1A); // Dark text for light mode
  
  // Enhanced colors for more stylish UI
  static const Color purpleGradientStart = Color(0xFF9353D3);
  static const Color purpleGradientEnd = Color(0xFF6A35B0);
  static const Color cardBackground = Color(0xFF121212);
  static const Color lightCardBackground = Color(0xFFFFFFFF);
  static const Color cardBorder = Color(0xFF2A2A2A);
  static const Color lightCardBorder = Color(0xFFE0E0E0);
  static const Color highlightPurple = Color(0xFFB57BFF);
  static const Color deepPurple = Color(0xFF4A2882);
  static const Color glassOverlay = Color(0x1AFFFFFF);
  static const Color lightGlassOverlay = Color(0x1A000000);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [purpleGradientStart, purpleGradientEnd],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  
  static const LinearGradient accentGradient = LinearGradient(
    colors: [accentMagenta, Color(0xFFB01253)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Spacing and sizing constants for consistency
  static const double spacingXs = 4.0;
  static const double spacingSm = 8.0;
  static const double spacingMd = 16.0;
  static const double spacingLg = 24.0;
  static const double spacingXl = 32.0;
  static const double spacingXxl = 48.0;
  
  static const double borderRadiusSm = 8.0;
  static const double borderRadiusMd = 12.0;
  static const double borderRadiusLg = 16.0;
  static const double borderRadiusXl = 24.0;
  
  static const double elevationSm = 2.0;
  static const double elevationMd = 4.0;
  static const double elevationLg = 8.0;
  static const double elevationXl = 16.0;

  // Animation durations
  static const Duration animDurationFast = Duration(milliseconds: 150);
  static const Duration animDurationMedium = Duration(milliseconds: 300);
  static const Duration animDurationSlow = Duration(milliseconds: 500);

  // Theme data - Dark Theme (Material 3)
  static ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        primaryColor: primaryPurple,
        scaffoldBackgroundColor: darkBackground,
        colorScheme: ColorScheme.dark(
          primary: primaryPurple,
          secondary: accentMagenta,
          tertiary: accentGreen,
          background: darkBackground,
          surface: cardBackground,
          onPrimary: textWhite,
          onSecondary: textWhite,
          onTertiary: textWhite,
          onBackground: textWhite,
          onSurface: textWhite,
          surfaceTint: primaryPurple.withOpacity(0.05),
        ),
        fontFamily: 'Inter',
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: textWhite,
            fontSize: 42,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
          ),
          displayMedium: TextStyle(
            color: textWhite,
            fontSize: 36,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
          ),
          displaySmall: TextStyle(
            color: textWhite,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.3,
            height: 1.2,
          ),
          headlineMedium: TextStyle(
            color: textWhite,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.2,
          ),
          headlineSmall: TextStyle(
            color: textWhite,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: TextStyle(
            color: textWhite,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: TextStyle(
            color: textWhite,
            fontSize: 16,
            height: 1.6,
            letterSpacing: 0.2,
          ),
          bodyMedium: TextStyle(
            color: textLightGray,
            fontSize: 14,
            height: 1.5,
          ),
          labelLarge: TextStyle(
            color: textWhite,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: darkBackground,
          foregroundColor: textWhite,
          elevation: 0,
          centerTitle: false,
          titleSpacing: spacingMd,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryPurple,
            foregroundColor: textWhite,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadiusMd),
            ),
            padding: const EdgeInsets.symmetric(horizontal: spacingLg, vertical: spacingMd),
            elevation: elevationMd,
            shadowColor: primaryPurple.withOpacity(0.5),
            minimumSize: const Size(120, 48),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: textWhite,
            side: const BorderSide(color: primaryPurple, width: 1.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadiusMd),
            ),
            padding: const EdgeInsets.symmetric(horizontal: spacingLg, vertical: spacingMd),
            minimumSize: const Size(120, 48),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: primaryPurple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadiusMd),
            ),
            padding: const EdgeInsets.symmetric(horizontal: spacingMd, vertical: spacingSm),
          ),
        ),
        cardTheme: CardTheme(
          color: cardBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadiusLg),
            side: const BorderSide(
              color: cardBorder,
              width: 1,
            ),
          ),
          elevation: elevationLg,
          shadowColor: Colors.black.withOpacity(0.5),
          margin: const EdgeInsets.all(spacingMd),
        ),
        dividerTheme: const DividerThemeData(
          color: cardBorder,
          thickness: 1,
          space: spacingXl,
        ),
        iconTheme: const IconThemeData(
          color: textWhite,
          size: 24,
        ),
        chipTheme: ChipThemeData(
          backgroundColor: cardBackground,
          disabledColor: cardBackground.withOpacity(0.5),
          selectedColor: primaryPurple,
          secondarySelectedColor: accentMagenta,
          padding: const EdgeInsets.symmetric(horizontal: spacingMd, vertical: spacingSm),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadiusMd),
            side: BorderSide(
              color: cardBorder,
              width: 1,
            ),
          ),
          labelStyle: const TextStyle(
            color: textWhite,
            fontSize: 14,
          ),
          secondaryLabelStyle: const TextStyle(
            color: textWhite,
            fontSize: 14,
          ),
          brightness: Brightness.dark,
        ),
        snackBarTheme: SnackBarThemeData(
          backgroundColor: cardBackground,
          contentTextStyle: const TextStyle(color: textWhite),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadiusMd),
          ),
          behavior: SnackBarBehavior.floating,
        ),
        dialogTheme: DialogTheme(
          backgroundColor: cardBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadiusLg),
          ),
          elevation: elevationXl,
          titleTextStyle: const TextStyle(
            color: textWhite,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          contentTextStyle: const TextStyle(
            color: textLightGray,
            fontSize: 16,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: cardBackground,
          selectedItemColor: primaryPurple,
          unselectedItemColor: textGray,
          type: BottomNavigationBarType.fixed,
          elevation: elevationLg,
          showSelectedLabels: true,
          showUnselectedLabels: true,
        ),
        navigationRailTheme: NavigationRailThemeData(
          backgroundColor: primaryPurple,
          selectedIconTheme: const IconThemeData(color: textWhite),
          unselectedIconTheme: IconThemeData(color: textWhite.withOpacity(0.7)),
          selectedLabelTextStyle: const TextStyle(
            color: textWhite,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelTextStyle: TextStyle(
            color: textWhite.withOpacity(0.7),
          ),
          useIndicator: true,
          indicatorColor: Colors.white.withOpacity(0.2),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: cardBackground,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadiusMd),
            borderSide: const BorderSide(color: cardBorder),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadiusMd),
            borderSide: const BorderSide(color: cardBorder),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadiusMd),
            borderSide: const BorderSide(color: primaryPurple, width: 2),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: spacingMd,
            vertical: spacingMd,
          ),
          labelStyle: const TextStyle(color: textGray),
          hintStyle: const TextStyle(color: textGray),
        ),
      );
      
  // Theme data - Light Theme (Material 3)
  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        primaryColor: primaryPurple,
        scaffoldBackgroundColor: lightBackground,
        colorScheme: ColorScheme.light(
          primary: primaryPurple,
          secondary: accentMagenta,
          tertiary: accentGreen,
          background: lightBackground,
          surface: lightCardBackground,
          onPrimary: textWhite,
          onSecondary: textWhite,
          onTertiary: textWhite,
          onBackground: textDark,
          onSurface: textDark,
          surfaceTint: primaryPurple.withOpacity(0.05),
        ),
        fontFamily: 'Inter',
        textTheme: const TextTheme(
          displayLarge: TextStyle(
            color: textDark,
            fontSize: 42,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
          ),
          displayMedium: TextStyle(
            color: textDark,
            fontSize: 36,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.5,
          ),
          displaySmall: TextStyle(
            color: textDark,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.3,
            height: 1.2,
          ),
          headlineMedium: TextStyle(
            color: textDark,
            fontSize: 24,
            fontWeight: FontWeight.bold,
            letterSpacing: -0.2,
          ),
          headlineSmall: TextStyle(
            color: textDark,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: TextStyle(
            color: textDark,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: TextStyle(
            color: textDark,
            fontSize: 16,
            height: 1.6,
            letterSpacing: 0.2,
          ),
          bodyMedium: TextStyle(
            color: textGray,
            fontSize: 14,
            height: 1.5,
          ),
          labelLarge: TextStyle(
            color: textDark,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5,
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: lightBackground,
          foregroundColor: textDark,
          elevation: 0,
          centerTitle: false,
          titleSpacing: spacingMd,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryPurple,
            foregroundColor: textWhite,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadiusMd),
            ),
            padding: const EdgeInsets.symmetric(horizontal: spacingLg, vertical: spacingMd),
            elevation: elevationMd,
            shadowColor: primaryPurple.withOpacity(0.3),
            minimumSize: const Size(120, 48),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: primaryPurple,
            side: const BorderSide(color: primaryPurple, width: 1.5),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadiusMd),
            ),
            padding: const EdgeInsets.symmetric(horizontal: spacingLg, vertical: spacingMd),
            minimumSize: const Size(120, 48),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: primaryPurple,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadiusMd),
            ),
            padding: const EdgeInsets.symmetric(horizontal: spacingMd, vertical: spacingSm),
          ),
        ),
        cardTheme: CardTheme(
          color: lightCardBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadiusLg),
            side: const BorderSide(
              color: lightCardBorder,
              width: 1,
            ),
          ),
          elevation: elevationMd,
          shadowColor: Colors.black.withOpacity(0.1),
          margin: const EdgeInsets.all(spacingMd),
        ),
        dividerTheme: const DividerThemeData(
          color: lightCardBorder,
          thickness: 1,
          space: spacingXl,
        ),
        iconTheme: const IconThemeData(
          color: textDark,
          size: 24,
        ),
        chipTheme: ChipThemeData(
          backgroundColor: lightCardBackground,
          disabledColor: lightCardBackground.withOpacity(0.5),
          selectedColor: primaryPurple,
          secondarySelectedColor: accentMagenta,
          padding: const EdgeInsets.symmetric(horizontal: spacingMd, vertical: spacingSm),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadiusMd),
            side: BorderSide(
              color: lightCardBorder,
              width: 1,
            ),
          ),
          labelStyle: const TextStyle(
            color: textDark,
            fontSize: 14,
          ),
          secondaryLabelStyle: const TextStyle(
            color: textWhite,
            fontSize: 14,
          ),
          brightness: Brightness.light,
        ),
        snackBarTheme: SnackBarThemeData(
          backgroundColor: lightCardBackground,
          contentTextStyle: const TextStyle(color: textDark),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadiusMd),
          ),
          behavior: SnackBarBehavior.floating,
        ),
        dialogTheme: DialogTheme(
          backgroundColor: lightCardBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadiusLg),
          ),
          elevation: elevationXl,
          titleTextStyle: const TextStyle(
            color: textDark,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          contentTextStyle: const TextStyle(
            color: textGray,
            fontSize: 16,
          ),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: lightCardBackground,
          selectedItemColor: primaryPurple,
          unselectedItemColor: textGray,
          type: BottomNavigationBarType.fixed,
          elevation: elevationLg,
          showSelectedLabels: true,
          showUnselectedLabels: true,
        ),
        navigationRailTheme: NavigationRailThemeData(
          backgroundColor: primaryPurple,
          selectedIconTheme: const IconThemeData(color: textWhite),
          unselectedIconTheme: IconThemeData(color: textWhite.withOpacity(0.7)),
          selectedLabelTextStyle: const TextStyle(
            color: textWhite,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelTextStyle: TextStyle(
            color: textWhite.withOpacity(0.7),
          ),
          useIndicator: true,
          indicatorColor: Colors.white.withOpacity(0.2),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: lightCardBackground,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadiusMd),
            borderSide: const BorderSide(color: lightCardBorder),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadiusMd),
            borderSide: const BorderSide(color: lightCardBorder),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(borderRadiusMd),
            borderSide: const BorderSide(color: primaryPurple, width: 2),
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: spacingMd,
            vertical: spacingMd,
          ),
          labelStyle: const TextStyle(color: textGray),
          hintStyle: const TextStyle(color: textGray),
        ),
      );
      
  // Custom box decorations for glassmorphism effect
  static BoxDecoration getGlassDecoration({bool isDark = true}) => BoxDecoration(
    color: isDark ? glassOverlay : lightGlassOverlay,
    borderRadius: BorderRadius.circular(borderRadiusLg),
    border: Border.all(
      color: isDark ? Colors.white.withOpacity(0.1) : Colors.black.withOpacity(0.05),
      width: 1,
    ),
    boxShadow: [
      BoxShadow(
        color: isDark ? Colors.black.withOpacity(0.2) : Colors.black.withOpacity(0.05),
        blurRadius: 16,
        spreadRadius: 0,
      ),
    ],
  );
  
  static BoxDecoration getGradientCardDecoration({bool isDark = true}) => BoxDecoration(
    gradient: LinearGradient(
      colors: isDark 
        ? [deepPurple, Color(0xFF1A1A1A)]
        : [primaryPurple.withOpacity(0.1), Colors.white],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    borderRadius: BorderRadius.circular(borderRadiusLg),
    border: Border.all(
      color: isDark 
        ? purpleGradientStart.withOpacity(0.3)
        : purpleGradientStart.withOpacity(0.1),
      width: 1,
    ),
    boxShadow: [
      BoxShadow(
        color: isDark 
          ? deepPurple.withOpacity(0.3)
          : primaryPurple.withOpacity(0.1),
        blurRadius: 12,
        spreadRadius: 0,
        offset: const Offset(0, 4),
      ),
    ],
  );
  
  // Responsive breakpoints
  static const double mobileBreakpoint = 600;
  static const double tabletBreakpoint = 900;
  static const double desktopBreakpoint = 1200;
  
  // Helper method to get responsive value based on screen width
  static T getResponsiveValue<T>({
    required BuildContext context,
    required T mobile,
    T? tablet,
    T? desktop,
  }) {
    final width = MediaQuery.of(context).size.width;
    
    if (width >= desktopBreakpoint && desktop != null) {
      return desktop;
    }
    
    if (width >= tabletBreakpoint && tablet != null) {
      return tablet;
    }
    
    return mobile;
  }
  
  // Helper method to get responsive padding
  static EdgeInsets getResponsivePadding(BuildContext context) {
    return getResponsiveValue<EdgeInsets>(
      context: context,
      mobile: const EdgeInsets.all(spacingMd),
      tablet: const EdgeInsets.all(spacingLg),
      desktop: const EdgeInsets.all(spacingXl),
    );
  }
  
  // Helper method to get responsive font size
  static double getResponsiveFontSize(BuildContext context, double baseFontSize) {
    return getResponsiveValue<double>(
      context: context,
      mobile: baseFontSize,
      tablet: baseFontSize * 1.1,
      desktop: baseFontSize * 1.2,
    );
  }
}
