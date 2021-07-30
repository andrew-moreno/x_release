class Images {
  int? height;
  String? url;
  int? width;

  Images({this.height, this.url, this.width});

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
}
