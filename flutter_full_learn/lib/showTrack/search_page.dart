import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_full_learn/api/api_movies.dart';
import 'package:flutter_full_learn/models/movies_model.dart';
import 'package:flutter_full_learn/showTrack/detail_page.dart';
import 'card_design.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  Future<List<MoviesTMDB>> movies = ApiMovies().getDetailMovies("");

  Timer? _debounce;

  @override
  void initState() {
    super.initState();
  }
  
  void searchMovie(String query) async {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(seconds: 1), () async {
      List<MoviesTMDB> fetchedMovies = await ApiMovies().getDetailMovies(query);
      setState(() {
        movies = Future.value(fetchedMovies);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        title: const Text("Search Page"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
                prefixIcon: const Icon(
                  Icons.search,
                  size: 30,
                ),
                hintText: 'Search for a Movie or Series',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(width: 0.1),
                )),
            onChanged: searchMovie,
          ),
          Expanded(
            child: FutureBuilder<List<MoviesTMDB>>(
              future: movies,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text('Error: ${snapshot.error}'),
                  );
                } else if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailPage(movie: snapshot.data![index]),
                            ),
                          );
                        },
                        child: CardDesign(movie: snapshot.data![index]),
                      );
                    },
                  );
                } else {
                  return const Center(child: Text("No film available."));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
