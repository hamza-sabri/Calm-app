import 'package:flutter/material.dart';

class Playbutton extends StatelessWidget {
  final size;

   Playbutton({ this.size});
  @override
  Widget build(BuildContext context) {
    print(size);
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color:Colors.black,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Icon(Icons.play_arrow,color:Colors.white,size: 16,),
    );
  }
}