import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_full_learn/models/movies_tmdb.dart';
import 'package:flutter_full_learn/showTrack/constants.dart';
import 'package:flutter_full_learn/showTrack/detail_page.dart';

class CardDesign extends StatelessWidget {

  const CardDesign({
    super.key,
    required this.films,
  });

  final Future<List<MoviesTMDB>> films;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
    future: films,
    builder: (context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(child: CircularProgressIndicator());
      } else if (snapshot.hasError) {
        return Center(
          
          child: Text("An error occurred: ${snapshot.error},"),
          
        );
      } else if (snapshot.hasData) {
        
        return  ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index){
    
    
            return 
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
                   width: MediaQuery.of(context).size.width,
                   height: MediaQuery.of(context).size.height/5,
                   color: Colors.white,
                     child: Row(
                         crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                                   SizedBox(
                                     width: MediaQuery.of(context).size.width/4,
                                     height: MediaQuery.of(context).size.height/4,
                                     child: snapshot.data?[index].posterPath != ""
                                        ? Image.network(
                                            '${Constants.imagePath}${snapshot.data?[index].posterPath}',
                                             fit: BoxFit.cover,
                                         )
                                        :  const SizedBox(
                                         
                                         child:  Placeholder(),
)
                                 ),
                         Expanded(
                             child: Padding(
                                 padding: const EdgeInsets.all(5.0),
                                    child: Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                         children: [
                                                       Text(
                                                           "${snapshot.data![index].title} ",
                                                         style: const TextStyle(fontWeight: FontWeight.bold),
                                                         textAlign: TextAlign.start,
                                                           maxLines: 2,
                                                           overflow: TextOverflow.ellipsis,
                                                       ),
                                                       Text(
                                                           snapshot.data![index].releaseDate,
                                                         style: const TextStyle(fontWeight: FontWeight.bold),
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
               );
            
          }
          
        );
      } else if (snapshot.data == null){

        return const Center(child: Text("No film available1."));
      }
      else{
        
        return const Center(child: Text("No film available."));
      }
    },
                );
  }
}
