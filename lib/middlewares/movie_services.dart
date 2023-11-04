import 'dart:convert';

import 'package:movies_db_app/models/movie_model.dart';
import 'package:movies_db_app/utils/connectivity_check.dart';
import 'package:movies_db_app/utils/custom_urls.dart';
import 'package:movies_db_app/utils/http_wrapper.dart';

class MovieServices {
  Future<List<MovieModel>> getupcomingMovies({int page = 1}) async {
    bool isConnected = await MyConnection().isConnected();
    if (!isConnected) {
      return [];
    }
    final headers = CustomUrls().headers;
    headers.addAll({
      "page": page.toString(),
    });
    final response = await CustomHttp().get(
      Uri.parse(
        CustomUrls.upcomingMovies,
      ),
      headers: headers,
    );

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);

      List results = responseBody['results'];
      List<MovieModel> moviesList = [];
      for (var i = 0; i < results.length; i++) {
        moviesList.add(MovieModel.fromMap(results[i]));
      }

      return moviesList;
    }

    return [];
  }

  Future<List> getAllGenere({int page = 1}) async {
    bool isConnected = await MyConnection().isConnected();
    if (!isConnected) {
      return [];
    }
    final headers = CustomUrls().headers;
    final response = await CustomHttp().get(
      Uri.parse(
        CustomUrls.generes,
      ),
      headers: headers,
    );

    if (response.statusCode == 200) {
      final responseBody = jsonDecode(response.body);

      List moviesList = responseBody['genres'];

      return moviesList;
    }

    return [];
  }
}
