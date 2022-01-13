import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:movie_app/model/app_config.dart';
import 'package:movie_app/model/movie.dart';
import 'package:movie_app/services/http_service.dart';

class MovieService {
  final GetIt getIt = GetIt.instance;
  late HTTPService _http;

  MovieService() {
    _http = getIt.get<HTTPService>();
  }

  Future<List<Movie>> getPopularMovies({required int page}) async {
    Response _response =
        await _http.get('/movie/popular', query: {'page': page});
    if (_response.statusCode == 200) {
      Map _data = _response.data;
      List<Movie> _movies = _data['results'].map<Movie>((_movieData) {
        return Movie.fromJson(_movieData);
      }).toList();
    } else {
      throw Exception('Couldnt load popular movies');
    }
    throw Exception('Couldnt load popular movies');
  }
}
