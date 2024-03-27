import 'package:flutter/material.dart';
import 'package:flutter_full_learn/models/movies_model.dart';
import 'package:flutter_full_learn/showTrack/constants.dart';
import 'package:flutter_full_learn/showTrack/movies_database_provider.dart';

import 'package:fluttertoast/fluttertoast.dart';

class DetailPage extends StatelessWidget {
  final MoviesTMDB movie;
  final movieDatabaseHelper = MovieDatabaseProvider();

  DetailPage({Key? key, required this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          movie.title,
          maxLines: 3,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Image.network(
              '${Constants.imagePath}${movie.posterPath}',
              width: MediaQuery.of(context).size.width,
              height: 320,
            ),
            const SizedBox(height: 20),
            Text(movie.title),
            Text("Year: ${movie.releaseDate}"),
            SingleChildScrollView(
              //neden çalışmıyor?
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("About: ${movie.overview}"),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.extended(
            heroTag: "btn1",
            onPressed: () async {
              
              MovieDatabaseProvider movieProvider = MovieDatabaseProvider();
              await movieProvider.open();
              bool result = await movieProvider.insert(movie.id, movie);
              if (result) {
                // Ekleme başarılı
                Fluttertoast.showToast(
                    msg: "Added to list",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0);
              } else {
                Fluttertoast.showToast(
                    msg: "not added to list",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0);
              }
            },
            label: const Text('Izlediklerime ekle'),
            icon: const Icon(Icons.add),
          ),
          const SizedBox(width: 5),
          FloatingActionButton.extended(
            heroTag: "btn2",
            onPressed: () {
              Fluttertoast.showToast(
                  msg: "added to watch list",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0);
            },
            label: const Text('Izleneceklere ekle'),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
