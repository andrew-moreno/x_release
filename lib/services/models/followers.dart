import 'package:flutter/foundation.dart';

@immutable
class Followers {
  final dynamic href;
  final int? total;

  const Followers({this.href, this.total});

  @override
  String toString() => 'Followers(href: $href, total: $total)';

  factory Followers.fromJson(Map<String, dynamic> json) => Followers(
        href: json['href'],
        total: json['total'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'href': href,
        'total': total,
      };

  Followers copyWith({
    dynamic href,
    int? total,
  }) {
    return Followers(
      href: href ?? this.href,
      total: total ?? this.total,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Followers && other.href == href && other.total == total;
  }

  @override
  int get hashCode => href.hashCode ^ total.hashCode;
}
