import 'artists.dart';
import 'external_urls.dart';
import 'images.dart';

class Items {
  String? albumGroup;
  String? albumType;
  List<Artists>? artists;
  ExternalUrls? externalUrls;
  String? href;
  String? id;
  List<Images>? images;
  String? name;
  String? releaseDate;
  String? releaseDatePrecision;
  int? totalTracks;
  String? type;
  String? uri;

  Items({
    this.albumGroup,
    this.albumType,
    this.artists,
    this.externalUrls,
    this.href,
    this.id,
    this.images,
    this.name,
    this.releaseDate,
    this.releaseDatePrecision,
    this.totalTracks,
    this.type,
    this.uri,
  });

  factory Items.fromJson(Map<String, dynamic> json) => Items(
        albumGroup: json['album_group'] as String?,
        albumType: json['album_type'] as String?,
        artists: (json['artists'] as List<dynamic>?)
            ?.map((e) => Artists.fromJson(e as Map<String, dynamic>))
            .toList(),
        externalUrls: json['external_urls'] == null
            ? null
            : ExternalUrls.fromJson(
                json['external_urls'] as Map<String, dynamic>),
        href: json['href'] as String?,
        id: json['id'] as String?,
        images: (json['images'] as List<dynamic>?)
            ?.map((e) => Images.fromJson(e as Map<String, dynamic>))
            .toList(),
        name: json['name'] as String?,
        releaseDate: json['release_date'] as String?,
        releaseDatePrecision: json['release_date_precision'] as String?,
        totalTracks: json['total_tracks'] as int?,
        type: json['type'] as String?,
        uri: json['uri'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'album_group': albumGroup,
        'album_type': albumType,
        'artists': artists?.map((e) => e.toJson()).toList(),
        'external_urls': externalUrls?.toJson(),
        'href': href,
        'id': id,
        'images': images?.map((e) => e.toJson()).toList(),
        'name': name,
        'release_date': releaseDate,
        'release_date_precision': releaseDatePrecision,
        'total_tracks': totalTracks,
        'type': type,
        'uri': uri,
      };
}
