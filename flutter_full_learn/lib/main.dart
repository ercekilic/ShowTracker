import 'package:flutter/material.dart';
import 'package:flutter_full_learn/showTrack/pages/mymovies_page.dart';
import 'package:flutter_full_learn/showTrack/pages/myplay_page.dart';
import 'package:flutter_full_learn/showTrack/pages/myseries_page.dart';
import 'package:flutter_full_learn/showTrack/providers/db_provider.dart';
import 'package:provider/provider.dart';


import 'showTrack/pages/search_page.dart';



void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DbProvider()),
      ],
      child: const MyApp(),
    ),
  );
}
class MyApp extends StatefulWidget {

   const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex =0 ;
  
  final screens = [
    const SearchPage(),
    const MovieListScreen(),
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



