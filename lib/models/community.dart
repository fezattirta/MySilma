class Community {
  final String id;
  final String title;
  final String sport;
  final String location;
  final String date;
  final String time;
  final int participants;
  final int maxParticipants;
  final String organizer;

  Community({
    required this.id,
    required this.title,
    required this.sport,
    required this.location,
    required this.date,
    required this.time,
    required this.participants,
    required this.maxParticipants,
    required this.organizer,
  });
}

final List<Community> communities = [
  Community(
    id: 'C001',
    title: 'Mabar Badminton Santai',
    sport: 'Badminton',
    location: 'SILMA Sport Center',
    date: '12 Oktober 2026',
    time: '19:00 - 21:00',
    participants: 6,
    maxParticipants: 8,
    organizer: 'Andi',
  ),
  Community(
    id: 'C002',
    title: 'Futsal Weekend',
    sport: 'Futsal',
    location: 'Champion Court',
    date: '13 Oktober 2026',
    time: '16:00 - 18:00',
    participants: 8,
    maxParticipants: 10,
    organizer: 'Rizky',
  ),
];