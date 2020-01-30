import 'package:flutter/material.dart';

class ComingSoonView extends StatelessWidget {
  final String titleTxt;
  final AnimationController animationController;
  final Animation animation;

  const ComingSoonView(
      {Key key, this.titleTxt: "", this.animationController, this.animation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: new Transform(
            transform: new Matrix4.translationValues(
                0.0, 30 * (1.0 - animation.value), 0.0),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 120, left: 24, right: 24),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        titleTxt,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "OpenSansBold",
                          fontSize: 58,
                          letterSpacing: 0.9,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
