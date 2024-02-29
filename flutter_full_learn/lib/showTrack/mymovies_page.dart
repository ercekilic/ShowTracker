
import 'package:flutter/material.dart';
import 'package:flutter_full_learn/showTrack/detail_page.dart';
import 'package:flutter_full_learn/showTrack/detail_page_two.dart';
import 'package:flutter_full_learn/showTrack/film.dart';
import 'package:flutter_full_learn/showTrack/mymovies_provider.dart';
import 'package:provider/provider.dart';

import 'search_page.dart';

class MyMoviesPage extends StatefulWidget {

  const MyMoviesPage({Key? key}) : super(key: key);

  @override
  State<MyMoviesPage> createState() => _MyMoviesPageState();
}

class _MyMoviesPageState extends State<MyMoviesPage> {
  @override
  Widget build(BuildContext context) {
            MyMoviesProvider provider = Provider.of<MyMoviesProvider>(context);
            List<Film> films = provider.films;

    return Scaffold(
       appBar: AppBar(
        title: Text("My Movies"),
        centerTitle: true,
        automaticallyImplyLeading: false,
       ),
      body: ListView.builder(
        itemCount: films.length,
        itemBuilder: (context, index) {
          final film = films[index];
          return GestureDetector(
                      onTap: () {
                      
                      Navigator.push(
                      context,
                      MaterialPageRoute(
                         builder: (context) => DetailPageTwo(film: film),
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
      ),
    bottomNavigationBar: const BottomAppBarWith4Button(), 
    );
  }
}
