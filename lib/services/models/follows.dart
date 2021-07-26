import 'package:flutter/foundation.dart';

import 'artists.dart';

@immutable
class Follows {
  final Artists? artists;

  const Follows({this.artists});

  @override
  String toString() => 'Follows(artists: $artists)';

  factory Follows.fromJson(Map<String, dynamic> json) => Follows(
        artists: json['artists'] == null
            ? null
            : Artists.fromJson(json['artists'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'artists': artists?.toJson(),
      };

  Follows copyWith({
    Artists? artists,
  }) {
    return Follows(
      artists: artists ?? this.artists,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Follows && other.artists == artists;
  }

  @override
  int get hashCode => artists.hashCode;
}
