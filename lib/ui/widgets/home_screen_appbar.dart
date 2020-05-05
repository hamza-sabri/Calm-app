import 'package:flutter/material.dart';
import 'package:ui_challenge1/modules/image_picker.dart';
import 'package:ui_challenge1/modules/text_styles.dart';

class HomeScreenAppBar extends StatelessWidget {
  final ImagePicker _imagePicker = ImagePicker();
  final TextStyles _styles = TextStyles();
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Positioned(
      top: 16,
      left: 26,
      child: Container(
        width: screenWidth,
        height: 105,
        child: _logo(),
      ),
    );
  }

  Widget _logo() {
    return Row(
      children: <Widget>[
        Image.asset(
          _imagePicker.imageChooserPNG('ying_yang'),
          scale: 30,
        ),
        SizedBox(
          width: 8,
        ),
        Text(
          'Calm',
          style: _styles.appBarStyle(),
        ),
      ],
    );
  }
}
