class PropertyImage {
  PropertyImage({
    required this.imageId,
    required this.imageUrl,
  });

  int imageId;
  String imageUrl;

  factory PropertyImage.fromJson(Map<String, dynamic> json) => PropertyImage(
        imageId: json['data']['fileDataID'],
        imageUrl: json['data']['url'],
      );

  Map<String, dynamic> toJson() => {
        "imageId": imageId,
        "imageUrl": imageUrl,
      };
}
