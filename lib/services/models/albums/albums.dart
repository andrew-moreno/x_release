import 'items.dart';

class Albums {
  String? href;
  List<Items>? items;
  int? limit;
  String? next;
  int? offset;
  dynamic previous;
  int? total;

  Albums({
    this.href,
    this.items,
    this.limit,
    this.next,
    this.offset,
    this.previous,
    this.total,
  });

  factory Albums.fromJson(Map<String, dynamic> json) => Albums(
        href: json['href'] as String?,
        items: (json['items'] as List<dynamic>?)
            ?.map((e) => Items.fromJson(e as Map<String, dynamic>))
            .toList(),
        limit: json['limit'] as int?,
        next: json['next'] as String?,
        offset: json['offset'] as int?,
        previous: json['previous'],
        total: json['total'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'href': href,
        'items': items?.map((e) => e.toJson()).toList(),
        'limit': limit,
        'next': next,
        'offset': offset,
        'previous': previous,
        'total': total,
      };
}
