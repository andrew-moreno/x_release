class Music {
  final int id;
  final String title;
  final String artist;
  final String albumArt;
  final String releaseDate;
  final List<String> tracks;

  const Music({
    required this.id,
    required this.title,
    required this.artist,
    required this.albumArt,
    required this.releaseDate,
    required this.tracks,
  });
}
