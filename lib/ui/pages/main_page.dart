import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:ui_challenge1/modules/text_styles.dart';
import 'package:ui_challenge1/ui/pages/home.dart';
import 'package:ui_challenge1/ui/widgets/feeling_box.dart';
import 'package:ui_challenge1/ui/widgets/first_girle.dart';
import 'package:ui_challenge1/ui/widgets/main_page_appbar.dart';
import 'package:ui_challenge1/ui/widgets/musicCards.dart';
import 'package:ui_challenge1/ui/widgets/view_next.dart';

class MainPage extends StatelessWidget {
  //get the width and the height of the screen once and store them somewhere then
  //reuse them but like this it really stinks
  TextStyles _styles;
  double height;
  @override
  Widget build(BuildContext context) {
    _styles = TextStyles(context: context);
    height = MediaQuery.of(context).size.height;
    return WillPopScope(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            //filling the whole width and height of the screen
            Container(
              width: double.infinity,
              height: double.infinity,
            ),
            //adding the app bar for this page
            _mainPageAppBar(),
            _welcomingMassage(),
            _askingMassage(),
            _feelings(),
            _firstGirle(),
            _girlseRow(),
            _meditation(),
            _viewingNext(),
          ],
        ),
      ),
      onWillPop: () {
        return _back(context);
      },
    );
  }

  Widget _mainPageAppBar() {
    return Positioned(top: 25, child: MainPageAppBar());
  }

  Widget _welcomingMassage() {
    return Positioned(
      top: 95,
      left: 20,
      child: RichText(
        text: TextSpan(style: _styles.normalStyle(), children: <TextSpan>[
          TextSpan(text: 'Welcome back '),
          TextSpan(text: 'Ruhi ', style: _styles.boldWordStyle()),
        ]),
      ),
    );
  }

  Widget _askingMassage() {
    return Positioned(
      top: 140,
      left: 22,
      child: Text(
        'How are you feeling today?',
        style: _styles.question(),
      ),
    );
  }

  Widget _feelings() {
    return Positioned(
      top: 185,
      left: 28,
      child: FeelingBox(),
    );
  }

  Widget _firstGirle() {
    return Positioned(
      top: 280,
      left: 20,
      right: 20,
      child: FirstGirle(),
    );
  }

  Widget _meditation() {
    return Positioned(
      top: height / 2 + 100,
      left: 28,
      child: Text(
        'Meditations',
        style: _styles.meditaion(),
      ),
    );
  }

  Widget _viewingNext() {
    return Positioned(
      top: height / 2 + 101,
      right: 15,
      child: ViewNext(),
    );
  }

  Widget _girlseRow() {
    return Positioned(
      bottom: 15,
      left: 20,
      right: 0,
      child: MusicCards(),
    );
  }

//mack the animation of faing posible when back
  Future<bool> _back(context) async {
    Navigator.pushReplacement(context,
        PageTransition(child: HomeScreen(), type: PageTransitionType.fade));
    return false;
  }
}
