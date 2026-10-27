class Venue {
  final String id;
  final String name;
  final String location;
  final String type;
  final int price;
  final double rating;
  final String image;
  final bool isAvailable;

  Venue({
    required this.id,
    required this.name,
    required this.location,
    required this.type,
    required this.price,
    required this.rating,
    required this.image,
    this.isAvailable = true,
  });
}

final List<Venue> venues = [
  Venue(
    id: 'V001',
    name: 'SILMA Sport Center',
    location: 'Jakarta Selatan',
    type: 'Badminton',
    price: 50000,
    rating: 4.8,
    image: 'assets/images/venue1.jpg',
  ),
  Venue(
    id: 'V002',
    name: 'Arena Sport Jakarta',
    location: 'Jakarta Timur',
    type: 'Badminton',
    price: 60000,
    rating: 4.7,
    image: 'assets/images/venue2.jpg',
  ),
  Venue(
    id: 'V003',
    name: 'Champion Court',
    location: 'Jakarta Pusat',
    type: 'Futsal',
    price: 100000,
    rating: 4.9,
    image: 'assets/images/venue3.jpg',
  ),
  Venue(
    id: 'V004',
    name: 'Sport Hall 88',
    location: 'Jakarta Barat',
    type: 'Badminton',
    price: 55000,
    rating: 4.6,
    image: 'assets/images/venue4.jpg',
  ),
];