import 'package:flutter/material.dart';
import 'package:ui_challenge1/modules/image_picker.dart';
import 'package:ui_challenge1/ui/widgets/player.dart';
import 'package:ui_challenge1/ui/widgets/options.dart';

class MusicPlayer extends StatelessWidget {
  final _imagePicker = ImagePicker();
  var context;
  @override
  Widget build(BuildContext context) {
    this.context = context;
    return Scaffold(
      body: _background(),
    );
  }

  Widget _background() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        // image: DecorationImage(
        //   image: AssetImage(
        //     _imagePicker.imageChooserPNG('background'),
        //   ),
        // ),
        color: Colors.black,
      ),
      child: Stack(
        children: <Widget>[
          _backButton(),
          _search(),
          _player(),
          _options(),
        ],
      ),
    );
  }

  Widget _backButton() {
    return Positioned(
      top: 40,
      left: 15,
      child: Icon(Icons.arrow_back_ios, color: Colors.white),
    );
  }

  Widget _search() {
    return Positioned(
      top: 40,
      right: 15,
      child: Icon(Icons.search, color: Colors.white),
    );
  }

  Widget _player() {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Positioned(
      top: 90,
      bottom: 50,
      child: Player(
        screenWidth: width,
        screenHeight: height,
      ),
    );
  }


Widget _options(){
  return Positioned(
    bottom: 10,
    left: 20,
    right: 20,
    child: Options());
}
}
