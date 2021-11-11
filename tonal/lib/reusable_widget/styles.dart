/**
 * Main resuable widget file.
 * It uses two paramaters as an input to display widget.
 * The paramters are
 * @label and @weight.
 */


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const bubbleDiameter = 272;

const bubbleBoxDecoration = BoxDecoration(
  color: Color(0xff53a99a),
  shape: BoxShape.circle,
  boxShadow: [
    BoxShadow(
      offset: Offset(0, 27),
      blurRadius: 33,
      color: Color(0x3827ae96),
    )
  ],
);

const labelTextStyle = TextStyle(
  fontFamily: 'Helvetica',
  fontWeight: FontWeight.bold,
  fontSize: 19,
  color: Colors.white,
);

const weightTextStyle = TextStyle(
  fontFamily: 'LeagueGothic',
  fontSize: 127,
  color: Colors.white,
);

const unitTextStyle = TextStyle(
  fontFamily: 'LeagueGothic',
  fontSize: 38,
  color: Color(0x80ffffff),
);

class Style extends StatefulWidget {
  final String label;
  final String weight;

/**
 * Constructor to receive values
 */
  Style({Key? key, required this.label, required this.weight}) : super(key: key);

  _styleState createState() => _styleState();
}

class _styleState extends State<Style> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        /**
         * Container is created with design as circle
         */
        Container(
            width: 272.0,
            height: 272.0,
            decoration: bubbleBoxDecoration,
            alignment: Alignment.center,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SvgPicture.asset('assets/graph.svg'),
            )),

        /**
         * Label widget
         */
        Positioned(
            top: 40,
            child: Text(
              widget.label,
              style: labelTextStyle,
            )),

        /**
         * Weight widget
         */
        Positioned(
            top: 60,
            child: Text(
              widget.weight,
              style: weightTextStyle,
            )),

        /**
         * Unit widget
         */
        Positioned(
            top: 200,
            child: Text(
              'lbs',
              style: unitTextStyle,
            )),
      ],
    );
  }
}
