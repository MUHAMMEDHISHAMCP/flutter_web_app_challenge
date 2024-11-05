import 'dart:math';

class Event {
  final String title;
  final DateTime date;
  final String description;
  final List<Attendee> attendees; // Add this line

  Event({
    required this.title,
    required this.date,
    required this.description,
    List<Attendee>? attendees, // Update constructor
  }) : attendees = attendees ?? []; // Initialize attendees list

  // Event Data
  static final Random _random = Random();

  static List<Event> getSampleEvents() {
    return [
      Event(
        title: "Coding Bootcamp",
        date: getEventDate(10),
        description:
            "Participate in an intensive coding bootcamp to sharpen your skills.",
        attendees: [
          Attendee(username: "coder01", email: "coder01@example.com"),
          Attendee(username: "coder02", email: "coder02@example.com"),
        ],
      ),
      Event(
        title: "Music Festival",
        date: getEventDate(0),
        description:
            "Enjoy live music from various artists at the annual music festival.",
        attendees: [
          Attendee(username: "musicFan01", email: "musicfan01@example.com"),
          Attendee(username: "musicFan02", email: "musicfan02@example.com"),
        ],
      ),
      Event(
        title: "Art Exhibition",
        date: getEventDate(1),
        description:
            "Explore beautiful art pieces by renowned artists around the world.",
        attendees: [
          Attendee(username: "artLover01", email: "artlover01@example.com"),
          Attendee(username: "artLover02", email: "artlover02@example.com"),
        ],
      ),
      Event(
        title: "Tech Conference",
        date: getEventDate(5),
        description:
            "Join industry leaders to discuss the latest trends in technology.",
        attendees: [
          Attendee(username: "techie01", email: "techie01@example.com"),
          Attendee(username: "techie02", email: "techie02@example.com"),
        ],
      ),
      Event(
        title: "Food Carnival",
        date: getEventDate(3),
        description:
            "Taste delicious dishes from various cuisines at our food carnival.",
        attendees: [
          Attendee(username: "foodie01", email: "foodie01@example.com"),
          Attendee(username: "foodie02", email: "foodie02@example.com"),
        ],
      ),
      Event(
        title: "Book Fair",
        date: getEventDate(7),
        description:
            "Discover new books and meet popular authors at the book fair.",
        attendees: [
          Attendee(username: "bookworm01", email: "bookworm01@example.com"),
          Attendee(username: "bookworm02", email: "bookworm02@example.com"),
        ],
      ),
      Event(
        title: "Charity Run",
        date: getEventDate(9),
        description: "Participate in a charity run to support a good cause.",
        attendees: [
          Attendee(username: "runner01", email: "runner01@example.com"),
          Attendee(username: "runner02", email: "runner02@example.com"),
        ],
      ),
      Event(
        title: "Photography Workshop",
        date: getEventDate(12),
        description:
            "Learn photography tips and techniques from professional photographers.",
        attendees: [
          Attendee(username: "photoGuru01", email: "photoGuru01@example.com"),
          Attendee(username: "photoGuru02", email: "photoGuru02@example.com"),
        ],
      ),
      Event(
        title: "Science Fair",
        date: getEventDate(14),
        description:
            "Explore innovative science projects by students and professionals.",
        attendees: [
          Attendee(
              username: "scienceGeek01", email: "scienceGeek01@example.com"),
          Attendee(
              username: "scienceGeek02", email: "scienceGeek02@example.com"),
        ],
      ),
      Event(
        title: "Yoga Retreat",
        date: getEventDate(16),
        description:
            "Relax and rejuvenate with yoga sessions at our weekend retreat.",
        attendees: [
          Attendee(username: "yogi01", email: "yogi01@example.com"),
          Attendee(username: "yogi02", email: "yogi02@example.com"),
        ],
      ),
    ];
  }

  static DateTime getEventDate(int daysAfter) {
    DateTime date = DateTime.now().add(Duration(days: daysAfter));
    int randomHour = _random.nextInt(24); // Random hour between 0 and 23
    int randomMinute = _random.nextInt(60); // Random minute between 0 and 59

    return DateTime(date.year, date.month, date.day, randomHour, randomMinute);
  }
}

class Attendee {
  final String username;
  final String email;

  Attendee({required this.username, required this.email});
}
