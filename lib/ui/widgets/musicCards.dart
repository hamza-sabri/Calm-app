import 'package:flutter/material.dart';
import 'package:ui_challenge1/modules/image_picker.dart';
import 'package:ui_challenge1/modules/text_styles.dart';
import 'package:ui_challenge1/ui/widgets/play_button.dart';

class MusicCards extends StatelessWidget {
  double width;
  ImagePicker _imagePicker = ImagePicker();
  TextStyles _styles;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width / 2.3;
    _styles = TextStyles(context: context);
    return Row(
      children: <Widget>[
        _cardBuilder('Train Your Mind', '10', 'clumsy1'),
        SizedBox(
          width: 18,
        ),
        _cardBuilder('Saying Yes to life', '14', 'clumsy2'),
      ],
    );
  }

  Widget _cardBuilder(massage, numberOfLessons, imageName) {
    return Stack(
      children: <Widget>[
        _sizeFitter(),
        _grayBackGround(),
        _clumsyGirle(imageName),
        _sessionTitle(massage),
        _playButton(),
        _numberOfLessons(numberOfLessons),
      ],
    );
  }

  Widget _sizeFitter() {
    return Container(
      width: width,
      height: width + 10,
    );
  }

  Widget _grayBackGround() {
    return Positioned(
        bottom: 0,
        child: Container(
          width: width,
          height: width - 10,
          decoration: BoxDecoration(
            color: Color(0xF1F1F1F1),
            borderRadius: BorderRadius.circular(16),
          ),
        ));
  }

  Widget _clumsyGirle(imageName) {
    return Positioned(
      left: width / 3,
      top: 8,
      child: Image.asset(
        _imagePicker.imageChooserPNG(imageName),
        scale: 3.8,
      ),
    );
  }

  Widget _sessionTitle(massage) {
    return Positioned(
      bottom: 50,
      left: 10,
      child: Text(
        massage,
        style: _styles.readyText(),
      ),
    );
  }

  Widget _playButton() {
    return Positioned(
      bottom: 10,
      right: 25,
      child: Playbutton(
        size: 20.0,
      ),
    );
  }

  Widget _numberOfLessons(numberOfLessons) {
    return Positioned(
      bottom: 18,
      left: 12,
        child: Text(
      '$numberOfLessons Sessions',
      style: _styles.meditaionStyle(),
    ));
  }
}
