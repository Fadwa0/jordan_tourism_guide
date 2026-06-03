import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/place_model.dart';
import 'favorites_screen.dart';

class DetailsScreen extends StatefulWidget {
  final PlaceModel place;

  const DetailsScreen({super.key, required this.place});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final _store = FavoritesStore.instance;

  @override
  Widget build(BuildContext context) {
    final isSaved = _store.isSaved(widget.place.name);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F4EE),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            backgroundColor: const Color(0xFF1A1A2E),
            leading: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                margin: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.4),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.arrow_back_ios_new,
                    color: Colors.white, size: 18),
              ),
            ),
            // ── Save bookmark button ─────────────────────────────────────
            actions: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _store.toggle(widget.place.name);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        _store.isSaved(widget.place.name)
                            ? '${widget.place.name} saved!'
                            : '${widget.place.name} removed from saved.',
                        style: GoogleFonts.poppins(fontSize: 13),
                      ),
                      duration: const Duration(seconds: 2),
                      backgroundColor: const Color(0xFF1A1A2E),
                      behavior: SnackBarBehavior.floating,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.4),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    isSaved
                        ? Icons.bookmark_rounded
                        : Icons.bookmark_border_rounded,
                    color: isSaved ? const Color(0xFFB8860B) : Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    widget.place.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => _placeholderBg(),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withValues(alpha: 0.15),
                          Colors.black.withValues(alpha: 0.6),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 20),
                  _buildInfoRow(),
                  const SizedBox(height: 20),
                  _buildSection(
                    icon: Icons.description_rounded,
                    title: 'About this Place',
                    child: Text(
                      widget.place.description,
                      style: GoogleFonts.poppins(
                        fontSize: 13.5,
                        color: Colors.grey[700],
                        height: 1.7,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildSection(
                    icon: Icons.info_rounded,
                    title: 'Visit Information',
                    child: Text(
                      widget.place.visitInfo,
                      style: GoogleFonts.poppins(
                        fontSize: 13.5,
                        color: Colors.grey[700],
                        height: 1.7,
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                  _buildBackButton(context),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.place.name,
          style: GoogleFonts.poppins(
            fontSize: 26,
            fontWeight: FontWeight.w800,
            color: const Color(0xFF1A1A2E),
          ),
        ),
        const SizedBox(height: 6),
        Row(
          children: [
            const Icon(Icons.location_on_rounded,
                color: Color(0xFFB8860B), size: 16),
            const SizedBox(width: 4),
            Expanded(
              child: Text(
                widget.place.location,
                style: GoogleFonts.poppins(
                  fontSize: 13,
                  color: Colors.grey[600],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoRow() {
    return Row(
      children: [
        _buildInfoChip(
          icon: Icons.category_rounded,
          label: widget.place.category,
          color: const Color(0xFFB8860B),
        ),
        const SizedBox(width: 10),
        _buildInfoChip(
          icon: Icons.star_rounded,
          label: '${widget.place.rating} / 5.0',
          color: Colors.amber[700]!,
        ),
      ],
    );
  }

  Widget _buildInfoChip({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: 15),
          const SizedBox(width: 6),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required IconData icon,
    required String title,
    required Widget child,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: const Color(0xFFB8860B), size: 18),
              const SizedBox(width: 8),
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontSize: 14,
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

  Widget _buildBackButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back_rounded,
            color: Color(0xFF1A1A2E), size: 18),
        label: Text(
          'Back to All Places',
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: const Color(0xFF1A1A2E),
          ),
        ),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 13),
          side: const BorderSide(color: Color(0xFF1A1A2E), width: 1.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }

  Widget _placeholderBg() {
    return Container(
      color: const Color(0xFF1A1A2E),
      child: const Center(
        child: Icon(Icons.image, color: Colors.white30, size: 60),
      ),
    );
  }
}
