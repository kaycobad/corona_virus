import 'package:flutter/material.dart';
import 'constants.dart';

class PreventionsSymptoms extends StatelessWidget {
  final String imagePath;
  final String description;
  PreventionsSymptoms({@required this.imagePath, @required this.description});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      width: 260,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Image(
              image: AssetImage(imagePath),
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Expanded(
            flex: 3,
            child: Text(
              description,
              style: kSmallTextStyle.copyWith(
                color: Color.fromRGBO(100, 229, 249, 1),
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
