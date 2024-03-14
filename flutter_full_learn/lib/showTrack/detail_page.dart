import 'package:flutter/material.dart';
import 'package:flutter_full_learn/models/movies_tmdb.dart';
import 'package:flutter_full_learn/showTrack/constants.dart';
import 'package:flutter_full_learn/showTrack/film.dart';
import 'package:flutter_full_learn/showTrack/mymovies_page.dart';
import 'package:flutter_full_learn/showTrack/mymovies_provider.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';



class DetailPage extends StatelessWidget {
  
   final MoviesTMDB movie;
  
  const DetailPage({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyMoviesProvider provider = Provider.of<MyMoviesProvider>(context);
    
    return Scaffold(
      appBar: AppBar(
  centerTitle: true,
  title: Text(
    movie.title,
    maxLines:3,
  ),
  leading: IconButton(
    icon: Icon(Icons.arrow_back),
    onPressed: () {
      Navigator.of(context).pop();
    },
  ),
),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Image.network(
              '${Constants.imagePath}${movie.posterPath}',
              width: MediaQuery.of(context).size.width,
              height: 320,
            ),
            SizedBox(height: 20),
            Text("${movie.title}"),
            Text("Year: ${movie.releaseDate}"),
            Text("About: ${movie.overview}"),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.extended(
            onPressed: () {
              //neden çalışmıyor ?
              
           //   provider.addFilm(film);
              Fluttertoast.showToast(
        msg: "Added to list",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
        
           );
            },
            label: Text('Izlediklerime ekle'),
             
            icon: Icon(Icons.add), 
          ),
          SizedBox(width: 5), 
          FloatingActionButton.extended(
            onPressed: () {
              Fluttertoast.showToast(
        msg: "added to watch list",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
        
           );
            },
            
            label: Text('Izleneceklere ekle'), 
            icon: Icon(Icons.add), 
          ),
        ],
      ),
    );
  }
}

