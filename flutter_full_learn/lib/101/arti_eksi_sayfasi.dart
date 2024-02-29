
import 'package:flutter/material.dart';

class ArtiEksiSayfasi extends StatefulWidget {
   const ArtiEksiSayfasi ({super.key}) ;

  @override
  State<ArtiEksiSayfasi> createState() => _ArtiEksiSayfasiState();
}

class _ArtiEksiSayfasiState extends State<ArtiEksiSayfasi> {
int tut = 1;

void arttir(){
  setState(() {
      tut = tut +1;

  });
}void azalt(){
  setState(() {
      tut = tut -1;

  });
  
}
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      
      floatingActionButton: Row(
        mainAxisSize:MainAxisSize.min ,
        children: [
          _arttirButonu(),
          _eksiltButonu(),
        ],
        
      ),

      body:  Center(child: Text('$tut')),







    );
  }

  FloatingActionButton _arttirButonu() {
    return FloatingActionButton(
          onPressed: (){
            arttir();
          },
          child: const Icon(Icons.add),);
  }

  Padding _eksiltButonu() {
    return Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: FloatingActionButton(onPressed: (){
            azalt();
          },
          child: const Icon(Icons.remove),),
        );
  }
}