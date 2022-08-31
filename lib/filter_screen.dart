import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'api_request.dart';
import 'movie.dart';
import 'movie_view.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  @override
  String inputData = "";
  List<Movie> list = [];
  APICalls api = APICalls();

  callApi() async {
    var retlist = await api.SearchforMovies(inputData);
    setState(() {
      list = retlist;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: TextField(
            decoration: InputDecoration(
                icon: Icon(Icons.search),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                labelText: 'Movie Name',
                hintText: 'Enter Movie Name'),
            onChanged: (value) {
              setState(() {
                inputData = value;
              });
              callApi();
            },
          ),
        ),
        Expanded(
          child: GridView.builder(
            itemCount: list.length,
            padding: const EdgeInsets.all(10.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 4.0,childAspectRatio: (1/1)),
            itemBuilder: (context, index) => MovieView(

              movie: list[index],
            ),
          ),
        )
      ],
    );
  }
}
