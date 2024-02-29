
import 'package:flutter/material.dart';

class TextLearnView extends StatelessWidget{
  final String name = 'veli';
  final Color x = Renkler.sariRengi;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center (
        child: Text(
          ("$name koş yardim lazim"),


          style: Theme.of(context).textTheme.headlineSmall?.copyWith(backgroundColor: Renkler.sariRengi).copyWith(color: Renkler.maviRenk),

          




          
        )
      ),
    );
  }


  

}

 class Renkler {

  static Color maviRenk = Colors.red;
  static Color sariRengi = Colors.yellow;


}


