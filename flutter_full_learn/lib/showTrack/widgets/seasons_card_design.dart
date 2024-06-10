import 'package:flutter/material.dart';

class SeasonCardDesign extends StatelessWidget {
  const SeasonCardDesign({super.key});

  @override
  Widget build(BuildContext context) {
    return  Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              const Card();
              const SizedBox();
              const Card();
              setState(){
                
              }
            },
            child: const Text("Episode X"),
            
          ),
          const Icon(Icons.text_rotation_angledown),
        ],
      ),
    );
  }
}
