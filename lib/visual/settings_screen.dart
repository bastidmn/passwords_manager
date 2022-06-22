import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/custom_page_route.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String _dropdownValue = 'German';
  bool _darkTheme = false;
  double _startupSliderValue = 1.0;
  double _entrySliderValue = 2.0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.grey[300],
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey[300],
          appBar: new PreferredSize(
            preferredSize: new Size(width, 60),
            child: Container(
              width: width * 1.0,
              height: 60,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Padding(
                      child: Icon(
                        Icons.arrow_back,
                        size: 40,
                      ),
                      padding: EdgeInsets.all(10),
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Padding(
                      child: Icon(
                        Icons.support_agent_outlined,
                        size: 40,
                      ),
                      padding: EdgeInsets.all(10),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: ListView(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              Container(
                padding: EdgeInsets.only(
                  left: 50.0,
                ),
                height: 120,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "Settings",
                    style: GoogleFonts.lato(
                      //color: Colors.red[800],
                      color: Colors.black,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10.0,
                  horizontal: 20.0,
                ),
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey[300],
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[600],
                        offset: Offset(4, 4),
                        blurRadius: 8,
                        spreadRadius: 1,
                      ),
                      BoxShadow(
                        color: Colors.white,
                        offset: Offset(-4, -4),
                        blurRadius: 8,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Text(
                          'Appearance',
                          style: GoogleFonts.lato(
                            //color: Colors.red[800],
                            color: Colors.black,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      SizedBox(
                        height: 30.0,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                'Dark Theme',
                                style: GoogleFonts.lato(
                                  //color: Colors.red[800],
                                  color: Colors.grey[700],
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Switch(
                                  value: _darkTheme,
                                  activeColor: Colors.grey[700],
                                  inactiveTrackColor: Colors.grey[400],
                                  inactiveThumbColor: Colors.grey[500],
                                  onChanged: (bool newValue) {
                                    setState(() {
                                      _darkTheme = newValue;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.0),
                      SizedBox(
                        height: 30.0,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                'Language',
                                style: GoogleFonts.lato(
                                  //color: Colors.red[800],
                                  color: Colors.grey[700],
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: DropdownButton(
                                  isDense: true,
                                  value: _dropdownValue,
                                  underline: Container(color: Colors.grey[300]),
                                  onChanged: (String newValue) {
                                    setState(() {
                                      _dropdownValue = newValue;
                                    });
                                  },
                                  items: <String>['English', 'German']
                                      .map<DropdownMenuItem<String>>(
                                          (String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(
                                        value,
                                        style: GoogleFonts.lato(
                                          //color: Colors.red[800],
                                          color: Colors.grey[500],
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.0),
                      SizedBox(
                        child: Text(
                          'Personal',
                          style: GoogleFonts.lato(
                            //color: Colors.red[800],
                            color: Colors.black,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      SizedBox(
                        height: 30.0,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                'Username',
                                style: GoogleFonts.lato(
                                  //color: Colors.red[800],
                                  color: Colors.grey[700],
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                'Sebastian',
                                style: GoogleFonts.lato(
                                  //color: Colors.red[800],
                                  color: Colors.grey[500],
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                        child: Row(
                          children: [
                            Spacer(
                              flex: 1,
                            ),
                            Expanded(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () {
                                  print("Nope");
                                },
                                child: Text(
                                  'Change',
                                  style: GoogleFonts.lato(
                                    //color: Colors.red[800],
                                    color: Colors.red[700],
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.0),
                      SizedBox(
                        child: Text(
                          'Security',
                          style: GoogleFonts.lato(
                            //color: Colors.red[800],
                            color: Colors.black,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      SizedBox(
                        height: 30.0,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                'Startup',
                                style: GoogleFonts.lato(
                                  //color: Colors.red[800],
                                  color: Colors.grey[700],
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                (_startupSliderValue == 0)
                                    ? 'None'
                                    : (_startupSliderValue == 1)
                                        ? 'System'
                                        : 'Password',
                                style: GoogleFonts.lato(
                                  //color: Colors.red[800],
                                  color: Colors.grey[500],
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                        child: Row(
                          children: [
                            Spacer(flex: 1),
                            Expanded(
                              flex: 1,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Slider(
                                  activeColor: Colors.grey[700],
                                  inactiveColor: Colors.grey[500],
                                  value: _startupSliderValue,
                                  divisions: 2,
                                  min: 0.0,
                                  max: 2.0,
                                  onChanged: (double value) {
                                    setState(() {
                                      _startupSliderValue = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.0),
                      SizedBox(
                        height: 30.0,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                'Entry',
                                style: GoogleFonts.lato(
                                  //color: Colors.red[800],
                                  color: Colors.grey[700],
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                (_entrySliderValue == 0)
                                    ? 'None'
                                    : (_entrySliderValue == 1)
                                        ? 'System'
                                        : 'Password',
                                style: GoogleFonts.lato(
                                  //color: Colors.red[800],
                                  color: Colors.grey[500],
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30.0,
                        child: Row(
                          children: [
                            Spacer(flex: 1),
                            Expanded(
                              flex: 1,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Slider(
                                  activeColor: Colors.grey[700],
                                  inactiveColor: Colors.grey[500],
                                  value: _entrySliderValue,
                                  divisions: 2,
                                  min: 0.0,
                                  max: 2.0,
                                  onChanged: (double value) {
                                    setState(() {
                                      _entrySliderValue = value;
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 5.0),
                      SizedBox(
                        height: 30.0,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                'Password',
                                style: GoogleFonts.lato(
                                  //color: Colors.red[800],
                                  color: Colors.grey[700],
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () {
                                  print("Nope");
                                },
                                child: Text(
                                  'Change',
                                  style: GoogleFonts.lato(
                                    //color: Colors.red[800],
                                    color: Colors.red[700],
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30.0),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
