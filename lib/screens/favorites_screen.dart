import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/place_controller.dart';
import 'details_screen.dart';

// ─── Simple in-memory favorites store ───────────────────────────────────────
class FavoritesStore {
  FavoritesStore._();
  static final FavoritesStore instance = FavoritesStore._();

  final Set<String> _savedNames = {};

  bool isSaved(String placeName) => _savedNames.contains(placeName);

  void toggle(String placeName) {
    if (_savedNames.contains(placeName)) {
      _savedNames.remove(placeName);
    } else {
      _savedNames.add(placeName);
    }
  }

  Set<String> get all => Set.unmodifiable(_savedNames);
}

// ─── Favorites Screen ────────────────────────────────────────────────────────
class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final _store = FavoritesStore.instance;
  final _controller = PlaceController();

  @override
  Widget build(BuildContext context) {
    final savedNames = _store.all;
    final savedPlaces = _controller.places
        .where((p) => savedNames.contains(p.name))
        .toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF8F4EE),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A2E),
        title: Text(
          'Saved Places',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        automaticallyImplyLeading: false,
        actions: savedPlaces.isNotEmpty
            ? [
                TextButton(
                  onPressed: () {
                    for (final p in savedPlaces) {
                      _store.toggle(p.name);
                    }
                    setState(() {});
                  },
                  child: Text(
                    'Clear all',
                    style: GoogleFonts.poppins(
                        color: Colors.white54, fontSize: 12),
                  ),
                )
              ]
            : null,
      ),
      body: savedPlaces.isEmpty ? _buildEmpty() : _buildList(savedPlaces, context),
    );
  }

  Widget _buildEmpty() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              color: const Color(0xFFB8860B).withValues(alpha: 0.08),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.bookmark_border_rounded,
                size: 52, color: const Color(0xFFB8860B).withValues(alpha: 0.4)),
          ),
          const SizedBox(height: 20),
          Text(
            'No saved places yet',
            style: GoogleFonts.poppins(
              fontSize: 17,
              fontWeight: FontWeight.w700,
              color: Colors.grey[500],
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            child: Text(
              'Open any place and tap the bookmark icon to save it here.',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  fontSize: 13, color: Colors.grey[400], height: 1.5),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildList(List savedPlaces, BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 12),
      itemCount: savedPlaces.length,
      itemBuilder: (context, index) {
        final place = savedPlaces[index];
        return GestureDetector(
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DetailsScreen(place: place),
              ),
            );
            setState(() {}); // refresh after returning (unsave possible)
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.07),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                // Thumbnail
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                  ),
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.asset(
                      place.imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        color: const Color(0xFFB8860B).withValues(alpha: 0.1),
                        child: const Center(
                          child: Icon(Icons.image_rounded,
                              color: Color(0xFFB8860B), size: 30),
                        ),
                      ),
                    ),
                  ),
                ),
                // Info
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          place.name,
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: const Color(0xFF1A1A2E),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.location_on_rounded,
                                size: 12, color: Color(0xFFB8860B)),
                            const SizedBox(width: 3),
                            Expanded(
                              child: Text(
                                place.location.split(',').first,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.poppins(
                                    fontSize: 11, color: Colors.grey[500]),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                color: const Color(0xFFB8860B)
                                    .withValues(alpha: 0.12),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                place.category,
                                style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xFFB8860B),
                                ),
                              ),
                            ),
                            const Spacer(),
                            const Icon(Icons.star_rounded,
                                size: 13, color: Colors.amber),
                            const SizedBox(width: 2),
                            Text(
                              place.rating.toString(),
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF1A1A2E),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                // Remove button
                IconButton(
                  icon: const Icon(Icons.bookmark_rounded,
                      color: Color(0xFFB8860B), size: 22),
                  onPressed: () {
                    _store.toggle(place.name);
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
