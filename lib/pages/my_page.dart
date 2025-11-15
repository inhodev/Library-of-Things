import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'rules_safety_page.dart';
import 'report_issue_page.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  int _selectedHistoryTab = 0; // 0: Donations, 1: Borrowings

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFAF7), // #fcfaf7
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Container(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Center(
                  child: Text(
                    'My Page',
                    style: GoogleFonts.plusJakartaSans(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1C140D), // #1c140d
                      height: 23 / 18, // line height
                    ),
                  ),
                ),
              ),

              // Profile Section
              Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    // Profile Image (128x128, circular)
                    Container(
                      width: 128,
                      height: 128,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(64),
                      ),
                      child: const Icon(
                        Icons.person,
                        size: 64,
                        color: Color(0xFF1C140D),
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Profile Info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Name
                          Text(
                            'Ethan Lee',
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF1C140D), // #1c140d
                              height: 28 / 22, // line height
                            ),
                          ),
                          const SizedBox(height: 4),
                          // Student ID
                          Text(
                            'Student ID: 12233456',
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: const Color(0xFF99734D), // #99734d
                              height: 24 / 16, // line height
                            ),
                          ),
                          const SizedBox(height: 4),
                          // Rating
                          Text(
                            '5 stars',
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                              color: const Color(0xFF99734D), // #99734d
                              height: 24 / 16, // line height
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Current Borrowing Section Title
              Container(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  'Current Borrowing',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1C140D), // #1c140d
                    height: 23 / 18, // line height
                  ),
                ),
              ),

              // Current Borrowing Item
              Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    // Book Image
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/dummy_data/Textbook.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Book Info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Textbook: Introduction to Engineering',
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF1C140D), // #1c140d
                              height: 24 / 16, // line height
                            ),
                          ),
                          Text(
                            'Due in 5 days',
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: const Color(0xFF99734D), // #99734d
                              height: 21 / 14, // line height
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // History Section Title
              Container(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  'History',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1C140D), // #1c140d
                    height: 23 / 18, // line height
                  ),
                ),
              ),

              // History Tabs
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    // Donations Tab
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _selectedHistoryTab = 0),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: _selectedHistoryTab == 0
                                    ? const Color(0xFFF07538) // #f07538
                                    : const Color(0xFFF2EDE8), // #f2ede8
                                width: 3,
                              ),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Donations',
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: _selectedHistoryTab == 0
                                    ? const Color(0xFF1C140D) // #1c140d
                                    : const Color(0xFF99734D), // #99734d
                                height: 21 / 14, // line height
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 32),
                    // Borrowings Tab
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _selectedHistoryTab = 1),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: _selectedHistoryTab == 1
                                    ? const Color(0xFFF07538) // #f07538
                                    : const Color(0xFFF2EDE8), // #f2ede8
                                width: 3,
                              ),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Borrowings',
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: _selectedHistoryTab == 1
                                    ? const Color(0xFF1C140D) // #1c140d
                                    : const Color(0xFF99734D), // #99734d
                                height: 21 / 14, // line height
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // History Items (Donations)
              if (_selectedHistoryTab == 0) ...[
                // Calculator Item
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/dummy_data/calculator.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Calculator',
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF1C140D),
                                height: 24 / 16,
                              ),
                            ),
                            Text(
                              'Donated on 2024-05-15',
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: const Color(0xFF99734D),
                                height: 21 / 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

              ],

              // Borrowings Items (when selected)
              if (_selectedHistoryTab == 1) ...[
                // Borrowed Laptop Item
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/dummy_data/technology.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Laptop',
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF1C140D),
                                height: 24 / 16,
                              ),
                            ),
                            Text(
                              'Borrowed on 2024-06-10',
                              style: GoogleFonts.plusJakartaSans(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: const Color(0xFF99734D),
                                height: 21 / 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],

              // Settings Section Title
              Container(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  'Settings',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1C140D), // #1c140d
                    height: 23 / 18, // line height
                  ),
                ),
              ),

              // Language Setting
              Container(
                height: 56,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Language',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xFF1C140D), // #1c140d
                        height: 24 / 16, // line height
                      ),
                    ),
                    Text(
                      'English',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xFF1C140D), // #1c140d
                        height: 24 / 16, // line height
                      ),
                    ),
                  ],
                ),
              ),

              // Rules & Safety Setting
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const RulesSafetyPage(),
                    ),
                  );
                },
                child: Container(
                  height: 56,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rules & Safety',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xFF1C140D), // #1c140d
                          height: 24 / 16, // line height
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 24,
                        color: Color(0xFF1C140D), // #1c140d
                      ),
                    ],
                  ),
                ),
              ),

              // Report an issue Setting
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ReportIssuePage(),
                    ),
                  );
                },
                child: Container(
                  height: 56,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  color: Colors.transparent,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Report an issue',
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: const Color(0xFF1C140D), // #1c140d
                          height: 24 / 16, // line height
                        ),
                      ),
                      const Icon(
                        Icons.arrow_forward_ios,
                        size: 24,
                        color: Color(0xFF1C140D), // #1c140d
                      ),
                    ],
                  ),
                ),
              ),

              // Bottom spacing
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
