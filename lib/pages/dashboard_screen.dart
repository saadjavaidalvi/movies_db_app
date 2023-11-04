import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_db_app/bloc/upcoming_movies/upcoming_movies_bloc.dart';
import 'package:movies_db_app/models/movie_model.dart';
import 'package:movies_db_app/pages/movie_detail_page.dart';
import 'package:movies_db_app/utils/assets_strings.dart';
import 'package:movies_db_app/utils/custom_text_styles.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({
    super.key,
    this.navigateTo,
  });
  final Function(int)? navigateTo;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 0),
          color: Colors.white,
          height: 110,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 22,
              vertical: 20,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Watch',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    widget.navigateTo!(1);
                  },
                  child: const Icon(
                    Icons.search,
                    size: 19,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: BlocBuilder<UpcomingMoviesBloc, UpcomingMoviesState>(
            builder: (context, state) {
              if (state is UpcomingMoviesInitial) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              final mState = state as UpcomingMoviesLoadedState;
              final movies = mState.moviesList;
              return ListView(
                padding: const EdgeInsets.only(
                  top: 22,
                ),
                children: List.generate(
                  movies.length,
                  (index) => customCard(movies[index]),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget customCard(MovieModel movie) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MovieDetailPage(movie),
            ),
          );
        },
        child: Card(
          margin: EdgeInsets.zero,
          color: Colors.red,
          child: Container(
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                SizedBox(
                  // height: 180,
                  child: Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            AssetString().movieImage,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 70,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(10),
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black,
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    movie.title,
                    style: CustomTextStyle().headings.copyWith(
                          color: Colors.white,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
