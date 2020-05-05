import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:ui_challenge1/modules/image_picker.dart';
import 'package:ui_challenge1/modules/text_styles.dart';
import 'dart:math';

class Player extends StatefulWidget {
  final screenWidth, screenHeight;
  final _imagePicker = ImagePicker();
  final assetsAudioPlayer = AssetsAudioPlayer();
  final colors = [Colors.black,Colors.lightBlueAccent,Colors.lightGreen,Colors.amber,Colors.lightGreenAccent,];
  Player({this.screenWidth, this.screenHeight});

  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  double _value = 0.0;
  var playIcon = Icons.play_circle_filled;
  bool playOnce = true;
  TextStyles _styles;
  var currentColor = Colors.black;
  @override
  Widget build(BuildContext context) {
    _styles = TextStyles(context: context);
    return Container(
      width: widget.screenWidth,
      height: widget.screenHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Stack(
        children: <Widget>[
          _musicBackground(),
          _circule(),
          _trainYourMind(),
          _steavenHawking(),
          _controls(),
          _update(),
        ],
      ),
    );
  }

  Widget _musicBackground() {
    return Positioned(
      left: widget.screenWidth / 3.7,
      top: 88,
      child: Image.asset(
        widget._imagePicker.imageChooserPNG('music_background'),
        scale: 3.55,
      ),
    );
  }

  Widget _circule() {
    return Positioned(
      left: widget.screenWidth / 4,
      top: 80,
      child: Container(
        width: widget.screenWidth / 2,
        height: widget.screenWidth / 2,
        child: CircularProgressIndicator(
          value: _value,
          valueColor: AlwaysStoppedAnimation<Color>(currentColor),
          backgroundColor: Colors.grey,
          strokeWidth: 5,
        ),
      ),
    );
  }

  Widget _trainYourMind() {
    return Positioned(
        left: widget.screenWidth / 3.5,
        top: 300,
        child: Text(
          'Train Your Mind',
          style: _styles.mindTraining(),
        ));
  }

  Widget _steavenHawking() {
    return Positioned(
        left: widget.screenWidth / 3.69,
        top: 335,
        child: Text(
          'By : Stephen Hawkins',
          style: _styles.stephanHawking(),
        ));
  }

  Widget _controls() {
    return Positioned(
        bottom: 50,
        left: 30,
        right: 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image.asset(widget._imagePicker.imageChooserPNG('replay'),
                scale: 20),
            Icon(Icons.skip_previous, size: 30),
            InkWell(
                onTap: () {
                  _mp3Player();
                },
                child: Icon(playIcon, size: 70)),
            Icon(Icons.skip_next, size: 30),
            Icon(Icons.shuffle, size: 30),
          ],
        ));
  }

  void _mp3Player() {
    setState(() {
      if (playIcon == Icons.play_circle_filled) {
        playIcon = Icons.pause_circle_filled;
        if (playOnce) {
          widget.assetsAudioPlayer.open(
            Audio("lib/images/zoro.mp3"),
          );
          playOnce = !playOnce;
        } else {
          widget.assetsAudioPlayer.playOrPause();
        }
      } else {
        playIcon = Icons.play_circle_filled;
        widget.assetsAudioPlayer.playOrPause();
      }
    });
  }

  Widget _update() {
    return StreamBuilder(
        stream: widget.assetsAudioPlayer.currentPosition,
        builder: (context, asyncSnapshot) {
          final Duration duration = asyncSnapshot.data;
          if (playOnce) return Text('');
          _value+=0.001;
          currentColor = widget.colors[_random()];
          print('duration = $duration');
          return _circule();
        });
  }


  int _random(){
     var rng = new Random();
     return rng.nextInt(widget.colors.length-1);
  }
}
