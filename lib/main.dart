import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/lend_page.dart';
import 'pages/donate_page.dart';
import 'pages/delivery_page.dart';
import 'pages/my_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Library of Things',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    const LendPage(),
    const DonatePage(),
    const DeliveryPage(),
    const MyPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            color: Color(0xFFFCFAF7), // #fcfaf7
            border: Border(
              top: BorderSide(
                color: Color(0xFFF2EBE8), // #f2ebe8
                width: 1,
              ),
            ),
          ),
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 18), // Increased padding for better spacing
          child: Row(
            children: [
              // Lend Tab
              Expanded(
                child: GestureDetector(
                  onTap: () => _onItemTapped(0),
                  child: Container(
                    color: Colors.transparent,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.library_books,
                          size: 24,
                          color: _selectedIndex == 0 ? const Color(0xFF1C170D) : const Color(0xFF99734D),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Lend',
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: _selectedIndex == 0 ? const Color(0xFF1C170D) : const Color(0xFF99734D),
                            height: 18 / 12, // line height
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8), // gap-[8px]

              // Donate Tab
              Expanded(
                child: GestureDetector(
                  onTap: () => _onItemTapped(1),
                  child: Container(
                    color: Colors.transparent,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.volunteer_activism,
                          size: 24,
                          color: _selectedIndex == 1 ? const Color(0xFF1C170D) : const Color(0xFF99734D),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Donate',
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: _selectedIndex == 1 ? const Color(0xFF1C170D) : const Color(0xFF99734D),
                            height: 18 / 12, // line height
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8), // gap-[8px]

              // Delivery Tab
              Expanded(
                child: GestureDetector(
                  onTap: () => _onItemTapped(2),
                  child: Container(
                    color: Colors.transparent,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.local_shipping,
                          size: 24,
                          color: _selectedIndex == 2 ? const Color(0xFF1C170D) : const Color(0xFF99734D),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Delivery',
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: _selectedIndex == 2 ? const Color(0xFF1C170D) : const Color(0xFF99734D),
                            height: 18 / 12, // line height
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8), // gap-[8px]

              // My Page Tab
              Expanded(
                child: GestureDetector(
                  onTap: () => _onItemTapped(3),
                  child: Container(
                    color: Colors.transparent,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.person,
                          size: 24,
                          color: _selectedIndex == 3 ? const Color(0xFF1C170D) : const Color(0xFF99734D),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'My Page',
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: _selectedIndex == 3 ? const Color(0xFF1C170D) : const Color(0xFF99734D),
                            height: 18 / 12, // line height
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
