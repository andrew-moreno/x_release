import 'package:flutter/foundation.dart';

import 'cursors.dart';
import 'items.dart';

@immutable
class Artists {
  final List<Items>? items;
  final String? next;
  final int? total;
  final Cursors? cursors;
  final int? limit;
  final String? href;

  const Artists({
    this.items,
    this.next,
    this.total,
    this.cursors,
    this.limit,
    this.href,
  });

  @override
  String toString() {
    return 'Artists(items: $items, next: $next, total: $total, cursors: $cursors, limit: $limit, href: $href)';
  }

  factory Artists.fromJson(Map<String, dynamic> json) => Artists(
        items: (json['items'] as List<dynamic>?)
            ?.map((e) => Items.fromJson(e as Map<String, dynamic>))
            .toList(),
        next: json['next'] as String?,
        total: json['total'] as int?,
        cursors: json['cursors'] == null
            ? null
            : Cursors.fromJson(json['cursors'] as Map<String, dynamic>),
        limit: json['limit'] as int?,
        href: json['href'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'items': items?.map((e) => e.toJson()).toList(),
        'next': next,
        'total': total,
        'cursors': cursors?.toJson(),
        'limit': limit,
        'href': href,
      };

  Artists copyWith({
    List<Items>? items,
    String? next,
    int? total,
    Cursors? cursors,
    int? limit,
    String? href,
  }) {
    return Artists(
      items: items ?? this.items,
      next: next ?? this.next,
      total: total ?? this.total,
      cursors: cursors ?? this.cursors,
      limit: limit ?? this.limit,
      href: href ?? this.href,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Artists &&
        other.next == next &&
        other.total == total &&
        other.cursors == cursors &&
        other.limit == limit &&
        other.href == href &&
        listEquals(other.items, items);
  }

  @override
  int get hashCode =>
      items.hashCode ^
      next.hashCode ^
      total.hashCode ^
      cursors.hashCode ^
      limit.hashCode ^
      href.hashCode;
}
