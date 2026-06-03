import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F4EE),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A2E),
        title: Text(
          'About',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 8),
            _buildDeveloperCard(),
            const SizedBox(height: 20),
            _buildAppPurposeCard(),
            const SizedBox(height: 20),
            _buildJordanFactsCard(),
            const SizedBox(height: 20),
            _buildVersionCard(),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  // ── Developer card ──────────────────────────────────────────────────────────
  Widget _buildDeveloperCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1A2E),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 46,
            backgroundColor: const Color(0xFFB8860B),
            child: Text(
              'FA',   // ← بدّل بأول حرفين من اسمك
              style: GoogleFonts.poppins(
                fontSize: 26,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 14),
          Text(
            'Fadwa',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            'Flutter Developer  •  Student',
            style: GoogleFonts.poppins(fontSize: 13, color: Colors.white54),
          ),
        ],
      ),
    );
  }

  // ── App purpose ─────────────────────────────────────────────────────────────
  Widget _buildAppPurposeCard() {
    return _buildCard(
      icon: Icons.travel_explore_rounded,
      title: 'About This App',
      child: Text(
        'Jordan Tourism Guide was built as a final project for the Mobile App Development course. '
        'The app highlights Jordan\'s most iconic destinations — from the ancient city of Petra to the '
        'otherworldly desert of Wadi Rum — giving travellers a clean, easy-to-use reference before and during their trip.',
        style: GoogleFonts.poppins(fontSize: 13, color: Colors.grey[700], height: 1.7),
      ),
    );
  }

  // ── Fun facts about Jordan ───────────────────────────────────────────────────
  Widget _buildJordanFactsCard() {
    final facts = [
      (Icons.public_rounded, 'Jordan is home to 2 UNESCO World Heritage Sites: Petra and Wadi Rum.'),
      (Icons.water_rounded, 'The Dead Sea is the lowest point on Earth at 430 m below sea level.'),
      (Icons.star_rounded, 'Petra is one of the New Seven Wonders of the World.'),
      (Icons.history_edu_rounded, 'Jerash contains some of the best-preserved Roman ruins outside Italy.'),
    ];

    return _buildCard(
      icon: Icons.lightbulb_rounded,
      title: 'Did You Know?',
      child: Column(
        children: facts.asMap().entries.map((entry) {
          final isLast = entry.key == facts.length - 1;
          final fact = entry.value;
          return Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(fact.$1, size: 18, color: const Color(0xFFB8860B)),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      fact.$2,
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: Colors.grey[700],
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
              if (!isLast) const Divider(height: 16),
            ],
          );
        }).toList(),
      ),
    );
  }

  // ── Version / tech ──────────────────────────────────────────────────────────
  Widget _buildVersionCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFB8860B).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.flutter_dash_rounded,
                color: Color(0xFFB8860B), size: 28),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Built with Flutter',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF1A1A2E),
                ),
              ),
              Text(
                'App Version 1.0.0  •  2026',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ── Shared card wrapper ─────────────────────────────────────────────────────
  Widget _buildCard({
    required IconData icon,
    required String title,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: const Color(0xFFB8860B), size: 20),
              const SizedBox(width: 8),
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF1A1A2E),
                ),
              ),
            ],
          ),
          const Divider(height: 16),
          child,
        ],
      ),
    );
  }
}