class OfferModel {
  final List<dynamic> images;

  const OfferModel({required this.images});

  factory OfferModel.fromJson(json) {
    return OfferModel(
      images: json['images'] as List<dynamic>,
    );
  }
}
