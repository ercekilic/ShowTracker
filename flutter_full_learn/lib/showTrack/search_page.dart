import 'package:flutter/material.dart';
import 'package:flutter_full_learn/showTrack/film.dart';
import 'package:flutter_full_learn/showTrack/mymovies_page.dart';
import 'package:flutter_full_learn/showTrack/myplay_page.dart';
import 'package:flutter_full_learn/showTrack/myseries_page.dart';
import 'package:flutter_full_learn/showTrack/detail_page.dart';

class SearchPage extends StatefulWidget {
   SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  List<Film> films = allFilms;

  void searchFilm(String query){
    final suggestions = allFilms.where((film){
    final filmTitle = film.title.toLowerCase();
    final input = query.toLowerCase();
    return filmTitle.contains(input);
  }).toList();
  setState(()=> films = suggestions);
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
          child: ListView.builder(
            
            itemCount: films.length,
            itemBuilder: (context,index){
              final film = films[index];
                return GestureDetector(
                      onTap: () {
                      
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                         builder: (context) => DetailPage(film: film),
                          ),
                      );
                      
                       },
                  child: Card(
                        elevation: 20,
                        color: Colors.orange,
                        child :Container(
                          
                          width: 150,
                          height: 150,
                          color: Colors.white,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 100,
                                height:150,
                                child: Image.network(
                  film.urlImage,
                  fit: BoxFit.cover,
                  ),
                  
                                ),
                               Expanded(
                                 child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${film.title} - ${film.year}"),                  
                        const Text(" "),
                        Text(
                         film.aboutPart,
                         maxLines: 2,
                         overflow: TextOverflow.ellipsis,
                         ),
                      ], ),
                  ),
                             ),
                               ),
                            ]
                            ),
                        )
                      ),
                );
            },
            ),),
        ],),
    bottomNavigationBar: const BottomAppBarWith4Button(),
    );
  }
}

class MyCardDesign extends StatelessWidget {

  const MyCardDesign({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      color: Colors.orange,
      child :Container(
        
        width: 1500,
        height: 150,
        color: Colors.white,
        child: Row(
          children: [
            Image.network('https://image.tmdb.org/t/p/w500/1E5baAaEse26fej7uHcjOgEE2t2.jpg'),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Movie name1"),
                  Text("Movie year"),
                  Text("data"),
              
                ],
              ),
            ),
          ]
          ),
      )
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