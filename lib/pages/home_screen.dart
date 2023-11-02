import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(
    this.breadsData, {
    super.key,
  });
  final Map breadsData;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedValue = '';
  String selectedSubBreed = '';
  late final String subBreedSelectOptionString;
  List breadsList = [];
  bool randomButtonLoading = false;
  bool showAllButtonLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        backgroundWidget(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: bodyWidget(),
        ),
      ],
    );
  }

  Widget backgroundWidget() {
    return Stack(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height,
        ),
        Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.white.withOpacity(.95),
        ),
      ],
    );
  }

  Widget bodyWidget() {
    return Container();
  }
}
