import 'package:flutter/material.dart';
import 'package:flutter_full_learn/showTrack/search_page.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.search),
      onPressed: () {
        
        Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage()),);
      },
    );
  }
}
