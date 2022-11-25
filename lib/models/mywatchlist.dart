// To parse this JSON data, do
//
//     final mywatchlist = mywatchlistFromJson(jsonString);

import 'dart:convert';

List<Mywatchlist> mywatchlistFromJson(String str) => List<Mywatchlist>.from(json.decode(str).map((x) => Mywatchlist.fromJson(x)));

String mywatchlistToJson(List<Mywatchlist> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Mywatchlist {
    Mywatchlist({
        required this.model,
        required this.pk,
        required this.fields,
    });

    Model? model;
    int pk;
    Fields fields;

    factory Mywatchlist.fromJson(Map<String, dynamic> json) => Mywatchlist(
        model: modelValues.map[json["model"]],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": modelValues.reverse?[model],
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    Fields({
        required this.watchedMovie,
        required this.movieName,
        required this.movieRating,
        required this.movieDate,
        required this.movieReview,
    });

    bool watchedMovie;
    String movieName;
    int movieRating;
    DateTime movieDate;
    String movieReview;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        watchedMovie: json["watched_movie"],
        movieName: json["movie_name"],
        movieRating: json["movie_rating"],
        movieDate: DateTime.parse(json["movie_date"]),
        movieReview: json["movie_review"],
    );

    Map<String, dynamic> toJson() => {
        "watched_movie": watchedMovie,
        "movie_name": movieName,
        "movie_rating": movieRating,
        "movie_date": "${movieDate.year.toString().padLeft(4, '0')}-${movieDate.month.toString().padLeft(2, '0')}-${movieDate.day.toString().padLeft(2, '0')}",
        "movie_review": movieReview,
    };
}

enum Model { MYWATCHLIST_MYWATCHLISTITEM }

final modelValues = EnumValues({
    "mywatchlist.mywatchlistitem": Model.MYWATCHLIST_MYWATCHLISTITEM
});

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String>? reverseMap;

    EnumValues(this.map);

    Map<T, String>? get reverse {
        reverseMap ??= map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}