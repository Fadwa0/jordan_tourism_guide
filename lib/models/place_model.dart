// Base class — Abstraction
abstract class TouristItem {
  String get name;
  String get description;
  double get rating;

  String getSummary() => '$name ⭐ $rating';
}

class PlaceModel extends TouristItem {
  @override
  final String name;
  final String category;
  final String location;
  @override
  final String description;
  final String imageUrl;
  final bool isAsset;
  @override
  final double rating;
  final String visitInfo;

  PlaceModel({
    required this.name,
    required this.category,
    required this.location,
    required this.description,
    required this.imageUrl,
    required this.isAsset,
    required this.rating,
    required this.visitInfo,
  });
}