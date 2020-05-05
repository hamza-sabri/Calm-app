import 'package:flutter/material.dart';
import 'package:ui_challenge1/modules/text_styles.dart';
import 'package:ui_challenge1/ui/pages/music_player.dart';

class ViewNext extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
  final  _styles = TextStyles(context: context);
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => (MusicPlayer())));
      },
      child: Row(
        children: <Widget>[
          Text(
            'View All',
            style: _styles.viewer(),
          ),
          SizedBox(
            width: 8,
          ),
          _nextArrow(),
        ],
      ),
    );
  }

  Widget _nextArrow() {
    return Container(
      width: 23,
      height: 23,
      decoration: BoxDecoration(
        color: Color(0xADDDDDDDDD),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Icon(
          Icons.navigate_next,
          color: Colors.white,
        ),
      ),
    );
  }
}
