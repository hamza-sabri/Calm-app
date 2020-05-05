import 'package:flutter/material.dart';
import 'package:ui_challenge1/modules/image_picker.dart';
import 'package:ui_challenge1/modules/text_styles.dart';
import 'package:ui_challenge1/ui/widgets/custom_fab.dart';
import 'package:ui_challenge1/ui/widgets/dots.dart';
import 'package:ui_challenge1/ui/widgets/home_screen_appbar.dart';

class HomeScreen extends StatelessWidget {
  final TextStyles _styles = TextStyles();
  final ImagePicker _imagePicker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    TextStyles.width = width;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            width: width,
            height: height,
            color: Colors.white,
          ),
          HomeScreenAppBar(),
          _smallTitle(),
          _title(),
          _centeredImage(),
          _threeDots(width),
          _customFab(),
        ],
      ),
    );
  }

  Widget _smallTitle() {
    return Positioned(
      top: 120,
      left: 30,
      child: Text(
        'Take a Deep Breath,',
        style: _styles.smallTitle(),
      ),
    );
  }

  Widget _title() {
    return Positioned(
      top: 165,
      left: 30,
      child: _homeTitle(),
    );
  }

  Widget _homeTitle() {
    return RichText(
      text: TextSpan(style: _styles.normalStyle(), children: <TextSpan>[
        TextSpan(text: 'Keep '),
        TextSpan(text: 'Calm ', style: _styles.boldWordStyle()),
        TextSpan(text: 'and \n'),
        TextSpan(text: 'Start '),
        TextSpan(text: 'Meditation', style: _styles.boldWordStyle()),
      ]),
    );
  }

  Widget _centeredImage() {
    return Positioned(
      top: 248,
      left: 10,
      right: 10,
      child: FadeInImage(
        placeholder: AssetImage(
          _imagePicker.imageChooserGIF('loading'),
        ),
        image: AssetImage(
          _imagePicker.imageChooserJPG('meditation'),
        ),
      ),
    );
  }

  Widget _customFab() {
    return Positioned(
      right: 14,
      bottom: 14,
      child: CustomFAB(),
    );
  }

  Widget _threeDots(double width) {
    return Positioned(
      left: 12,
      bottom: 18,
      child: Row(
        children: <Widget>[
          Dot(
            color: Colors.grey,
            dimensions: width,
          ),
          SizedBox(width: 5),
          Dot(
            color: Colors.grey,
            dimensions: width,
          ),
          SizedBox(width: 5),
          Dot(
            color: Colors.black87,
            dimensions: width,
          ),
        ],
      ),
    );
  }
}
