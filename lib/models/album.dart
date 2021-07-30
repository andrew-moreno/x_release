class AlbumData {
  final String id;
  final String name;
  final String releaseDate;
  final int totalTracks;
  final String type;
  final List<dynamic> images;

  const AlbumData({
    required this.id,
    required this.name,
    required this.releaseDate,
    required this.totalTracks,
    required this.type,
    required this.images,
  });
}
