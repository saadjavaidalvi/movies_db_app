class CustomUrls {
  static String baseUrl = 'https://api.themoviedb.org/3/';
  static String upcomingMovies = '${baseUrl}movie/upcoming';
  static String generes = '${baseUrl}genre/movie/list?language=en';

  final headers = {
    "accept": "application/json",
    "Authorization":
        "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjZGY0YzZhN2I2YTZiZjM4MmNkNTQ3YjY4MGIyNWI3MiIsInN1YiI6IjY1NDNjZTg2NmJlYWVhMDBhYzFlYzg5ZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.uaHnN4jXQwEScI9BwjnyF3DCFhhdmHAayItHMcvSDdk"
  };
}
