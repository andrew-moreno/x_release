import 'package:flutter/foundation.dart';

@immutable
class Cursors {
  final String? after;

  const Cursors({this.after});

  @override
  String toString() => 'Cursors(after: $after)';

  factory Cursors.fromJson(Map<String, dynamic> json) => Cursors(
        after: json['after'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'after': after,
      };

  Cursors copyWith({
    String? after,
  }) {
    return Cursors(
      after: after ?? this.after,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Cursors && other.after == after;
  }

  @override
  int get hashCode => after.hashCode;
}
