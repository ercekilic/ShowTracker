import 'package:flutter/material.dart';
import 'package:flutter_full_learn/showTrack/widgets/card_design.dart';
import 'package:flutter_full_learn/showTrack/pages/detail_page.dart';
import 'package:flutter_full_learn/showTrack/models/movies_model.dart';

import '../database/movies_db_helper.dart';

class MovieListScreen extends StatefulWidget {
  const MovieListScreen({super.key});

  @override
  MovieListScreenState createState() => MovieListScreenState();
}

class MovieListScreenState extends State<MovieListScreen> {
  late Future<List<MoviesTMDB>> futureMovies;
  MoviesDBHelper dbHelper = MoviesDBHelper();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getDatabaseChanges();
    getMoviesFromDB();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Movies List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Reload',
            onPressed: () {
              setState(() {
                futureMovies = dbHelper.getMovies();
              });
            },
          ),
        ],
      ),
      body: FutureBuilder<List<MoviesTMDB>>(
        future: futureMovies,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No movies found'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    GestureDetector(
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
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: GestureDetector(
                        onTap: () {
                          dbHelper.deleteMovie(snapshot.data![index].id);
                          setState(() {
                            futureMovies = dbHelper.getMovies();
                          });
                        },
                        child: const Icon(Icons.delete),
                      ),
                    ),
                  ],
                );
              },
            );
          }
        },
      ),
    );
  }

  Future<void> getMoviesFromDB() async {
    setState(() {
      futureMovies = dbHelper.getMovies();
    });
  }

  Future<void> getDatabaseChanges() async{
    setState(() {
      dbHelper.getDatabaseChange();
    });
  }
}
