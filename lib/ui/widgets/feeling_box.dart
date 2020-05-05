import 'package:flutter/material.dart';
import 'package:ui_challenge1/modules/image_picker.dart';
import 'package:ui_challenge1/modules/text_styles.dart';

class FeelingBox extends StatefulWidget {
  @override
  _FeelingBoxState createState() => _FeelingBoxState();
}

class _FeelingBoxState extends State<FeelingBox> {
  double width;
  ImagePicker _imagePicker = ImagePicker();
  TextStyles _styles;
  var toBeBlack = 'ying_yang';
  @override
  Widget build(BuildContext context) {
    width = (MediaQuery.of(context).size.width) / 100;
    _styles = TextStyles(context: context);
    return Row(
      children: <Widget>[
        _feelingBox('ying_yang', 'Calm'),
        _customSpacer(),
        _feelingBox('moon', 'Sleep'),
        _customSpacer(),
        _feelingBox('sad', 'Anxious'),
        _customSpacer(),
        _feelingBox('music', 'Music'),
      ],
    );
  }

  Widget _customSpacer() {
    return SizedBox(
      width: width + 22,
    );
  }

  Widget _feelingBox(face, masssage) {
    return Column(
      children: <Widget>[
        _backgroundContainer(face),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            masssage,
            style: _styles.oneWord(),
          ),
        )
      ],
    );
  }

  Widget _backgroundContainer(face) {
    return InkWell(
      onTap: () {
        _changeColors(face);
      },
      child: Container(
        width: width + 35,
        height: width + 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: (face == toBeBlack) ? Colors.black : Color(0xFFF5F5F5),
        ),
        child: Center(child: _image(face)),
      ),
    );
  }

  Widget _image(face) {
    return (face == 'ying_yang') ? _yengYangImage() : _normailImage(face);
  }

  Widget _normailImage(face) {
    return Container(
      width: width + 20,
      height: width + 20,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            _imagePicker.imageChooserPNG(face),
          ),
        ),
      ),
    );
  }

  Widget _yengYangImage() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(50)),
      child: _normailImage('ying_yang'),
    );
  }

  void _changeColors(face) {
    setState(() {
      toBeBlack = face;
    });
  }
}
