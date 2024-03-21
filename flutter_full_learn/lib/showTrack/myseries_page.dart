import 'package:flutter/material.dart';




class MySeriesPage extends StatelessWidget {
   final String? title;
  final int? year;
  final String? urlImage;

  const MySeriesPage({Key? key, this.title, this.year, this.urlImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("My watched series list"),
        centerTitle: true,
      ),

      body: Column(
  children: [
   Card(
  elevation: 20,
  color: Colors.green,
  child: Container(
    width: double.infinity,
    padding: EdgeInsets.all(3.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Image.network(
            urlImage ?? 'https://image.tmdb.org/t/p/w500/1E5baAaEse26fej7uHcjOgEE2t2.jpg',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 8.0),
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title ?? "Series name",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 8.0),
              Text(year != null ? "Year: $year" : "Season year"),
                            SizedBox(height: 8.0),

              Text("season 1")
            ],
          ),
        ),
        SizedBox(width: 8.0),
        
           Column(
             children: [
              
               
               Padding(
                 padding: const EdgeInsets.only(top: 56),
                 child: ElevatedButton(
                  onPressed: () {
                    
                  },
                  child: Text('delete'),
                           
                         ),
               ),
             ],
           ),
      ],
    ),
  ),
),


  ],
),


      
    );
  }
}