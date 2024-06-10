import 'package:flutter/material.dart';
import 'package:flutter_full_learn/showTrack/providers/db_provider.dart';
import 'package:flutter_full_learn/showTrack/widgets/card_design.dart';
import 'package:flutter_full_learn/showTrack/database/movies_db_helper.dart';
import 'package:flutter_full_learn/showTrack/pages/detail_page.dart';
import 'package:flutter_full_learn/showTrack/models/movies_model.dart';
import 'package:provider/provider.dart';

class MySeriesPage extends StatefulWidget {
  const MySeriesPage({super.key});
  @override
  State<MySeriesPage> createState() => _MySeriesPageState();
}

class _MySeriesPageState extends State<MySeriesPage> {
  
  late Future<List<MoviesTMDB>> futureMovies;
  MoviesDBHelper dbHelper = MoviesDBHelper();
  
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("yes");
  }
  
  @override
  void initState() {
    super.initState();
    // DbProvider'ı dinlemek için bir listener ekleyin
    Provider.of<DbProvider>(context, listen: false).addListener(onProviderChange);
print("yes2");
    getShowsFromDB();
  }


  // DbProvider değiştiğinde çağrılacak metot
  void onProviderChange() {
    print("yes3");
    // Future'ı yeniden yükle
    getShowsFromDB();
  }

  @override
  Widget build(BuildContext context) {
    int getX = context.watch<DbProvider>.hashCode;
    print(getX);
    return Scaffold(
      appBar: AppBar(
        title: const Text('My TV shows List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Reload',
            onPressed: () {
              setState(() {
                futureMovies = dbHelper.getShows();
              });
            },
          ),
        ],
      ),
      body: Consumer<DbProvider>(
        builder: (context, dbProvider1, child){
          return FutureBuilder<List<MoviesTMDB>>(
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
                              futureMovies = dbHelper.getShows();
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
        );
        }
        
      ),
    );
  }

  Future<void> getShowsFromDB() async {
    setState(() {
      futureMovies = dbHelper.getShows();
    });
  }
}
