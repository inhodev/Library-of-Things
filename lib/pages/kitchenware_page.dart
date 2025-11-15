import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'item_detail_page.dart';

class KitchenwarePage extends StatelessWidget {
  const KitchenwarePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFAF7), // #fcfaf7
      body: SafeArea(
        child: Column(
          children: [
            // Header
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
                        color: Color(0xFF1C120D), // #1c120d
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ),
                  // Title
                  Expanded(
                    child: Text(
                      'Kitchenware',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xFF1C120D), // #1c120d
                        height: 23 / 18, // line height
                      ),
                    ),
                  ),
                  // Right placeholder
                  const SizedBox(width: 48),
                ],
              ),
            ),

            // Items Grid
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.8, // Adjusted aspect ratio for better fit
                  children: const [
                    KitchenwareItem(
                      imageUrl: 'assets/images/dummy_data/knifeset.png',
                      title: 'Knife Set',
                    ),
                    KitchenwareItem(
                      imageUrl: 'assets/images/dummy_data/cuttingboard.png',
                      title: 'Cutting Board',
                    ),
                    KitchenwareItem(
                      imageUrl: 'assets/images/dummy_data/mixingbowls.png',
                      title: 'Mixing Bowls',
                    ),
                    KitchenwareItem(
                      imageUrl: 'assets/images/dummy_data/measuringcups.png',
                      title: 'Measuring Cups',
                    ),
                    KitchenwareItem(
                      imageUrl: 'assets/images/dummy_data/utensilset.png',
                      title: 'Utensil Set',
                    ),
                    KitchenwareItem(
                      imageUrl: 'assets/images/dummy_data/colander.png',
                      title: 'Colander',
                    ),
                    KitchenwareItem(
                      imageUrl: 'assets/images/dummy_data/saladspinner.png',
                      title: 'Salad Spinner',
                    ),
                    KitchenwareItem(
                      imageUrl: 'assets/images/dummy_data/bakingsheet.png',
                      title: 'Baking Sheet',
                    ),
                    KitchenwareItem(
                      imageUrl: 'assets/images/dummy_data/kitchenware.png',
                      title: 'Saucepan',
                    ),
                    KitchenwareItem(
                      imageUrl: 'assets/images/dummy_data/kitchenware.png',
                      title: 'Frying Pan',
                    ),
                    KitchenwareItem(
                      imageUrl: 'assets/images/dummy_data/kitchenware.png',
                      title: 'Dutch Oven',
                    ),
                    KitchenwareItem(
                      imageUrl: 'assets/images/dummy_data/kitchenware.png',
                      title: 'Casserole Dish',
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

class KitchenwareItem extends StatelessWidget {
  final String imageUrl;
  final String title;

  const KitchenwareItem({
    super.key,
    required this.imageUrl,
    required this.title,
  });

  void _navigateToDetail(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ItemDetailPage(
          title: title,
          imageUrl: imageUrl,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigateToDetail(context),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            // Image container (150x150)
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: AssetImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 12),
            // Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Text(
                title,
                style: GoogleFonts.plusJakartaSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF1C120D), // #1c120d
                  height: 20 / 14, // line height
                ),
                textAlign: TextAlign.center,
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
