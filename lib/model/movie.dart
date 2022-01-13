import 'package:get_it/get_it.dart';
import 'package:movie_app/model/app_config.dart';

class Movie {
  final String name;
  final String language;
  final bool isAdult;
  final String description;
  final String poster_path;
  final String backdrop_path;
  final num rating;
  final String release_date;

  Movie(
      {required this.name,
      required this.backdrop_path,
      required this.description,
      required this.isAdult,
      required this.language,
      required this.poster_path,
      required this.rating,
      required this.release_date});

  factory Movie.fromJson(Map<String, dynamic> _json) {
    return Movie(
      name: _json['title'],
      language: _json['original_language'],
      isAdult: _json['adult'],
      description: _json['overview'],
      poster_path: _json['poster_path'],
      backdrop_path: _json['backdrop_path'],
      rating: _json['vote_average'],
      release_date: _json['release_date'],
    );
  }

  String posterURL() {
    final AppConfig _appConfig = GetIt.instance.get<AppConfig>();
    return '${_appConfig.BASE_IMAGE_API_URL}$poster_path';
  }
}
