class ExternalUrls {
  String? spotify;

  ExternalUrls({this.spotify});

  factory ExternalUrls.fromJson(Map<String, dynamic> json) => ExternalUrls(
        spotify: json['spotify'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'spotify': spotify,
      };
}
