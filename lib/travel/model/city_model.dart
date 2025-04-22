class CityModel {
  final String name;
  final String country;
  final String imagePath;
  final double rating;
  final String description;
  final bool isFavorite;
  final List<String> attractions;

  CityModel({
    required this.name,
    required this.country,
    required this.imagePath,
    required this.rating,
    required this.description,
    this.isFavorite = false,
    required this.attractions,
  });
}