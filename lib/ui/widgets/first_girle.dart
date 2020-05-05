import 'package:flutter/material.dart';
import 'package:ui_challenge1/modules/image_picker.dart';
import 'package:ui_challenge1/modules/text_styles.dart';
import 'package:ui_challenge1/ui/widgets/play_button.dart';

class FirstGirle extends StatelessWidget {
  TextStyles _styles;
  ImagePicker _imagePicker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    _styles = TextStyles(context: context);
    return Stack(
      children: <Widget>[
        _sizeFitter(),
        _boldText(),
        _meditationText(),
        _playButton(),
        _girle(),
      ],
    );
  }

  Widget _sizeFitter() {
    return Container(
        width: double.infinity,
        height: 128,
        decoration: BoxDecoration(
          color: Color(0xF1F1F1F1),
          borderRadius: BorderRadius.circular(10),
        ));
  }

  Widget _boldText() {
    return Positioned(
        top: 15,
        left: 15,
        child: Text(
          'Ready to Start\nYour First Session?',
          style: _styles.readyText(),
        ));
  }

  Widget _meditationText() {
    return Positioned(
      top: 62,
      left: 15,
      child: Text(
        'Meditation to calm anger!',
        style: _styles.meditaionStyle(),
      ),
    );
  }

  Widget _playButton() {
    return Positioned(
      bottom: 8,
      left: 15,
      child: Playbutton(size: 22.0,),
    );
  }

  Widget _girle() {
    return Positioned(
      right: 2,
      top: 3,
      child: Image.asset(
        _imagePicker.imageChooserPNG('setting_gairle'),
        scale: 3.7,
      ),
    );
  }
}
