import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  // Private constructor to prevent instantiation of this class.
  AppTypography._();

  // Define a custom TextTheme using DM Sans font
  static TextTheme get dmSansTextTheme {
    return TextTheme(
      // Display Large: Used for the largest headlines
      displayLarge: GoogleFonts.dmSans(
        fontSize: 50, // Font size for displayLarge
        fontWeight: FontWeight.w700, // Regular weight
      ),
      // Display Medium: Slightly smaller than displayLarge
      displayMedium: GoogleFonts.dmSans(
        fontSize: 45, // Font size for displayMedium
        fontWeight: FontWeight.w400, // Regular weight
      ),
      // Display Small: Smaller than displayMedium
      displaySmall: GoogleFonts.dmSans(
        fontSize: 36, // Font size for displaySmall
        fontWeight: FontWeight.w400, // Regular weight
      ),
      // Headline Large: Used for major headings
      headlineLarge: GoogleFonts.dmSans(
        fontSize: 32, // Font size for headlineLarge
        fontWeight: FontWeight.w400, // Regular weight
      ),
      // Headline Medium: Slightly smaller than headlineLarge
      headlineMedium: GoogleFonts.dmSans(
        fontSize: 28, // Font size for headlineMedium
        fontWeight: FontWeight.w400, // Regular weight
      ),
      // Headline Small: Smaller than headlineMedium
      headlineSmall: GoogleFonts.dmSans(
        fontSize: 24, // Font size for headlineSmall
        fontWeight: FontWeight.w400, // Regular weight
      ),
      // Title Large: Used for large titles
      titleLarge: GoogleFonts.dmSans(
        fontSize: 22, // Font size for titleLarge
        fontWeight: FontWeight.w500, // Medium weight
      ),
      // Title Medium: Used for medium-sized titles
      titleMedium: GoogleFonts.dmSans(
        fontSize: 16, // Font size for titleMedium
        fontWeight: FontWeight.w700, // Medium weight
      ),
      // Title Small: Used for small titles
      titleSmall: GoogleFonts.dmSans(
        fontSize: 14, // Font size for titleSmall
        fontWeight: FontWeight.w500, // Medium weight
      ),
      // Body Large: Used for large body text
      bodyLarge: GoogleFonts.dmSans(
        fontSize: 16, // Font size for bodyLarge
        fontWeight: FontWeight.w400, // Regular weight
      ),
      // Body Medium: Used for standard body text
      bodyMedium: GoogleFonts.dmSans(
        fontSize: 14, // Font size for bodyMedium
        fontWeight: FontWeight.w400, // Regular weight
      ),
      // Body Small: Used for small body text
      bodySmall: GoogleFonts.dmSans(
        fontSize: 12, // Font size for bodySmall
        fontWeight: FontWeight.w400, // Regular weight
      ),
      // Label Large: Used for large labels (e.g., buttons)
      labelLarge: GoogleFonts.dmSans(
        fontSize: 14, // Font size for labelLarge
        fontWeight: FontWeight.w500, // Medium weight
      ),
      // Label Medium: Used for medium-sized labels
      labelMedium: GoogleFonts.dmSans(
        fontSize: 12, // Font size for labelMedium
        fontWeight: FontWeight.w500, // Medium weight
      ),
      // Label Small: Used for small labels
      labelSmall: GoogleFonts.dmSans(
        fontSize: 11, // Font size for labelSmall
        fontWeight: FontWeight.w500, // Medium weight
      ),
    );
  }
}
