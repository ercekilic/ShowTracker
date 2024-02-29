
import 'package:flutter/material.dart';


class Buttonlearn extends StatelessWidget 
{
  const Buttonlearn({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(     
      appBar: AppBar(
        centerTitle: true,      
        title: const Text("ERCE'nin uygulamasi",
        style: TextStyle(
                  backgroundColor : Colors.blue,       
        ),
),
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children:  [
          TextButton(
            onPressed: (){},
            child : const Text('This is a button'),                    
          ),
          ElevatedButton(
            onPressed:(){} 
          , child: const Text("This is a elevetedButton",
          style: TextStyle(
            backgroundColor: Colors.black,
          ),
          ),
          ),
          IconButton(onPressed: (){}, icon: const Icon(Icons.analytics_rounded)),
          FloatingActionButton(onPressed: (){}, 
           child: const Icon(Icons.add,),
          )          
        ],

      ),

    );
  }
}


