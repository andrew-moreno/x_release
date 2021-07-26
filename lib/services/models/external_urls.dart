import 'package:flutter/foundation.dart';

@immutable
class ExternalUrls {
  final String? spotify;

  const ExternalUrls({this.spotify});

  @override
  String toString() => 'ExternalUrls(spotify: $spotify)';

  factory ExternalUrls.fromJson(Map<String, dynamic> json) => ExternalUrls(
        spotify: json['spotify'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'spotify': spotify,
      };

  ExternalUrls copyWith({
    String? spotify,
  }) {
    return ExternalUrls(
      spotify: spotify ?? this.spotify,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ExternalUrls && other.spotify == spotify;
  }

  @override
  int get hashCode => spotify.hashCode;
}
