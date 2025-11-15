import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReportIssuePage extends StatefulWidget {
  const ReportIssuePage({super.key});

  @override
  State<ReportIssuePage> createState() => _ReportIssuePageState();
}

class _ReportIssuePageState extends State<ReportIssuePage> {
  final TextEditingController _issueController = TextEditingController();
  final TextEditingController _suggestionController = TextEditingController();

  @override
  void dispose() {
    _issueController.dispose();
    _suggestionController.dispose();
    super.dispose();
  }

  void _submitReport() {
    final issue = _issueController.text.trim();
    final suggestion = _suggestionController.text.trim();

    if (issue.isEmpty && suggestion.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter an issue or suggestion')),
      );
      return;
    }

    // Show success dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFFFCFAF7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Text(
            'Report Submitted',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1C140D),
            ),
          ),
          content: Text(
            'Thank you for your feedback. We will review your report and take appropriate action.',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 16,
              color: const Color(0xFF1C140D),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                Navigator.of(context).pop(); // Go back to my page
              },
              child: Text(
                'OK',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFF07538),
                ),
              ),
            ),
          ],
        );
      },
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
                      'Report an Issue',
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
                    // Report Issue Section
                    Text(
                      'Report an Issue',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1C140D),
                        height: 23 / 18,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Please describe the issue you encountered in detail.',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xFF99734D),
                        height: 21 / 14,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Issue Input Field
                    Container(
                      width: double.infinity,
                      height: 120,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF2EBE8), // #f2ebe8
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        controller: _issueController,
                        maxLines: null,
                        expands: true,
                        textAlignVertical: TextAlignVertical.top,
                        decoration: InputDecoration(
                          hintText: 'Describe the issue...',
                          hintStyle: GoogleFonts.plusJakartaSans(
                            fontSize: 16,
                            color: const Color(0xFF99664D), // #99664d
                            height: 24 / 16, // line height
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.all(16),
                        ),
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 16,
                          color: const Color(0xFF1C140D), // #1c120d
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Suggestion Section
                    Text(
                      'Suggestion (Optional)',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1C140D),
                        height: 23 / 18,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Share your suggestions to improve our service.',
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xFF99734D),
                        height: 21 / 14,
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Suggestion Input Field
                    Container(
                      width: double.infinity,
                      height: 120,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF2EBE8), // #f2ebe8
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        controller: _suggestionController,
                        maxLines: null,
                        expands: true,
                        textAlignVertical: TextAlignVertical.top,
                        decoration: InputDecoration(
                          hintText: 'Share your suggestions...',
                          hintStyle: GoogleFonts.plusJakartaSans(
                            fontSize: 16,
                            color: const Color(0xFF99664D), // #99664d
                            height: 24 / 16, // line height
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.all(16),
                        ),
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 16,
                          color: const Color(0xFF1C140D), // #1c120d
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Submit Button
                    Container(
                      width: double.infinity,
                      height: 48,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF07538), // #f07538
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: TextButton(
                        onPressed: _submitReport,
                        child: Text(
                          'Submit Report',
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 24 / 16,
                          ),
                        ),
                      ),
                    ),

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
