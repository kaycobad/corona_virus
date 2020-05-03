import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'fadeAnimations.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

String data;
int actualCases = 0;
int deaths = 0;
int recovered = 0;
int affectedCountries = 0;
int deathsToday = 0;
int casesToday = 0;
int activeCases = 0;
int criticalCases = 0;
int casesPerMillion = 0;
int updatedTime = 0;

String countryData;
String country = 'Country';
int countryCases = 0;
int countryDeaths = 0;
int countryNumber = 15;
int lastUpdated = 0;
int countryNewConfirmed = 0;
int countryNewDeaths = 0;
int countryRecovered = 0;
final formatter = NumberFormat("#,###");

String readTimestamp(int timestamp) {
  var now = DateTime.now();
  var format = DateFormat('HH:mm a');
  var date = DateTime.fromMillisecondsSinceEpoch(timestamp);
  var diff = now.difference(date);
  var time = '';

  if (diff.inSeconds <= 0 ||
      diff.inSeconds > 0 && diff.inMinutes == 0 ||
      diff.inMinutes > 0 && diff.inHours == 0 ||
      diff.inHours > 0 && diff.inDays == 0) {
    time = format.format(date);
  } else if (diff.inDays > 0 && diff.inDays < 7) {
    if (diff.inDays == 1) {
      time = diff.inDays.toString() + ' DAY AGO';
    } else {
      time = diff.inDays.toString() + ' DAYS AGO';
    }
  } else {
    if (diff.inDays == 7) {
      time = (diff.inDays / 7).floor().toString() + ' WEEK AGO';
    } else {
      time = (diff.inDays / 7).floor().toString() + ' WEEKS AGO';
    }
  }

  return time;
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  getData() async {
    try {
      http.Response response =
          await http.get('https://corona.lmao.ninja/v2/all');
      if (response.statusCode == 200) {
        data = response.body;
        setState(() {
          actualCases = jsonDecode(data)['cases'];
          deaths = jsonDecode(data)['deaths'];
          recovered = jsonDecode(data)['recovered'];
          affectedCountries = jsonDecode(data)['affectedCountries'];
          deathsToday = jsonDecode(data)['todayDeaths'];
          casesToday = jsonDecode(data)['todayCases'];
          activeCases = jsonDecode(data)['active'];
          criticalCases = jsonDecode(data)['critical'];
          casesPerMillion = jsonDecode(data)['casesPerOneMillion'];
          updatedTime = jsonDecode(data)['updated'];
        });
      } else {
        print(response.statusCode);
      }
    } catch (error) {
      print(error);
    }
  }

  getCountryData() async {
    try {
      http.Response response =
          await http.get('https://corona.lmao.ninja/v2/countries');
      if (response.statusCode == 200) {
        countryData = response.body;
        setState(() {
          country = jsonDecode(countryData)[countryNumber]['country'];
          countryCases = jsonDecode(countryData)[countryNumber]['cases'];
          countryDeaths = jsonDecode(countryData)[countryNumber]['deaths'];
          countryNewConfirmed =
              jsonDecode(countryData)[countryNumber]['todayCases'];
          countryNewDeaths =
              jsonDecode(countryData)[countryNumber]['todayDeaths'];
          countryRecovered =
              jsonDecode(countryData)[countryNumber]['recovered'];

          lastUpdated = jsonDecode(countryData)[countryNumber]['updated'];
        });
      } else {
        print(response.statusCode);
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    getCountryData();
  }

  List<String> _locations = [
    'Afghanistan',
    'Albania',
    'Algeria',
    'Andorra',
    'Angola',
    'Anguilla',
    'Antigua and Barbuda',
    'Argentina',
    'Armenia',
    'Aruba',
    'Australia',
    'Austria',
    'Azerbaijan',
    'Bahamas',
    'Bahrain',
    'Bangladesh',
    'Barbados',
    'Belarus',
    'Belgium',
    'Belize',
    'Benin',
    'Bermuda',
    'Bhutan',
    'Bolivia',
    'Bosnia',
    'Botswana',
    'Brazil',
    'British Virgin Islands',
    'Brunei',
    'Bulgaria',
    'Burkina Faso',
    'Burundi',
    'Cabo Verde',
    'Cambodia',
    'Cameroon',
    'Canada',
    'Caribbean Netherlands',
    'Cayman Islands',
    'Central African Republic',
    'Chad',
    'Channel Islands',
    'Chile',
    'China',
    'Colombia',
    'Comoros',
    'Congo',
    'Costa Rica',
    'Croatia',
    'Cuba',
    'Curaçao',
    'Cyprus',
    'Czechia',
    'Côte d\'Ivoire',
    'DRC',
    'Denmark',
    'Diamond Princess',
    'Djibouti',
    'Dominica',
    'Dominican Republic',
    'Ecuador',
    'Egypt',
    'El Salvador',
    'Equatorial Guinea',
    'Eritrea',
    'Estonia',
    'Ethiopia',
    'Falkland Islands (Malvinas)',
    'Faroe Islands',
    'Fiji',
    'Finland',
    'France',
    'French Guiana',
    'French Polynesia',
    'Gabon',
    'Gambia',
    'Georgia',
    'Germany',
    'Ghana',
    'Gibraltar',
    'Greece',
    'Greenland',
    'Grenada',
    'Guadeloupe',
    'Guatemala',
    'Guinea',
    'Guinea-Bissau',
    'Guyana',
    'Haiti',
    'Holy See (Vatican City State)',
    'Honduras',
    'Hong Kong',
    'Hungary',
    'Iceland',
    'India',
    'Indonesia',
    'Iran',
    'Iraq',
    'Ireland',
    'Isle of Man',
    'Israel',
    'Italy',
    'Jamaica',
    'Japan',
    'Jordan',
    'Kazakhstan',
    'Kenya',
    'Kuwait',
    'Kyrgyzstan',
    'Lao People\'s Democratic Republic',
    'Latvia',
    'Lebanon',
    'Liberia',
    'Libyan Arab Jamahiriya',
    'Liechtenstein',
    'Lithuania',
    'Luxembourg',
    'MS Zaandam',
    'Macao',
    'Macedonia',
    'Madagascar',
    'Malawi',
    'Malaysia',
    'Maldives',
    'Mali',
    'Malta',
    'Martinique',
    'Mauritania',
    'Mauritius',
    'Mayotte',
    'Mexico',
    'Moldova',
    'Monaco',
    'Mongolia',
    'Montenegro',
    'Montserrat',
    'Morocco',
    'Mozambique',
    'Myanmar',
    'Namibia',
    'Nepal',
    'Netherlands',
    'New Caledonia',
    'New Zealand',
    'Nicaragua',
    'Niger',
    'Nigeria',
    'Norway',
    'Oman',
    'Pakistan',
    'Palestine',
    'Panama',
    'Papua New Guinea',
    'Paraguay',
    'Peru',
    'Philippines',
    'Poland',
    'Portugal',
    'Qatar',
    'Romania',
    'Russia',
    'Rwanda',
    'Réunion',
    'S. Korea',
    'Saint Kitts and Nevis',
    'Saint Lucia',
    'Saint Martin',
    'Saint Pierre Miquelon',
    'Saint Vincent and the Grenadines',
    'San Marino',
    'Sao Tome and Principe',
    'Saudi Arabia',
    'Senegal',
    'Serbia',
    'Seychelles',
    'Sierra Leone',
    'Singapore',
    'Sint Maarten',
    'Slovakia',
    'Slovenia',
    'Somalia',
    'South Africa',
    'South Sudan',
    'Spain',
    'Sri Lanka',
    'St. Barth',
    'Sudan',
    'Suriname',
    'Swaziland',
    'Sweden',
    'Switzerland',
    'Syrian Arab Republic',
    'Taiwan',
    'Tajikistan',
    'Tanzania',
    'Thailand',
    'Timor-Leste',
    'Togo',
    'Trinidad and Tobago',
    'Tunisia',
    'Turkey',
    'Turks and Caicos Islands',
    'UAE',
    'UK',
    'USA',
    'Uganda',
    'Ukraine',
    'Uruguay',
    'Uzbekistan',
    'Venezuela',
    'Vietnam',
    'Western Sahara',
    'Yemen',
    'Zambia',
    'Zimbabwe',
  ]; // Option 2
  String _selectedLocation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 75, 0, 0),
            child: Column(
              children: <Widget>[
                FadeAnimation(
                  1.0,
                  Image(
                    image: AssetImage('images/06.png'),
                    height: 150,
                  ),
                ),
                Container(
                  height: 210,
                  child: FadeAnimation(
                    1.5,
                    Column(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                          child: Center(
                            child: Text(
                              'Covid-19 Development'.toUpperCase(),
                              style: kTitleTextStyle,
                            ),
                          ),
                        ),
                        Text(
                          'Last updated: ${readTimestamp(updatedTime)}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Expanded(
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              SizedBox(
                                width: 15,
                              ),
                              ReusableCard(
                                icon: FontAwesomeIcons.wheelchair,
                                title: 'Confirmed Cases',
                                numbers:
                                    formatter.format(actualCases).toString(),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              ReusableCard(
                                icon: Icons.today,
                                title: 'Today Cases',
                                numbers:
                                    formatter.format(casesToday).toString(),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              ReusableCard(
                                icon: FontAwesomeIcons.bookDead,
                                title: 'Deaths',
                                numbers: formatter.format(deaths).toString(),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              ReusableCard(
                                icon: Icons.today,
                                title: 'Today deaths',
                                numbers: deathsToday.toString(),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              ReusableCard(
                                icon: FontAwesomeIcons.male,
                                title: 'Recovered',
                                numbers: formatter.format(recovered).toString(),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              ReusableCard(
                                icon: FontAwesomeIcons.male,
                                title: 'Active',
                                numbers:
                                    formatter.format(activeCases).toString(),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              ReusableCard(
                                icon: FontAwesomeIcons.fire,
                                title: 'Critical',
                                numbers:
                                    formatter.format(criticalCases).toString(),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              ReusableCard(
                                icon: FontAwesomeIcons.chartLine,
                                title: 'Cases Per One Million',
                                numbers: formatter
                                    .format(casesPerMillion)
                                    .toString(),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              ReusableCard(
                                icon: FontAwesomeIcons.globe,
                                title: 'Affected Countries',
                                numbers: affectedCountries.toString(),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  height: 270,
                  child: FadeAnimation(
                    2.0,
                    Column(
                      children: <Widget>[
                        Center(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 1),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(59, 56, 88, 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: DropdownButton(
                              hint: Text(
                                'Select a Country',
                                style: TextStyle(
                                  color: Color.fromRGBO(255, 100, 150, .8),
                                  fontSize: 13,
                                ),
                              ),
                              underline: SizedBox(),
                              iconSize: 30,
                              iconEnabledColor:
                                  Color.fromRGBO(255, 100, 150, .8),
                              value: _selectedLocation,
                              style: TextStyle(
                                color: Color.fromRGBO(255, 100, 150, 1),
                              ),
                              onChanged: (newValue) {
                                setState(() {
                                  _selectedLocation = newValue;
                                  countryNumber = _locations.indexOf(newValue);
                                  getCountryData();
                                });
                              },
                              items: _locations.map((location) {
                                return DropdownMenuItem(
                                  child: Text(
                                    location,
                                    style: TextStyle(
                                      fontSize: 13,
                                    ),
                                  ),
                                  value: location,
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15,
                          ),
                          child: Text(
                            country.toString().toUpperCase(),
                            style: kTitleTextStyle,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Text(
                          'Last updated: ${readTimestamp(lastUpdated)}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Expanded(
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: <Widget>[
                              SizedBox(
                                width: 15,
                              ),
                              ReusableCard(
                                icon: FontAwesomeIcons.wheelchair,
                                title: 'Confirmed Cases',
                                numbers:
                                    formatter.format(countryCases).toString(),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              ReusableCard(
                                icon: Icons.today,
                                title: 'Today Cases',
                                numbers: formatter
                                    .format(countryNewConfirmed)
                                    .toString(),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              ReusableCard(
                                icon: FontAwesomeIcons.bookDead,
                                title: 'Deaths',
                                numbers:
                                    formatter.format(countryDeaths).toString(),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              ReusableCard(
                                icon: Icons.today,
                                title: 'Today Deaths',
                                numbers: formatter
                                    .format(countryNewDeaths)
                                    .toString(),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              ReusableCard(
                                icon: FontAwesomeIcons.male,
                                title: 'Recovered',
                                numbers: formatter
                                    .format(countryRecovered)
                                    .toString(),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                            ],
                          ),
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
      ),
    );
  }
}
