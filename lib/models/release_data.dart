import 'music.dart';

class ReleaseData {
  final List<Music> _releases = const [
    Music(
      id: 0,
      title: "Bcos U Will Never B Free",
      artist: "Rex Orange County",
      albumArt: "assets/images/bcos.jpg",
      releaseDate: "September 4",
      tracks: [
        "Rex (Intro)",
        "Paradise",
        "Belly (The Grass Stains)",
        "Corduroy Dreams",
        "Japan",
        "Portrait of Ned",
        "Green Eyes, Pt.II",
        "A Song About Being Sad",
        "Know Love",
        "Curfew...",
      ],
    ),
    Music(
      id: 1,
      title: "Fuzzy Brain",
      artist: "Dayglow",
      albumArt: "assets/images/fuzzybrain.jpg",
      releaseDate: "September 28",
      tracks: [
        "False Direction",
        "Can I Call You Tonight",
        "Hot Rod",
        "Run the World!!!",
        "Fair Game",
        "Dear Friend,",
        "Fuzzybrain",
        "Junior Varsity",
        "Nicknames",
        "Listerine",
      ],
    ),
    Music(
      id: 2,
      title: "Malibu",
      artist: "Anderson .Paak",
      albumArt: "assets/images/malibu.jpg",
      releaseDate: "January 15",
      tracks: [
        "The Bird",
        "Heart Don't Stand a Chance",
        "The Waters (feat. BJ the Chicago Kid)",
        "The Season | Carry Me",
        "Put Me Thru",
        "Am I Wrong (feat. ScHoolboy Q)",
        "Without You (feat. Rapsody)",
        "Parking Lot",
        "Lite Weight (feat. The Free Nationals)",
        "Room in Her (feat. The Game & Sonyae)",
        "Water Fall (Interluuube)",
        "Your Prime",
        "Come Down",
        "Silicon Valley",
        "Celebrate",
        "The Dreamer (feat.Talib Kweli & Timan Family Choir)",
      ],
    ),
    Music(
      id: 3,
      title: "Bye",
      artist: "Jaden",
      albumArt: "assets/images/bye.png",
      releaseDate: "June 21",
      tracks: [
        "Bye",
      ],
    ),
  ];

  List<Music> get releases {
    return [..._releases];
  }
}
