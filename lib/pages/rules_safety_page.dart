import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RulesSafetyPage extends StatelessWidget {
  const RulesSafetyPage({super.key});

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '• ',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 16,
              fontWeight: FontWeight.normal,
              color: const Color(0xFF1C140D),
              height: 24 / 16,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: GoogleFonts.plusJakartaSans(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: const Color(0xFF1C140D),
                height: 24 / 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

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
                      'Rules and Safety Guidelines for Users',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1C140D),
                        height: 30 / 24,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // 1. Borrowing Rules Section
                    Text(
                      '1. Borrowing Rules',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1C140D),
                        height: 23 / 18,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _buildBulletPoint('Users must be registered students of the university.'),
                    _buildBulletPoint('Each item can be borrowed for a limited period (Depends of the item).'),
                    _buildBulletPoint('Users can borrow a maximum number of items at a time (3).'),
                    _buildBulletPoint('Items must be returned on time. Late returns may incur a penalty or temporary borrowing restriction.'),
                    const SizedBox(height: 24),

                    // 2. Item Care Section
                    Text(
                      '2. Item Care',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1C140D),
                        height: 23 / 18,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _buildBulletPoint('Handle all items with care.'),
                    _buildBulletPoint('Clean items before returning if necessary (kitchenware, blankets, etc).'),
                    _buildBulletPoint('Report any damage or malfunction immediately through the app.'),
                    const SizedBox(height: 24),

                    // 3. Safety Guidelines Section
                    Text(
                      '3. Safety Guidelines',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1C140D),
                        height: 23 / 18,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _buildBulletPoint('Follow manufacturer or campus safety instructions for each item.'),
                    _buildBulletPoint('Do not use items for purposes other than intended.'),
                    _buildBulletPoint('Avoid sharing personal items (e.g., headphones, personal electronics) for hygiene reasons.'),
                    _buildBulletPoint('Notify staff if an item is unsafe or broken.'),
                    const SizedBox(height: 24),

                    // 4. Responsibility and Accountability Section
                    Text(
                      '4. Responsibility and Accountability',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1C140D),
                        height: 23 / 18,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _buildBulletPoint('Borrowers are responsible for any lost, stolen or damaged items.'),
                    _buildBulletPoint('Fees may apply for replacing damaged or missing items.'),
                    _buildBulletPoint('Repeated violations may result in loss of borrowing privileges.'),
                    const SizedBox(height: 24),

                    // 5. Community Respect Section
                    Text(
                      '5. Community Respect',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1C140D),
                        height: 23 / 18,
                      ),
                    ),
                    const SizedBox(height: 8),
                    _buildBulletPoint('Treat all users, staff and items with respect.'),
                    _buildBulletPoint('Encourage others to borrow responsibly.'),
                    _buildBulletPoint('Give feedback or suggestions to improve the Library of Things service.'),
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
