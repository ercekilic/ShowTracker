import 'package:flutter/material.dart';
import 'package:flutter_full_learn/models/movies_tmdb.dart';
import 'package:flutter_full_learn/showTrack/constants.dart';

class MyCardDesign extends StatelessWidget {

  const MyCardDesign({
    super.key,// required this.snapshot, 
  });
  //final AsyncSnapshot snapshot;
  
 
  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context,) {

        return ListView.builder(
          
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            
             Expanded( 
              
               child: Card(
                 color: Colors.amber,
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                   children: [
                     SizedBox(
                      
                       width: MediaQuery.of(context).size.width,
                       height: 150,
                       child: SizedBox(
                        
                     
                        child: Image.network('https://m.media-amazon.com/images/M/MV5BN2EyZjM3NzUtNWUzMi00MTgxLWI0NTctMzY4M2VlOTdjZWRiXkEyXkFqcGdeQXVyNDUzOTQ5MjY@._V1_.jpg',
                      ),
                        
                       ),
                                 ),
                   ],
                 ),
          ),
        ),
      ],
    );
  },
);

      }
    );
  }
}
