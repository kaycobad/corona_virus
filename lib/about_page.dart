import 'package:flutter/material.dart';
import 'constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'social_button.dart';
import 'package:url_launcher/url_launcher.dart';

_launchURL() async {
  const url = 'mailto:kaycobadjony@gmail.com';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchLinkedURL() async {
  const url = 'https://www.linkedin.com/in/kaycobad-johnny-114837142/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launchFacebookURL() async {
  const url = 'https://www.facebook.com/kaycobad.jony.3';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF090C22),
        automaticallyImplyLeading: false,
        title: Text(
          'About',
          style: kLargeTextStyle,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Covid-19 Updates'.toUpperCase(),
                  style: kTitleTextStyle,
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  'Developed by:'.toUpperCase(),
                  style: kLargeTextStyle,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Mohammad Kaycobad Jony',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 2,
                ),
                SelectableText(
                  'kaycobadjony@live.com',
                  style: kTextDefaultColor,
                ),
                SelectableText(
                  'kaycobadjony@gmail.com',
                  style: kTextDefaultColor,
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: <Widget>[
                    SocialButton(
                      onPressed: _launchURL,
                      icon: FontAwesomeIcons.envelope,
                      containerColor: Color.fromRGBO(255, 255, 255, .3),
                      iconColor: Colors.white,
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    SocialButton(
                      onPressed: _launchLinkedURL,
                      icon: FontAwesomeIcons.linkedinIn,
                      containerColor: Color.fromRGBO(32, 138, 197, .3),
                      iconColor: Color.fromRGBO(32, 138, 197, 1),
                    ),
                    SizedBox(
                      width: 2,
                    ),
                    SocialButton(
                      onPressed: _launchFacebookURL,
                      icon: FontAwesomeIcons.facebookF,
                      containerColor: Color.fromRGBO(59, 89, 152, .3),
                      iconColor: Color.fromRGBO(59, 89, 152, 1),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  'Data provided by:'.toUpperCase(),
                  style: kLargeTextStyle,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Data updates by free and open source API',
                  style: kTextDefaultColor,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Worldwide that update the cases more frequently:',
                  style: kTextDefaultColor,
                ),
                SelectableText(
                  'https://corona.lmao.ninja/v2/all',
                  style: kTextDefaultColor,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Country-Wise that update the cases:',
                  style: kTextDefaultColor,
                ),
                SelectableText(
                  'https://corona.lmao.ninja/v2/countries',
                  style: kTextDefaultColor,
                ),
                SizedBox(
                  height: 25,
                ),
                Text(
                  'Illustrations provided by:'.toUpperCase(),
                  style: kLargeTextStyle,
                ),
                SizedBox(
                  height: 5,
                ),
                SelectableText(
                  'https://dribbble.com/shots/10809711-Coronavirus-Icons',
                  style: kTextDefaultColor,
                ),
                SizedBox(
                  height: 5,
                ),
                SelectableText(
                  'https://drawer.design/products/coronavirus-icons/?ref=d-post-coronavirus-1',
                  style: kTextDefaultColor,
                ),
                SizedBox(
                  height: 5,
                ),
                SelectableText(
                  '<a href="https://www.freepik.com/free-photos-vectors/infographic">Infographic vector created by freepik - www.freepik.com</a>',
                  style: kTextDefaultColor,
                ),
                SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
