import 'package:flutter/material.dart';
import 'package:flutter_full_learn/showTrack/models/movies_model.dart';
import 'package:flutter_full_learn/showTrack/constants.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'database/movies_db_helper.dart';

class DetailPage extends StatefulWidget {
  
  final MoviesTMDB movie;

  const DetailPage({Key? key, required this.movie}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  Future<List<MoviesTMDB>>? futureMovies;

   @override
  void initState(){
    super.initState();
  }

  
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.movie.title,
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
            Flex(
              direction: Axis.vertical,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Image.network(
                  '${Constants.imagePath}${widget.movie.posterPath}',
                  width: MediaQuery.of(context).size.width,
                  height: 320,
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.movie.title
                      //aligmentını centerla
                      ),
                ),
                Padding(
                  //neden ? bottomdan padding almıyor
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                  child: Text("Year: ${widget.movie.releaseDate}"),
                ),
              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                      "About: ${widget.movie.overview},${widget.movie.overview},${widget.movie.overview}"),
                ),
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

              MoviesDBHelper dbHelper = MoviesDBHelper();
              int result = await dbHelper.insertMovie(widget.movie);
              print(result);
              if (result > 0) {
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
                    backgroundColor: Colors.red,
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

