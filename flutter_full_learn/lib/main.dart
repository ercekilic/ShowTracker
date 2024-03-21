import 'package:flutter/material.dart';
import 'package:flutter_full_learn/showTrack/mymovies_page.dart';
import 'package:flutter_full_learn/showTrack/myplay_page.dart';
import 'package:flutter_full_learn/showTrack/myseries_page.dart';


import 'showTrack/search_page.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatefulWidget {

   MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex =0 ;

  final screens = [
    SearchPage(),
    const MyMoviesPage(),
    const MySeriesPage(),
    const MyPlayPage(),
  ];

  @override
  Widget build(BuildContext context) {
    
    
    return MaterialApp(
       debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
       theme: ThemeData(
         useMaterial3: true,
       ),
       home:    Scaffold(
        body: 
        IndexedStack(
          index: currentIndex,
          children: screens,),
        
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex= index,),
          items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
            backgroundColor: Colors.black,
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'My movies',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: 'My Series',
            backgroundColor: Colors.black,

          ),BottomNavigationBarItem(
            icon: Icon(Icons.play_arrow),
            label: 'Continue',
            backgroundColor: Colors.black,
          ),],)
       )
     );
    
  }
}



