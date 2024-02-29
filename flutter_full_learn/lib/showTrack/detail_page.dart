import 'package:flutter/material.dart';
import 'package:flutter_full_learn/showTrack/film.dart';
import 'package:flutter_full_learn/showTrack/mymovies_page.dart';
import 'package:flutter_full_learn/showTrack/mymovies_provider.dart';
import 'package:provider/provider.dart';
import 'package:fluttertoast/fluttertoast.dart';



class DetailPage extends StatelessWidget {
  
  Film film ; 
  
  DetailPage({Key? key, required this.film}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyMoviesProvider provider = Provider.of<MyMoviesProvider>(context);
    //this is a test
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
              //neden çalışmıyor ?
              Fluttertoast.showToast(
        msg: "This is Center Short Toast",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
              provider.addFilm(film);
            },
            label: Text('Izlediklerime ekle'),
             
            icon: Icon(Icons.add), 
          ),
          SizedBox(width: 5), 
          FloatingActionButton.extended(
            onPressed: () {},
            label: Text('Izleneceklere ekle'), 
            icon: Icon(Icons.add), 
          ),
        ],
      ),
    );
  }
}
