import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'kitchenware_page.dart';
import 'item_detail_page.dart';

class ItemData {
  final String name;
  final String imageUrl;
  final String category;
  final String description;

  const ItemData({
    required this.name,
    required this.imageUrl,
    required this.category,
    required this.description,
  });
}

class LendPage extends StatefulWidget {
  const LendPage({super.key});

  @override
  State<LendPage> createState() => _LendPageState();
}

class _LendPageState extends State<LendPage> {
  String _searchQuery = '';
  late List<ItemData> _allItems;
  late List<ItemData> _filteredItems;

  @override
  void initState() {
    super.initState();
    _initializeDummyData();
  }

  void _initializeDummyData() {
    _allItems = [
      // Kitchenware
      const ItemData(
        name: 'Knife Set',
        imageUrl: 'assets/images/dummy_data/knifeset.png',
        category: 'Kitchenware',
        description: 'Professional knife set with razor-sharp blades for all your kitchen needs.',
      ),
      const ItemData(
        name: 'Cutting Board',
        imageUrl: 'assets/images/dummy_data/cuttingboard.png',
        category: 'Kitchenware',
        description: 'Large wooden cutting board perfect for food preparation.',
      ),
      const ItemData(
        name: 'Mixing Bowls',
        imageUrl: 'assets/images/dummy_data/mixingbowls.png',
        category: 'Kitchenware',
        description: 'Set of stainless steel mixing bowls in various sizes.',
      ),
      const ItemData(
        name: 'Measuring Cups',
        imageUrl: 'assets/images/dummy_data/measuringcups.png',
        category: 'Kitchenware',
        description: 'Complete set of measuring cups for precise cooking.',
      ),
      const ItemData(
        name: 'Colander',
        imageUrl: 'assets/images/dummy_data/colander.png',
        category: 'Kitchenware',
        description: 'Stainless steel colander for draining pasta and vegetables.',
      ),
      const ItemData(
        name: 'Salad Spinner',
        imageUrl: 'assets/images/dummy_data/saladspinner.png',
        category: 'Kitchenware',
        description: 'Efficient salad spinner to dry your greens quickly.',
      ),

      // Technology
      const ItemData(
        name: 'Calculator',
        imageUrl: 'assets/images/dummy_data/calculator.png',
        category: 'Technology',
        description: 'Scientific calculator with advanced functions for math and science.',
      ),
      const ItemData(
        name: 'Calculator 2',
        imageUrl: 'assets/images/dummy_data/calculator2.png',
        category: 'Technology',
        description: 'Graphing calculator with advanced computational capabilities.',
      ),

      // Books
      const ItemData(
        name: 'Textbook',
        imageUrl: 'assets/images/dummy_data/Textbook.png',
        category: 'Books',
        description: 'Introduction to Engineering textbook for university students.',
      ),
      const ItemData(
        name: 'Textbook 2',
        imageUrl: 'assets/images/dummy_data/Textbook2.png',
        category: 'Books',
        description: 'Advanced Mathematics textbook with comprehensive examples.',
      ),
      const ItemData(
        name: 'Notebook',
        imageUrl: 'assets/images/dummy_data/notebook.png',
        category: 'Books',
        description: 'College ruled notebook for taking notes and assignments.',
      ),

      // Sports Equipment
      const ItemData(
        name: 'Sports Equipment',
        imageUrl: 'assets/images/dummy_data/sportsequipment.png',
        category: 'Sports Equipment',
        description: 'Various sports equipment including balls and accessories.',
      ),

      // School Supplies
      const ItemData(
        name: 'School Supplies',
        imageUrl: 'assets/images/dummy_data/schoolsupplies.png',
        category: 'School Supplies',
        description: 'Complete set of school supplies for students.',
      ),

      // Electronics
      const ItemData(
        name: 'Electronics',
        imageUrl: 'assets/images/dummy_data/electronics.png',
        category: 'Electronics',
        description: 'Various electronic devices and accessories.',
      ),

      // Home Decor
      const ItemData(
        name: 'Home Decor',
        imageUrl: 'assets/images/dummy_data/homedecor.png',
        category: 'Home Decor',
        description: 'Beautiful home decoration items to enhance your space.',
      ),

      // Travel Essentials
      const ItemData(
        name: 'Travel Essentials',
        imageUrl: 'assets/images/dummy_data/travelessentials.png',
        category: 'Travel Essentials',
        description: 'Essential items for travel and outdoor activities.',
      ),

      // Cleaning Supplies
      const ItemData(
        name: 'Cleaning Supplies',
        imageUrl: 'assets/images/dummy_data/cleaningsupplies.png',
        category: 'Cleaning Supplies',
        description: 'Professional cleaning supplies for thorough cleaning.',
      ),

      // Clothing
      const ItemData(
        name: 'Hoodie',
        imageUrl: 'assets/images/dummy_data/Hoodie.png',
        category: 'Clothing',
        description: 'Comfortable university hoodie for casual wear.',
      ),

      // Baking Sheet
      const ItemData(
        name: 'Baking Sheet',
        imageUrl: 'assets/images/dummy_data/bakingsheet.png',
        category: 'Kitchenware',
        description: 'Non-stick baking sheet perfect for cookies and pastries.',
      ),

      // Utensil Set
      const ItemData(
        name: 'Utensil Set',
        imageUrl: 'assets/images/dummy_data/utensilset.png',
        category: 'Kitchenware',
        description: 'Complete set of kitchen utensils for cooking and baking.',
      ),

      // Bag
      const ItemData(
        name: 'Bag',
        imageUrl: 'assets/images/dummy_data/bag.png',
        category: 'Accessories',
        description: 'Stylish and functional bag for everyday use.',
      ),
    ];
    _filteredItems = _allItems;
  }

  void _onSearchChanged(String query) {
    setState(() {
      _searchQuery = query;
      if (query.isEmpty) {
        _filteredItems = _allItems;
      } else {
        _filteredItems = _allItems.where((item) {
          return item.name.toLowerCase().contains(query.toLowerCase()) ||
                 item.category.toLowerCase().contains(query.toLowerCase()) ||
                 item.description.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }

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
                  'LOT',
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
                    // Search input
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: TextField(
                          onChanged: _onSearchChanged,
                          decoration: InputDecoration(
                            hintText: 'Search for items',
                            hintStyle: GoogleFonts.plusJakartaSans(
                              fontSize: 16,
                              color: const Color(0xFF99734D), // #99734d
                              height: 24 / 16, // line height
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 16,
                            color: const Color(0xFF1C170D), // #1c170d
                            height: 24 / 16, // line height
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Content area - conditional display
            Expanded(
              child: _searchQuery.isEmpty
                  ? _buildCategoriesView()
                  : _buildSearchResultsView(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoriesView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
    );
  }

  Widget _buildSearchResultsView() {
    if (_filteredItems.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off,
              size: 64,
              color: const Color(0xFF99734D),
            ),
            const SizedBox(height: 16),
            Text(
              'No items found',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF1C170D),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Try searching with different keywords',
              style: GoogleFonts.plusJakartaSans(
                fontSize: 14,
                color: const Color(0xFF99734D),
              ),
            ),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Search results title
        Container(
          padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
          child: Text(
            'Search Results (${_filteredItems.length})',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1C170D), // #1c170d
              height: 28 / 22, // line height
            ),
          ),
        ),

        // Search results list
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: _filteredItems.length,
            itemBuilder: (context, index) {
              final item = _filteredItems[index];
              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // Item Image
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: AssetImage(item.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Item Info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name,
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF1C170D),
                              height: 24 / 16,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item.category,
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 14,
                              color: const Color(0xFFF07538), // Orange color for category
                              height: 21 / 14,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            item.description,
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 12,
                              color: const Color(0xFF99734D),
                              height: 18 / 12,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    // Arrow icon
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ItemDetailPage(
                              title: item.name,
                              imageUrl: item.imageUrl,
                            ),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: Color(0xFF99734D),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
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

