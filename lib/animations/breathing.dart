import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:ui_challenge1/modules/text_styles.dart';
import 'package:ui_challenge1/ui/pages/main_page.dart';

class BreathingAnimation extends StatefulWidget {
  final _style = TextStyles();
  final double innerDimentions;
  final double outerDimentions;
  final innerColor = Colors.grey;
  final outerColor = Color(0xADDDDDDDDD);

  BreathingAnimation({this.innerDimentions, this.outerDimentions});

  // BreathingAnimation({});
  @override
  _BreathingAnimationState createState() => _BreathingAnimationState();
}

class _BreathingAnimationState extends State<BreathingAnimation>
    with TickerProviderStateMixin {
  String massage = 'start';
  Widget child;
  AnimationController rippleController;
  AnimationController scaleController;
  Animation<double> rippleAnimation;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    scaleController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    rippleController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    rippleAnimation = Tween<double>(
      begin: widget.outerDimentions,
      end: widget.outerDimentions + 8,
    ).animate(rippleController)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          rippleController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          rippleController.forward();
        }
      });

    scaleAnimation = Tween<double>(
      begin: 1,
      end: 30,
    ).animate(scaleController)
      ..addStatusListener((status) {
        setState(() {
          massage = '';
          child = _outerContainer();
        });
        if (status == AnimationStatus.completed) {
          Navigator.pushReplacement(context,
              PageTransition(child: MainPage(), type: PageTransitionType.fade));
        }
      });

    rippleController.forward();
  }

  @override
  void dispose() {
    rippleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    child = _outerContainer();
    return _animation(child);
  }

  _animation(myChild) {
    return AnimatedBuilder(
      animation: rippleAnimation,
      builder: (context, child) => Container(
        width: rippleAnimation.value,
        height: rippleAnimation.value,
        child: InkWell(
          onTap: () {
            scaleController.forward();
          },
          child: AnimatedBuilder(
            animation: scaleAnimation,
            builder: (context, child) => Transform.scale(
              scale: scaleAnimation.value,
              child: myChild,
            ),
          ),
        ),
      ),
    );
  }

  Widget _outerContainer() {
    return Container(
        width: widget.outerDimentions,
        height: widget.outerDimentions,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          color: widget.outerColor,
        ),
        alignment: Alignment.center,
        child: _innerContainer());
  }

  Widget _innerContainer() {
    return Container(
      width: widget.innerDimentions,
      height: widget.innerDimentions,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        color: widget.innerColor,
      ),
      child: Center(
        child: Text(
          massage,
          style: widget._style.startStyle(),
        ),
      ),
    );
  }
}
