import 'package:flutter/material.dart';
import 'package:ui_challenge1/modules/image_picker.dart';
import 'package:ui_challenge1/modules/text_styles.dart';

class MainPageAppBar extends StatelessWidget {
  ImagePicker _imagePicker = ImagePicker();
  TextStyles _styles;
  @override
  Widget build(BuildContext context) {
    _styles = TextStyles(context: context);
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Wrap(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(
                  Icons.sort,
                  color: Colors.black,
                  size: 35,
                ),
                _midRow(),
                _personalAvatar(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _midRow() {
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

  Widget _personalAvatar() {
    return ClipRRect(
      child: SizedBox(
        width: 40,
              child: FadeInImage(
          placeholder: AssetImage(
            _imagePicker.imageChooserGIF('loading'),
          ),
          image: AssetImage(
            _imagePicker.imageChooserPNG('personal_avatar'),
          ),
        ),
      ),
      borderRadius: BorderRadius.circular(50),
    );
  }
}
