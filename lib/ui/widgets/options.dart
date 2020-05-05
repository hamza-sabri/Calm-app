import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:ui_challenge1/modules/image_picker.dart';

class Options extends StatelessWidget {
  final ImagePicker _imagePicker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        LikeButton(),
        Image.asset(_imagePicker.imageChooserPNG('noat'),scale: 15,),
        Image.asset(_imagePicker.imageChooserPNG('music'),scale: 22,),
        Icon(Icons.share,color: Colors.white,),
      ],
    );
  }
}
