import 'package:flutter/foundation.dart';

import 'external_urls.dart';
import 'followers.dart';
import 'images.dart';

@immutable
class Items {
  final ExternalUrls? externalUrls;
  final Followers? followers;
  final List<String>? genres;
  final String? href;
  final String? id;
  final List<Images>? images;
  final String? name;
  final int? popularity;
  final String? type;
  final String? uri;

  const Items({
    this.externalUrls,
    this.followers,
    this.genres,
    this.href,
    this.id,
    this.images,
    this.name,
    this.popularity,
    this.type,
    this.uri,
  });

  @override
  String toString() {
    return 'Items(externalUrls: $externalUrls, followers: $followers, genres: $genres, href: $href, id: $id, images: $images, name: $name, popularity: $popularity, type: $type, uri: $uri)';
  }

  factory Items.fromJson(Map<String, dynamic> json) => Items(
        externalUrls: json['external_urls'] == null
            ? null
            : ExternalUrls.fromJson(
                json['external_urls'] as Map<String, dynamic>),
        followers: json['followers'] == null
            ? null
            : Followers.fromJson(json['followers'] as Map<String, dynamic>),
        genres: json['genres'] as List<String>?,
        href: json['href'] as String?,
        id: json['id'] as String?,
        images: (json['images'] as List<dynamic>?)
            ?.map((e) => Images.fromJson(e as Map<String, dynamic>))
            .toList(),
        name: json['name'] as String?,
        popularity: json['popularity'] as int?,
        type: json['type'] as String?,
        uri: json['uri'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'external_urls': externalUrls?.toJson(),
        'followers': followers?.toJson(),
        'genres': genres,
        'href': href,
        'id': id,
        'images': images?.map((e) => e.toJson()).toList(),
        'name': name,
        'popularity': popularity,
        'type': type,
        'uri': uri,
      };

  Items copyWith({
    ExternalUrls? externalUrls,
    Followers? followers,
    List<String>? genres,
    String? href,
    String? id,
    List<Images>? images,
    String? name,
    int? popularity,
    String? type,
    String? uri,
  }) {
    return Items(
      externalUrls: externalUrls ?? this.externalUrls,
      followers: followers ?? this.followers,
      genres: genres ?? this.genres,
      href: href ?? this.href,
      id: id ?? this.id,
      images: images ?? this.images,
      name: name ?? this.name,
      popularity: popularity ?? this.popularity,
      type: type ?? this.type,
      uri: uri ?? this.uri,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Items &&
        listEquals(other.genres, genres) &&
        listEquals(other.images, images) &&
        other.externalUrls == externalUrls &&
        other.followers == followers &&
        other.href == href &&
        other.id == id &&
        other.name == name &&
        other.popularity == popularity &&
        other.type == type &&
        other.uri == uri;
  }

  @override
  int get hashCode =>
      externalUrls.hashCode ^
      followers.hashCode ^
      genres.hashCode ^
      href.hashCode ^
      id.hashCode ^
      images.hashCode ^
      name.hashCode ^
      popularity.hashCode ^
      type.hashCode ^
      uri.hashCode;
}
