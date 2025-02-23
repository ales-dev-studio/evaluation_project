// To parse this JSON data, do
//
//     final barbersModel = barbersModelFromJson(jsonString);

BarbersModel barbersModelFromJson(final data) => BarbersModel.fromJson(data);

Map<String, dynamic> barbersModelToJson(BarbersModel data) => data.toJson();

class BarbersModel {
  int? count;
  dynamic next;
  dynamic previous;
  List<Result>? results;

  BarbersModel({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory BarbersModel.fromJson(Map<String, dynamic> json) => BarbersModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: json["results"] == null
            ? []
            : List<Result>.from(
                json["results"]!.map(
                  (x) => Result.fromJson(x),
                ),
              ),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": results == null
            ? []
            : List<dynamic>.from(
                results!.map(
                  (x) => x.toJson(),
                ),
              ),
      };
}

class Result {
  String? slug;
  String? fullname;
  bool? isShop;
  String? avatar;
  String? address;
  double? lat;
  double? lon;
  double? rate;
  double? distance;
  bool? isBookmarked;
  String? phoneNumber;
  int? reviewsCount;
  List<String>? services;

  Result({
    this.slug,
    this.fullname,
    this.isShop,
    this.avatar,
    this.address,
    this.lat,
    this.lon,
    this.rate,
    this.distance,
    this.isBookmarked,
    this.phoneNumber,
    this.reviewsCount,
    this.services,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        slug: json["slug"],
        fullname: json["fullname"],
        isShop: json["is_shop"],
        avatar: json["avatar"],
        address: json["address"],
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
        rate: json["rate"],
        distance: json["distance"]?.toDouble(),
        isBookmarked: json["is_bookmarked"],
        phoneNumber: json["phone_number"],
        reviewsCount: json["reviews_count"],
        services: json["services"] == null
            ? []
            : List<String>.from(
                json["services"]!.map((x) => x),
              ),
      );

  Map<String, dynamic> toJson() => {
        "slug": slug,
        "fullname": fullname,
        "is_shop": isShop,
        "avatar": avatar,
        "address": address,
        "lat": lat,
        "lon": lon,
        "rate": rate,
        "distance": distance,
        "is_bookmarked": isBookmarked,
        "phone_number": phoneNumber,
        "reviews_count": reviewsCount,
        "services": services == null
            ? []
            : List<dynamic>.from(
                services!.map((x) => x),
              ),
      };
}
