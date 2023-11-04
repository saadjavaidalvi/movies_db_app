import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_db_app/bloc/genere_bloc/genere_bloc.dart';
import 'package:movies_db_app/bloc/upcoming_movies/upcoming_movies_bloc.dart';
import 'package:movies_db_app/middlewares/movie_services.dart';
import 'package:movies_db_app/models/movie_model.dart';
import 'package:movies_db_app/pages/tabs_screen.dart';
import 'package:movies_db_app/utils/assets_strings.dart';

class SpashScreen extends StatefulWidget {
  const SpashScreen({super.key});

  @override
  State<SpashScreen> createState() => _SpashScreenState();
}

class _SpashScreenState extends State<SpashScreen> {
  bool isLoading = true;
  Map breadsData = {};
  List<MovieModel> moviesList = [];

  @override
  void initState() {
    super.initState();
    MovieServices().getupcomingMovies().then((value) {
      isLoading = false;
      moviesList = value;
      context
          .read<UpcomingMoviesBloc>()
          .add(UpcomingMoviesLoadedEvent(moviesList));

      setState(() {});
    });
    MovieServices().getAllGenere().then((value) {
      context.read<GenereBloc>().add(GenereLoadedEvent(value));
    });
  }

  @override
  Widget build(BuildContext context) {
    return !isLoading
        ? const TabsScreen()
        : Scaffold(
            backgroundColor: Colors.white,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      AssetString().cameraRolling,
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}
