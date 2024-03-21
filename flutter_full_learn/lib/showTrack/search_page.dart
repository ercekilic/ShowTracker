import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_full_learn/api/api_movies.dart';
import 'package:flutter_full_learn/models/movies_tmdb.dart';

import 'package:flutter_full_learn/showTrack/myplay_page.dart';
import 'package:flutter_full_learn/showTrack/myseries_page.dart';



import 'card_design.dart';

class SearchPage extends StatefulWidget {
   SearchPage({super.key});
  
  @override
  State<SearchPage> createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
   

   Future<List<MoviesTMDB>> films = ApiMovies().getDetailMovies("");


    

   Timer? _debounce;
   
   @override
     void initState() {
    super.initState();
   }

   Future<int> getFilmListSize() async {
  List<MoviesTMDB> movieList = await films;
  return movieList.length;
}
  

  void searchFilm(String query) async {
  if (_debounce?.isActive ?? false) _debounce?.cancel();
  _debounce = Timer(const Duration(seconds: 1), () async {
    List<MoviesTMDB> fetchedMovies = await ApiMovies().getDetailMovies(query);
    setState(() {
      films = Future.value(fetchedMovies);
    });
  });
}



  @override
  Widget build(BuildContext context) {
        
      
    return  Scaffold(
      appBar: AppBar(
                automaticallyImplyLeading: false,
                toolbarHeight: 80,
                title: const Text("Search Page"),
                centerTitle: true,
      ),    
      body:  
      Column(
        children: [
           TextField(                          
        onTap: () {            
                     },
                    decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search,size: 30,),
                    hintText: 'Search for a Movie or Series',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(width: 0.1),
                    )
                  ),
        onChanged: searchFilm,
                          ),
                          
          Expanded(
  child: FutureBuilder<int>(
    future: getFilmListSize(),
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const CircularProgressIndicator();
      } else if (snapshot.hasError) {
        return Text('Error: ${snapshot.error}');
      } else {
        int size = snapshot.data ?? 0;
        return size != 0
            ? CardDesign(films: films)
            : SizedBox(child: Container(color: Colors.amber));
      }
    },
  ),
),
      ],
    ),


    );
  }
}

class PlayButton extends StatelessWidget {
  const PlayButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.play_arrow),
      onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyPlayPage()),);

      },
    );
  }
}

class SeriesButton extends StatelessWidget {
  const SeriesButton({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.tv),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => MySeriesPage()),);
      },
    );
  }
}

class MovieButton extends StatelessWidget {
  
  const MovieButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.movie),
      onPressed: () {
        
        //Navigator.push(context, MaterialPageRoute(builder: (context) =>  MyMoviesPage()));
        
      },
    );
  }
}
