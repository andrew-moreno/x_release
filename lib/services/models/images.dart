import 'package:flutter/foundation.dart';

@immutable
class Images {
  final int? height;
  final String? url;
  final int? width;

  const Images({this.height, this.url, this.width});

  @override
  String toString() => 'Images(height: $height, url: $url, width: $width)';

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        height: json['height'] as int?,
        url: json['url'] as String?,
        width: json['width'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'height': height,
        'url': url,
        'width': width,
      };

  Images copyWith({
    int? height,
    String? url,
    int? width,
  }) {
    return Images(
      height: height ?? this.height,
      url: url ?? this.url,
      width: width ?? this.width,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Images &&
        other.height == height &&
        other.url == url &&
        other.width == width;
  }

  @override
  int get hashCode => height.hashCode ^ url.hashCode ^ width.hashCode;
}
