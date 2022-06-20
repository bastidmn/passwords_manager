import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'components/custom_page_route.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
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
            ],
          ),
        ),
      ),
    );
  }
}
