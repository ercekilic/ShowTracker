import 'package:flutter/material.dart';

import 'search_page.dart';

class MyPlayPage extends StatelessWidget {
  const MyPlayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
                automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text("Continue Watching"),
                   

      ),
      body: Column(
        children: [
            TextField(                          
        onTap: () {
           
        },
                    decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search,size: 30,),
                    hintText: 'Search for a Movie or Series',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: const BorderSide(width: 0.1),
                    )
                  ),
       
      ),
          SizedBox(height: 10,),
            Container(
            color: Colors.amber,
            width: double.infinity,
            height: 150,
            child: Row(
              
              children: [
                                  SizedBox(width: 15,),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHpiX6QwgIOQkRv1NBQZL7x9b7t6QZiMiV83v4o-TIxBeA91CB'),
                  ),
                  SizedBox(width: 30,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHpiX6QwgIOQkRv1NBQZL7x9b7t6QZiMiV83v4o-TIxBeA91CB'),
                  ),
                  SizedBox(width: 30,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHpiX6QwgIOQkRv1NBQZL7x9b7t6QZiMiV83v4o-TIxBeA91CB'),
                  ),   
             ],
            )
            
            ),
            Container(
            color: Colors.amber,
            width: double.infinity,
            height: 150,
            child: Row(
              
              children: [
                  SizedBox(width: 15,),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHpiX6QwgIOQkRv1NBQZL7x9b7t6QZiMiV83v4o-TIxBeA91CB'),
                  ),
                  SizedBox(width: 30,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHpiX6QwgIOQkRv1NBQZL7x9b7t6QZiMiV83v4o-TIxBeA91CB'),
                  ),
                  SizedBox(width: 30,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHpiX6QwgIOQkRv1NBQZL7x9b7t6QZiMiV83v4o-TIxBeA91CB'),
                  ),   
             ],
            )
            
            ),
            Container(
            color: Colors.amber,
            width: double.infinity,
            height: 150,
            child: Row(
              
              children: [
                                          SizedBox(width: 15,),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHpiX6QwgIOQkRv1NBQZL7x9b7t6QZiMiV83v4o-TIxBeA91CB'),
                  ),
                  SizedBox(width: 30,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHpiX6QwgIOQkRv1NBQZL7x9b7t6QZiMiV83v4o-TIxBeA91CB'),
                  ),
                  SizedBox(width: 30,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHpiX6QwgIOQkRv1NBQZL7x9b7t6QZiMiV83v4o-TIxBeA91CB'),
                  ),   
             ],
            )
            
            ),
            Container(
            color: Colors.amber,
            width: double.infinity,
            height: 150,
            child: Row(
              
              children: [
                                          SizedBox(width: 15,),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHpiX6QwgIOQkRv1NBQZL7x9b7t6QZiMiV83v4o-TIxBeA91CB'),
                  ),
                  SizedBox(width: 30,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHpiX6QwgIOQkRv1NBQZL7x9b7t6QZiMiV83v4o-TIxBeA91CB'),
                  ),
                  SizedBox(width: 30,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHpiX6QwgIOQkRv1NBQZL7x9b7t6QZiMiV83v4o-TIxBeA91CB'),
                  ),   
             ],
            )
            
            ),
            
        ],
      ),
        
       bottomNavigationBar: BottomAppBarWith4Button(),
    );
  }
}