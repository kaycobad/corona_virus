import 'package:flutter/material.dart';
import 'constants.dart';

class ReusableCard extends StatelessWidget {
  final String numbers;
  final String title;
  final IconData icon;
  ReusableCard(
      {@required this.numbers, @required this.title, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      decoration: BoxDecoration(
        color: Color.fromRGBO(59, 56, 88, 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: Color.fromRGBO(255, 100, 150, 1),
            size: 25,
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: kLargeTextStyle,
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 7,
            ),
            width: 40,
            height: 1,
            color: Color.fromRGBO(255, 100, 150, .5),
          ),
          Text(
            numbers,
            style: kSmallTextStyle,
          ),
        ],
      ),
    );
  }
}
