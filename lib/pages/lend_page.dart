import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'kitchenware_page.dart';

class LendPage extends StatefulWidget {
  const LendPage({super.key});

  @override
  State<LendPage> createState() => _LendPageState();
}

class _LendPageState extends State<LendPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFAF7), // #fcfaf7
      body: SafeArea(
        child: Column(
          children: [
            // Header with title
            Container(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Center(
                child: Text(
                  'Borrow',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1C170D), // #1c170d
                    height: 23 / 18, // line height
                  ),
                ),
              ),
            ),

            // Search bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFFF2EBE8), // #f2ebe8
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    // Search icon container
                    Container(
                      padding: const EdgeInsets.only(left: 16),
                      child: const Icon(
                        Icons.search,
                        size: 24,
                        color: Color(0xFF99734D), // #99734d
                      ),
                    ),
                    // Search text
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          'Search for items',
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 16,
                            color: const Color(0xFF99734D), // #99734d
                            height: 24 / 16, // line height
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Categories title
            Container(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
              child: Text(
                'Categories',
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1C170D), // #1c170d
                  height: 28 / 22, // line height
                ),
              ),
            ),

            // Categories grid
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 2.5, // width/height ratio
                  children: [
                    CategoryCard(
                      imageUrl: 'assets/images/dummy_data/kitchenware.png',
                      title: 'Kitchenware',
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const KitchenwarePage(),
                          ),
                        );
                      },
                    ),
                    CategoryCard(
                      imageUrl: 'assets/images/dummy_data/technology.png',
                      title: 'Technology',
                    ),
                    CategoryCard(
                      imageUrl: 'assets/images/dummy_data/cleaningsupplies.png',
                      title: 'Cleaning Supplies',
                    ),
                    CategoryCard(
                      imageUrl: 'assets/images/dummy_data/books.png',
                      title: 'Books',
                    ),
                    CategoryCard(
                      imageUrl: 'assets/images/dummy_data/clothing.png',
                      title: 'Clothing',
                    ),
                    CategoryCard(
                      imageUrl: 'assets/images/dummy_data/sportsequipment.png',
                      title: 'Sports Equipment',
                    ),
                    CategoryCard(
                      imageUrl: 'assets/images/dummy_data/schoolsupplies.png',
                      title: 'School Supplies',
                    ),
                    CategoryCard(
                      imageUrl: 'assets/images/dummy_data/electronics.png',
                      title: 'Electronics',
                    ),
                    CategoryCard(
                      imageUrl: 'assets/images/dummy_data/homedecor.png',
                      title: 'Home Decor',
                    ),
                    CategoryCard(
                      imageUrl: 'assets/images/dummy_data/travelessentials.png',
                      title: 'Travel Essentials',
                    ),
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

class CategoryCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final VoidCallback? onTap;

  const CategoryCard({
    super.key,
    required this.imageUrl,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFFCFAF7), // #fcfaf7
          border: Border.all(
            color: const Color(0xFFF2EDE8), // #f2ede8
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(17),
        child: Row(
          children: [
            // Image container (40x40)
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 12),
            // Title
            Expanded(
              child: Text(
                title,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF1C170D), // #1c170d
                  height: 20 / 16, // line height
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

