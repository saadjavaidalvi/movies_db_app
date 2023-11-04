import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_db_app/bloc/genere_bloc/genere_bloc.dart';
import 'package:movies_db_app/bloc/upcoming_movies/upcoming_movies_bloc.dart';
import 'package:movies_db_app/models/movie_model.dart';
import 'package:movies_db_app/utils/custom_text_styles.dart';

class MoviesSearchScreen extends StatefulWidget {
  const MoviesSearchScreen({super.key});

  @override
  State<MoviesSearchScreen> createState() => _MoviesSearchScreenState();
}

class _MoviesSearchScreenState extends State<MoviesSearchScreen> {
  String searchString = '';
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6F6FA),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 55,
                bottom: 25,
              ),
              child: SizedBox(
                height: 52,
                child: TextField(
                  controller: textEditingController,
                  style: CustomTextStyle().smallHeadings.copyWith(
                        height: 1,
                      ),
                  selectionHeightStyle: BoxHeightStyle.max,
                  onChanged: (value) {
                    searchString = value;
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    hintText: 'TV shows, movies and more',
                    hintStyle: CustomTextStyle().smallHeadings.copyWith(
                          color: const Color(0xff202C43).withOpacity(.3),
                        ),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    suffixIcon: searchString.isEmpty
                        ? const SizedBox()
                        : GestureDetector(
                            onTap: () {
                              searchString = '';
                              textEditingController.clear();
                              setState(() {});
                            },
                            child: const Icon(
                              Icons.close,
                              color: Color(0xff202C43),
                            ),
                          ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      /* borderSide: BorderSide(), */
                    ),
                  ),
                ),
              ),
            ),
          ),
          searchString.isEmpty ? genereList() : searchedResults(),
        ],
      ),
    );
  }

  Widget searchedResults() {
    return BlocBuilder<UpcomingMoviesBloc, UpcomingMoviesState>(
      builder: (context, state) {
        if (state is UpcomingMoviesInitial) {
          return Container();
        }

        List<MovieModel> moviesList =
            (state as UpcomingMoviesLoadedState).moviesList;
        moviesList = moviesList
            .where((element) => (element.title.toLowerCase())
                .contains(searchString.toLowerCase()))
            .toList();
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 21,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                    top: 30,
                    bottom: 10,
                  ),
                  child: Text(
                    'Top Results',
                    style: CustomTextStyle().body.copyWith(
                          color: Colors.black,
                        ),
                    textAlign: TextAlign.start,
                  ),
                ),
                const Divider(
                  height: 1,
                ),
                Container(
                  height: 20,
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: List.generate(
                      moviesList.length,
                      (index) => movieListTile(moviesList[index]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget movieListTile(MovieModel movieModel) {
    // print(movieModel.genreIds);
    return Container(
      margin: const EdgeInsets.only(
        bottom: 20,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: 130,
            margin: const EdgeInsets.only(
              right: 21,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black,
            ),
            // child: Image.asset('name'),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movieModel.title,
                  style: CustomTextStyle().body.copyWith(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                ),
                (movieModel.genreIds ?? []).isEmpty
                    ? const SizedBox()
                    : Text(
                        movieModel.genreIds!.first.toString(),
                        style: CustomTextStyle().body.copyWith(
                              color: const Color(0xffDBDBDF),
                              fontSize: 15,
                            ),
                      ),
              ],
            ),
          ),
          const Icon(
            Icons.menu,
            color: Color(0xff61C3F2),
          ),
        ],
      ),
    );
  }

  Widget genereList() {
    return Expanded(
      child: BlocBuilder<GenereBloc, GenereState>(
        builder: (context, state) {
          if (state is GenereInitial) {
            return Container();
          }
          List genereList = (state as GenereLoadedState).genere;
          return GridView.count(
            padding: const EdgeInsets.only(
              top: 25,
              left: 15,
              right: 15,
            ),
            crossAxisCount: 2,
            childAspectRatio: 163 / 100,
            children: List.generate(
              10,
              (index) => gridViewContainer(genereList[index]),
            ),
          );
        },
      ),
    );
  }

  Widget gridViewContainer(Map genere) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 5,
      ),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black,
            ),
            // child: Image.asset('assets/'),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.black.withOpacity(.3),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 20,
              ),
              child: Text(
                genere['name'],
                style: CustomTextStyle().smallHeadings.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
