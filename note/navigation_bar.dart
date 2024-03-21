import 'package:flutter/material.dart';
import 'package:flutter_full_learn/showTrack/mymovies_page.dart';
import 'package:flutter_full_learn/showTrack/myplay_page.dart';
import 'package:flutter_full_learn/showTrack/myseries_page.dart';
import 'package:flutter_full_learn/showTrack/search_page.dart';




class BottomNavigationBarWithButtons extends StatefulWidget {
  const BottomNavigationBarWithButtons({super.key});

  @override
  State<BottomNavigationBarWithButtons> createState() =>
      _BottomNavigationBarWithButtonsState();
}


class _BottomNavigationBarWithButtonsState
    extends State<BottomNavigationBarWithButtons> {
  int selectedIndex = 0;
  

  int onItemTapped(int index) {
    
    setState(() {
      selectedIndex = index;
    });
    return index;
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: const <BottomNavigationBarItem>
        [
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
          ),
        ],
        
        currentIndex: selectedIndex,
        selectedItemColor: Colors.green,
        onTap: onItemTapped,
      
    );
  }

  void onPressedFac(int index){
    if(index ==0){
      Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()),);
      
    }
    if(index ==1){
      Navigator.push(context, MaterialPageRoute(builder: (context) => const MyMoviesPage()),);
      
    }
    if(index ==2){
      Navigator.push(context, MaterialPageRoute(builder: (context) => const MySeriesPage()),);
      
    }
    if(index ==3){
      Navigator.push(context, MaterialPageRoute(builder: (context) => const MyPlayPage()),);
      
    }
  }
}
