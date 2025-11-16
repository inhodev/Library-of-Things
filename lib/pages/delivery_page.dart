import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeliveryPage extends StatefulWidget {
  const DeliveryPage({super.key});

  @override
  State<DeliveryPage> createState() => _DeliveryPageState();
}

class _DeliveryPageState extends State<DeliveryPage> {
  final TextEditingController _card1Controller = TextEditingController();
  final TextEditingController _card2Controller = TextEditingController();
  final TextEditingController _card3Controller = TextEditingController();
  final TextEditingController _card4Controller = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  bool _isPaymentCompleted = false;
  String _deliveryStatus = 'Not In Transit'; // 초기 상태: 배송 중 아님
  String _currentAddress = '123 University Street, Incheon, South Korea';

  @override
  void initState() {
    super.initState();
    _addressController.text = _currentAddress;
  }

  @override
  void dispose() {
    _card1Controller.dispose();
    _card2Controller.dispose();
    _card3Controller.dispose();
    _card4Controller.dispose();
    _addressController.dispose();
    super.dispose();
  }

  void _showEditAddressDialog() {
    _addressController.text = _currentAddress;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color(0xFFFCFAF7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          title: Text(
            'Edit Delivery Address',
            style: GoogleFonts.inter(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: const Color(0xFF1C140D),
            ),
          ),
          content: TextField(
            controller: _addressController,
            maxLines: 3,
            decoration: InputDecoration(
              hintText: 'Enter your delivery address',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Color(0xFFE8D6CF)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Color(0xFFF07538)),
              ),
            ),
            style: GoogleFonts.inter(
              fontSize: 16,
              color: const Color(0xFF1C140D),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  color: const Color(0xFF99734D),
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _currentAddress = _addressController.text;
                });
                Navigator.of(context).pop();
              },
              child: Text(
                'Save',
                style: GoogleFonts.inter(
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
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(bottom: 80), // Much more bottom padding
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Main Header - LOT
            Container(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
              child: Center(
                child: Text(
                  'LOT',
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1C140D), // #1c140d
                    height: 23 / 18, // line height
                  ),
                ),
              ),
            ),

            // Header - Delivery Address Section
              Container(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                          // Delivery Address Title
                          Text(
                            'Address',
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF1C140D), // #1c140d
                              height: 23 / 18, // line height
                            ),
                          ),
                        // Registration Button
                        GestureDetector(
                          onTap: _showEditAddressDialog,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF07538), // #f07538
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Text(
                              'Edit Address',
                              style: GoogleFonts.inter(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                height: 18 / 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    // Address Text
                    Text(
                      _currentAddress,
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                        color: const Color(0xFF99734D), // #99734d
                        height: 21 / 14, // line height
                      ),
                    ),
                  ],
                ),
              ),

              // Product Card (only show if payment not completed)
              if (!_isPaymentCompleted) Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    // Product Image
                    Container(
                      width: 56,
                      height: 56,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/dummy_data/Hoodie.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Product Info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Inha University Hoodie',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF1C140D), // #1c140d
                              height: 24 / 16, // line height
                            ),
                          ),
                          Text(
                            '7 days',
                            style: GoogleFonts.inter(
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

              // Delivery Status Section Title
              Container(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  'Delivery Status',
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1C140D), // #1c140d
                    height: 23 / 18, // line height
                  ),
                ),
              ),

              // Delivery Status Card
              Container(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    // Status Icon Container
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF2EDE8), // #f2ede8
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.local_shipping,
                        size: 24,
                        color: Color(0xFF1C140D), // #1c140d
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Status Info
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _deliveryStatus,
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF1C140D), // #1c140d
                              height: 24 / 16, // line height
                            ),
                          ),
                          // Only show estimated arrival when in transit
                          if (_deliveryStatus != 'Not In Transit') ...[
                            Text(
                              'Estimated Arrival: 2:00 PM',
                              style: GoogleFonts.inter(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: const Color(0xFF99734D), // #99734d
                                height: 21 / 14, // line height
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Payment Section Title
              Container(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Text(
                  'Payment',
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF1C140D), // #1c140d
                    height: 23 / 18, // line height
                  ),
                ),
              ),

              // Card Number Inputs (4 fields)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    // Card 1
                    Expanded(
                      child: Container(
                        height: 56,
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF2EDE8), // #f2ede8
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextField(
                          controller: _card1Controller,
                          maxLength: 4,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          obscureText: true,
                          obscuringCharacter: '●',
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            counterText: '',
                            contentPadding: EdgeInsets.symmetric(vertical: 18),
                          ),
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            color: const Color(0xFF1C140D), // #1c140d
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    // Card 2
                    Expanded(
                      child: Container(
                        height: 56,
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF2EDE8), // #f2ede8
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextField(
                          controller: _card2Controller,
                          maxLength: 4,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          obscureText: true,
                          obscuringCharacter: '●',
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            counterText: '',
                            contentPadding: EdgeInsets.symmetric(vertical: 18),
                          ),
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            color: const Color(0xFF1C140D), // #1c140d
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    // Card 3
                    Expanded(
                      child: Container(
                        height: 56,
                        margin: const EdgeInsets.only(right: 8),
                        decoration: BoxDecoration(
                          color: const Color(0xFFF2EDE8), // #f2ede8
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextField(
                          controller: _card3Controller,
                          maxLength: 4,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          obscureText: true,
                          obscuringCharacter: '●',
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            counterText: '',
                            contentPadding: EdgeInsets.symmetric(vertical: 18),
                          ),
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            color: const Color(0xFF1C140D), // #1c140d
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    // Card 4
                    Expanded(
                      child: Container(
                        height: 56,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF2EDE8), // #f2ede8
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextField(
                          controller: _card4Controller,
                          maxLength: 4,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          obscureText: true,
                          obscuringCharacter: '●',
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            counterText: '',
                            contentPadding: EdgeInsets.symmetric(vertical: 18),
                          ),
                          style: GoogleFonts.inter(
                            fontSize: 16,
                            color: const Color(0xFF1C140D), // #1c140d
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Pay Delivery Fee Button
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: GestureDetector(
                  onTap: () {
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
                            'Delivery Request Completed',
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFF1C140D),
                            ),
                          ),
                          content: Text(
                            'Your delivery request has been successfully processed. \nThe item will be prepared soon.',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                              color: const Color(0xFF1C140D),
                            ),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                                setState(() {
                                  _isPaymentCompleted = true;
                                  _deliveryStatus = 'Preparing'; // 상태를 "준비중"으로 변경
                                });
                              },
                              child: Text(
                                'OK',
                                style: GoogleFonts.inter(
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
                  },
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF07538), // #f07538
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'Pay Delivery Fee',
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          height: 21 / 14, // line height
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // Bottom spacing (significantly increased for overflow prevention)
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
