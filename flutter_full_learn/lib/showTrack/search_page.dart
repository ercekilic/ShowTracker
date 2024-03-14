import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_full_learn/api/api_movies.dart';
import 'package:flutter_full_learn/models/movies_tmdb.dart';
import 'package:flutter_full_learn/showTrack/card_design.dart';
import 'package:flutter_full_learn/showTrack/constants.dart';
import 'package:flutter_full_learn/showTrack/film.dart';
import 'package:flutter_full_learn/showTrack/mymovies_page.dart';
import 'package:flutter_full_learn/showTrack/mymovies_provider.dart';
import 'package:flutter_full_learn/showTrack/myplay_page.dart';
import 'package:flutter_full_learn/showTrack/myseries_page.dart';
import 'package:flutter_full_learn/showTrack/detail_page.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
   SearchPage({super.key});
  
  @override
  State<SearchPage> createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
   

   Future<List<MoviesTMDB>> filmDetails = ApiMovies().getDetailMovies("ARA");
   Timer? _debounce;
   void initState() {
    super.initState();
   
   }
  List<Film> films = allFilms;

  void searchFilm(String query){

    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(seconds: 2), () {
      setState(() {
        filmDetails = ApiMovies().getDetailMovies(query);
        
      });
    });
    

    
  
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
                automaticallyImplyLeading: false,
                toolbarHeight: 80,
                title: Text("Search Page"),
                centerTitle: true,
        
      ),    
      // Image.network('https://image.tmdb.org/t/p/w500/1E5baAaEse26fej7uHcjOgEE2t2.jpg'),

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
              child: FutureBuilder(
              future: filmDetails,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                    
                    child: Text("An error occurred: ${snapshot.error},"),
                    
                  );
                } else if (snapshot.hasData) {
                  //       print(snapshot.data![0].title);
                   //       print(snapshot.data![1].title);
                     //       print(snapshot.data![2].title);
                        //       print(snapshot.data![3].title);
                       //       print(snapshot.data![4].title);
                  return  ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index){
                      String filmTitle2 = snapshot.data![index].title;

                      filmTitle2 = snapshot.data![index].title;
                      return 
                        
                         Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                                children: [
                                GestureDetector(
                                  onTap: () {
                                    
                          Navigator.push(
                      context,
                        MaterialPageRoute(builder: (context) => DetailPage(movie: snapshot.data![index])),
                      );
                  
                                    print("tiklandi");
                                  },
                                  
                                  child: Card(
                                    elevation: 20,
                                    color: Colors.orange,
                                    child: Container(
                                    width: 400,
                                    height: 150,
                                    color: Colors.white,
                                      child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                    SizedBox(
                                                      width: 100,
                                                      height: 150,
                                                      child: Image.network(
                                                        '${Constants.imagePath}${snapshot.data![index].posterPath}',
                                                      fit: BoxFit.cover,
                                                        ),
                                                  ),
                                          Expanded(
                                              child: Padding(
                                                  padding: const EdgeInsets.all(5.0),
                                                     child: Column(
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                                        Text(
                                                                            "${snapshot.data![index].title} - ${snapshot.data![index].releaseDate}",
                                                                          style: TextStyle(fontWeight: FontWeight.bold),
                                                                          textAlign: TextAlign.start,
                                                                              maxLines: 2,
                                                                            overflow: TextOverflow.ellipsis,
                                                                        ),
                                                                        const SizedBox(height: 8),
                                                                                  Text(
                                                                            snapshot.data![index].overview,
                                                                            maxLines: 3,
                                                                            overflow: TextOverflow.ellipsis,
                                                                            textAlign: TextAlign.start,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                ),
                          ],
                        );
                      
                    }
                    
                  );
                } else {
                  return Center(child: Text("No film details available."));
                }
              },
            ),
          ),
          
        
            

          //  FutureBuilder(
           //   future: filmDetails,
          //    builder: (context, snapshot){
          //      if(snapshot.hasError){
           //       print(snapshot.error.toString());
          //        return Center(
            //        child:
          //          Text(snapshot.error.toString()),
           //       );
           //     }else if(snapshot.hasData){
           //       final data = snapshot.data;
          //        return Text(data!.title);
          //      }else{
          //        return Text("21 3. else");
          //      }
          //    },)
        ],
        
        ),
    bottomNavigationBar: const BottomAppBarWith4Button(),
    );
  }
}

class BottomAppBarWith4Button extends StatelessWidget {
  const BottomAppBarWith4Button({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const BottomAppBar(
      color: Colors.black,
        child: Row(
          
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SearchButton(),
            MovieButton(),
            SeriesButton(),
            PlayButton(),
            
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
        
        Navigator.push(context, MaterialPageRoute(builder: (context) =>  MyMoviesPage()));
        
      },
    );
  }
}

class SearchButton extends StatelessWidget {
  const SearchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.search),
      onPressed: () {
        
        Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()),);
      },
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return   
       TextField(                          
        onTap: () {
          showSearch(
            context: context,
           delegate: MySearchDelegate());
        },
                    decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search,size: 30,),
                    hintText: 'Search for a Movie or Series',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(width: 0.1),
                    )
                  ),
     //   onChanged: searchFilm,
      );
      
      
  }
}

class MySearchDelegate extends SearchDelegate{
  List<String> searchResults = [
    'brazil',
    'china',
    'USA',
    'Russia'
  ];
  @override
  List<Widget>? buildActions(BuildContext context) {
     {
      IconButton(
      onPressed: (){
        if(query.isEmpty){
          close(context, null);
        }else
        query = '';
      }, 
      icon : const Icon(Icons.clear));
      }
  }

  @override
  Widget? buildLeading(BuildContext context)
      {
      IconButton(
      onPressed: (){
        close(context, null);
      }, 
      icon : const Icon(Icons.arrow_back));
      }
      
  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(query),);
  
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = searchResults.where((searchResult){
      final result = searchResult.toLowerCase();
      final input = query.toLowerCase();
      return result.contains(input);
    }).toList();
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];

        return ListTile(
          title: Text(suggestion),
          onTap: (){
              query = suggestion;
              showResults(context);
          },
        );
      }
    );
  }

  
}