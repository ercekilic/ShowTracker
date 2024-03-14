import 'package:flutter/material.dart';
import 'package:flutter_full_learn/showTrack/film.dart';
import 'package:flutter_full_learn/showTrack/mymovies_page.dart';
import 'package:flutter_full_learn/showTrack/mymovies_provider.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DetailPageTwo extends StatefulWidget {
  
  Film film ; 
  
  DetailPageTwo({Key? key, required this.film}) : super(key: key);

  @override
  State<DetailPageTwo> createState() => DetailPageTwoState();
}

class DetailPageTwoState extends State<DetailPageTwo> {
  @override
  Widget build(BuildContext context) {
    MyMoviesProvider provider = Provider.of<MyMoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.film.title,
          maxLines:3,
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Image.network(
              widget.film.urlImage,
              width: MediaQuery.of(context).size.width,
              height: 320,
            ),
            SizedBox(height: 20),
            Text("${widget.film.title}"),
            Text("Year: ${widget.film.year}"),
            Text("About: ${widget.film.aboutPart}"),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.extended(
            onPressed: () {
             provider.dellFilm(widget.film);
              Fluttertoast.showToast(
        msg: "Deleted from list",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0
        
           );
            },
            
            label: Text('DELETE FROM MY LIST'), 
          ),
          
          
        ],
      ),
    );
  }
}
