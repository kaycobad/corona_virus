import 'package:flutter/material.dart';
import 'preventions_symptoms.dart';
import 'constants.dart';
import 'fadeAnimations.dart';

class PreventionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF090C22),
        automaticallyImplyLeading: false,
        title: Text(
          'Symptoms & Preventions',
          style: kLargeTextStyle,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 35,
              ),
              FadeAnimation(
                1.0,
                Center(
                  child: Text(
                    'Transmission',
                    style: kTitleTextStyle,
                  ),
                ),
              ),
              FadeAnimation(
                1.2,
                Container(
                  padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                  child: Text(
                    'According to WHO, people can catch COVID-19 from others who have the virus. The disease can spread from person to person through small droplets from the nose or mouth which are spread when a person with COVID-19 coughs or exhales. These droplets land on objects and surfaces around the person. Other people then catch COVID-19 by touching these objects or surfaces, then touching their eyes, nose or mouth. People can also catch COVID-19 if they breathe in droplets from a person with COVID-19 who coughs out or exhales droplets. This is why it is important to stay more than 1 meter (3 feet) away from a person who is sick.',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FadeAnimation(
                1.4,
                Center(
                  child: Text(
                    'Symptoms',
                    style: kTitleTextStyle,
                  ),
                ),
              ),
              FadeAnimation(
                1.6,
                Container(
                  padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                  child: Text(
                    'People may be sick with the virus for 1 to 14 days before developing symptoms. The most common symptoms of coronavirus disease (COVID-19) are fever, tiredness, and dry cough. Most people (about 80%) recover from the disease without needing special treatment.',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 170,
                child: FadeAnimation(
                  1.8,
                  ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      SizedBox(
                        width: 15,
                      ),
                      PreventionsSymptoms(
                        imagePath: 'images/07.png',
                        description: 'Dry Cough',
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      PreventionsSymptoms(
                        imagePath: 'images/08.png',
                        description: 'Headache',
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      PreventionsSymptoms(
                        imagePath: 'images/09.png',
                        description: 'Fever',
                      ),
                      SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              FadeAnimation(
                2.0,
                Center(
                  child: Text(
                    'Preventions',
                    style: kTitleTextStyle,
                  ),
                ),
              ),
              FadeAnimation(
                2.2,
                Container(
                  padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                  child: Text(
                    'You can protect yourself and help prevent spreading the virus to others if you DO:',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 170,
                child: FadeAnimation(
                  2.5,
                  ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      SizedBox(
                        width: 15,
                      ),
                      PreventionsSymptoms(
                        imagePath: 'images/02.png',
                        description:
                            'Cover your nose and mouth with a disposable tissue or flexed elbow when you cough or sneeze',
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      PreventionsSymptoms(
                        imagePath: 'images/01.png',
                        description:
                            'Wash your hands regularly for 20 seconds, with soap and water or alcohol-based hand rub',
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      PreventionsSymptoms(
                        imagePath: 'images/04.png',
                        description: '14-day self-quarantine',
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      PreventionsSymptoms(
                        imagePath: 'images/05.png',
                        description:
                            'Avoid close contact (1 meter or 3 feet) with people who are unwell',
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      PreventionsSymptoms(
                        imagePath: 'images/03.png',
                        description: 'Use an alcohol-based gel',
                      ),
                      SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 35,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
