// To parse this JSON data, do
//
//     final servicesModel = servicesModelFromJson(jsonString);

ServicesModel servicesModelFromJson(final data) => ServicesModel.fromJson(
      data,
    );

Map<String, dynamic> servicesModelToJson(ServicesModel data) => data.toJson();

class ServicesModel {
  List<Result>? results;

  ServicesModel({
    this.results,
  });

  factory ServicesModel.fromJson(Map<String, dynamic> json) => ServicesModel(
        results: json["results"] == null
            ? []
            : List<Result>.from(
                json["results"]!.map(
                  (x) => Result.fromJson(x),
                ),
              ),
      );

  Map<String, dynamic> toJson() => {
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
  String? title;
  String? icon;

  Result({
    this.slug,
    this.title,
    this.icon,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        slug: json["slug"],
        title: json["title"],
        icon: json["icon"],
      );

  Map<String, dynamic> toJson() => {
        "slug": slug,
        "title": title,
        "icon": icon,
      };
}
