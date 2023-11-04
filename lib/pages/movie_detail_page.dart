import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_db_app/bloc/genere_bloc/genere_bloc.dart';
import 'package:movies_db_app/models/movie_model.dart';
import 'package:movies_db_app/utils/assets_strings.dart';
import 'package:movies_db_app/utils/my_datetime_parser.dart';

class MovieDetailPage extends StatefulWidget {
  const MovieDetailPage(this.movie, {super.key});
  final MovieModel movie;

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                posterContainer(),
                descriptionContainer(),
              ],
            ),
          ),
          backButton(),
        ],
      ),
    );
  }

  Widget backButton() {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: const EdgeInsets.only(
          top: 60,
          left: 13,
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.arrow_back_ios_new,
                size: 18,
                color: Colors.white,
              ),
              /* Container(
                      width: 15,
                    ), */
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Text(
                  'Watch',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget posterContainer() {
    return Container(
      height: 466,
      color: Colors.green,
      child: Stack(
        children: [
          posterImage(),
          shadowWidget(),
          ticketAndTrailerButton(),
        ],
      ),
    );
  }

  Widget ticketAndTrailerButton() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            width: 102,
            child: Image.asset(
              AssetString().kingsPic,
            ),
          ),
          Container(
            height: 6,
          ),
          Text(
            'In theaters ${MyDateFormat().parseToString(widget.movie.releaseDate, parseFrom: 'yyyy-MM-dd', parseTo: 'MMMM dd,yyyy')}',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            height: 15,
          ),
          customButtons(
            fillColor: const Color(0xff61C3F2),
            text: 'Get Tickets',
          ),
          Container(
            height: 10,
          ),
          customButtons(
            text: 'Watch Trailer',
            icon: const Icon(
              Icons.play_arrow,
              color: Colors.white,
            ),
            fillColor: Colors.transparent,
            borderColor: const Color(0xff61C3F2),
          ),
          Container(
            height: 34,
          ),
        ],
      ),
    );
  }

  Widget shadowWidget() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 359,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black.withOpacity(.5),
            ],
          ),
        ),
      ),
    );
  }

  Widget posterImage() {
    return Row(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            AssetString().poster,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }

  Widget customButtons({
    Color? fillColor,
    Color? borderColor,
    String text = '',
    Icon? icon,
  }) {
    return Container(
      height: 50,
      width: 243,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor ?? Colors.transparent,
        ),
        borderRadius: BorderRadius.circular(10),
        color: fillColor ?? Colors.white,
      ),
      padding: const EdgeInsets.symmetric(),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon ?? Container(),
          Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget descriptionContainer() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 27,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 14.0),
            child: Text(
              'Genres',
              style: TextStyle(),
            ),
          ),
          BlocBuilder<GenereBloc, GenereState>(
            builder: (context, state) {
              if (state is GenereInitial) {
                return Container();
              }
              List geners = (state as GenereLoadedState).genere;
              return Padding(
                padding: const EdgeInsets.only(
                  bottom: 22,
                ),
                child: Row(
                  children: List.generate(
                    (widget.movie.genreIds ?? []).length,
                    (index) {
                      String genereString = '';
                      geners.asMap().forEach((key, value) {
                        if (value["id"] == widget.movie.genreIds![index]) {
                          genereString = value['name'];
                        }
                      });
                      return genereTypeWidget(genereString);
                    },
                  ),
                ),
              );
            },
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.only(
              top: 15.0,
              bottom: 14,
            ),
            child: Text(
              'Overview',
            ),
          ),
          Text(
            widget.movie.overview,
            // "As a collection of history's worst tyrants and criminal masterminds gather to plot a war to wipe out millions, one man must race against time to stop them. Discover the origins of the very first independent intelligence agency in The King's Man. The Comic Book “The Secret Service” by Mark Millar and Dave Gibbons.",
            style: const TextStyle(
              color: Color(0xff8F8F8F),
            ),
          ),
          Container(
            height: 30,
          ),
        ],
      ),
    );
  }

  Widget genereTypeWidget(String title) {
    return Container(
      margin: const EdgeInsets.only(
        right: 5,
      ),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 2,
        ),
        child: Text(
          title,
          // 'Action',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
