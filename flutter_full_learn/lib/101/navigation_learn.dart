import 'package:flutter/material.dart';
import 'package:flutter_full_learn/101/arti_eksi_sayfasi.dart';

class NavigationLearn extends StatefulWidget {
  const NavigationLearn({super.key});

  @override
  State<NavigationLearn> createState() => _NavigationLearnState();
}

class _NavigationLearnState extends State<NavigationLearn> {
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context){
            return const ArtiEksiSayfasi();
          })
        );
      },
      child: const Icon(Icons.remove),),
    );
  }
}