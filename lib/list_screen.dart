import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'api_request.dart';
import 'movie.dart';
import 'movie_view.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<Movie> movieList = [];

  @override
  void initState() {
    callAPI();
    super.initState();
  }

  callAPI() async {
    var api = APICalls();
    List<Movie> returnedList = await api.getPopularMovies();
    setState(() {
      movieList = returnedList;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (movieList.isEmpty) {
      return const Center(
        child: SpinKitDoubleBounce(
          color: Colors.blue,
        ),
      );
    } else {
      return GridView.builder(
        itemCount: movieList.length,
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, crossAxisSpacing: 4.0,childAspectRatio: (1/1)),
        itemBuilder: (context, index) => MovieView(

          movie: movieList[index],
        ),
      );
    }
  }
}
