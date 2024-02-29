import 'package:flutter/material.dart';
import 'package:flutter_full_learn/showTrack/film.dart';
import 'package:flutter_full_learn/showTrack/mymovies_page.dart';
import 'package:flutter_full_learn/showTrack/mymovies_provider.dart';
import 'package:provider/provider.dart';


class DetailPageTwo extends StatelessWidget {
  
  Film film ; 
  
  DetailPageTwo({Key? key, required this.film}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyMoviesProvider provider = Provider.of<MyMoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          film.title,
          maxLines:3,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Image.network(
              film.urlImage,
              width: MediaQuery.of(context).size.width,
              height: 320,
            ),
            SizedBox(height: 20),
            Text("${film.title}"),
            Text("Year: ${film.year}"),
            Text("About: ${film.aboutPart}"),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.extended(
            onPressed: () {
             provider.dellFilm(film);
              
            },
            label: Text('DELETE FROM MY LIST'), 
            
          ),
          
          
        ],
      ),
    );
  }
}
