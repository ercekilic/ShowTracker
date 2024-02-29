import 'package:flutter/material.dart';

class ContainerSizedBox extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  Column(
          children: [
          SizedBox(
            width: 200,
            height: 200,
            child: Text(
            'a'*210,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(backgroundColor : Colors.black),
        )
       ),
        const SizedBox.shrink(),
        

        const SizedBox.square(
          dimension: 50,
          child: Text('hi my name is RJ' , 

          style: TextStyle(
            backgroundColor: Colors.red
          ),
        
        
          ),
        ),
         
         Container(
          width: 500,
          height: 500,
          color: Colors.blue,
          

         ),

      ] ,

        
     ),

    );
  }


}