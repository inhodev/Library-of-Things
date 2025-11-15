import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RulesSafetyPage extends StatelessWidget {
  const RulesSafetyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFAF7), // #fcfaf7
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with back button
            Container(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Row(
                children: [
                  // Back button
                  Container(
                    width: 48,
                    height: 48,
                    alignment: Alignment.center,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 24,
                        color: Color(0xFF1C140D), // #1c140d
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  // Title
                  Expanded(
                    child: Text(
                      'Rules & Safety',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1C140D), // #1c140d
                        height: 23 / 18, // line height
                      ),
                    ),
                  ),
                  // Right placeholder
                  const SizedBox(width: 48),
                ],
              ),
            ),

            // Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Main Title
                    Text(
                      'Terms of Service',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1C140D),
                        height: 30 / 24,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Introduction
                    Text(
                      'By using the Inha Exchange Item Share service, you agree to abide by the following terms and conditions. Failure to comply may result in suspension or termination of your account.',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xFF1C140D),
                        height: 24 / 16,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Late Fees Section
                    Text(
                      'Late Fees',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1C140D),
                        height: 23 / 18,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Items must be returned by the agreed-upon due date. Late returns will incur a fee of \$5 per day, up to a maximum of \$50. Fees must be paid within 7 days of the due date.',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xFF1C140D),
                        height: 24 / 16,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Item Condition Section
                    Text(
                      'Item Condition',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1C140D),
                        height: 23 / 18,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Users are responsible for returning items in the same condition as received, barring normal wear and tear. Damage beyond normal use will result in a repair or replacement fee, determined by the item\'s value and extent of damage.',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xFF1C140D),
                        height: 24 / 16,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Additional spacing at bottom
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
