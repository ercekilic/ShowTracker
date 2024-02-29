import 'package:flutter/material.dart';
import 'package:flutter_full_learn/101/arti_eksi_sayfasi.dart';

import 'package:flutter_full_learn/101/navigation_learn.dart';
import 'package:flutter_full_learn/showTrack/mymovies_provider.dart';
import 'package:provider/provider.dart';

import 'showTrack/search_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
     

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => MyMoviesProvider(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home:    SearchPage(),
    ),
    );
  }
}



