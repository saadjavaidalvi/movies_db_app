import 'package:flutter_dotenv/flutter_dotenv.dart';

class CustomUrls {
  static String baseUrl = 'https://api.themoviedb.org/3/';
  static String upcomingMovies = '${baseUrl}movie/upcoming';
  static String generes = '${baseUrl}genre/movie/list?language=en';

  final headers = {
    "accept": "application/json",
    "Authorization": dotenv.env['MoviesAuthToken'] ?? '',
  };
}
