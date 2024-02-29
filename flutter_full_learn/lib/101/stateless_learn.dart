
import 'package:flutter/material.dart';

class StatelessLearn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text(Textler.appBarTitle,
        style: Theme.of(context).textTheme.labelLarge,)
      ),
      body:  Column(children: [
        Text('data2', style: Theme.of(context).textTheme.headlineLarge,),
                

      ]),


    );
  }
  
}
class Textler{
  static const appBarTitle = 'ercenin 1uygulamasi';
}
class TextTheme{
  static ThemeData theme = ThemeData(
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue),
  );
  static ThemeData theme2 = ThemeData(
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.yellow,
  ));
}


