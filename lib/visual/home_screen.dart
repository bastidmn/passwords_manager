import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:google_fonts/google_fonts.dart';
import 'package:passwords_manager/visual/components/custom_page_route.dart';
import 'package:passwords_manager/visual/settings_screen.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  bool isPressed;
  bool dialShown;
  bool isFocused = false;
  AnimationController _controller1;
  Animation _animation;
  Alignment align1;
  Alignment align2;

  @override
  void initState() {
    super.initState();
    isPressed = false;
    dialShown = false;
    align1 = Alignment(
      0.0,
      1.0,
    );
    align2 = Alignment(
      0.0,
      1.0,
    );
    _controller1 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 50),
      reverseDuration: Duration(milliseconds: 50),
    );
    _animation = CurvedAnimation(
      parent: _controller1,
      curve: Curves.easeIn,
      reverseCurve: Curves.easeIn,
    );
    _controller1.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    //double height = MediaQuery.of(context).size.height;

    return Container(
      color: Colors.grey[300],
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.grey[300],
          floatingActionButton: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 20,
            ),
            child: Stack(
              children: [
                //Animated Button - Add
                AnimatedAlign(
                  duration: isPressed
                      ? Duration(milliseconds: 100)
                      : Duration(milliseconds: 200),
                  alignment: align1,
                  curve: isPressed ? Curves.easeIn : Curves.easeOut,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 100),
                    curve: isPressed ? Curves.easeIn : Curves.easeOut,
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey[300],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[600],
                          offset: Offset(10, 10),
                          blurRadius: 8,
                          spreadRadius: 2,
                        ),
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(-5, -5),
                          blurRadius: 8,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Icon(
                        Icons.add,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                //Animated Button - SafeGuard
                AnimatedAlign(
                  duration: isPressed
                      ? Duration(milliseconds: 100)
                      : Duration(milliseconds: 200),
                  alignment: align2,
                  curve: isPressed ? Curves.easeIn : Curves.easeOut,
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 100),
                    curve: isPressed ? Curves.easeIn : Curves.easeOut,
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey[300],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[600],
                          offset: Offset(10, 10),
                          blurRadius: 8,
                          spreadRadius: 2,
                        ),
                        BoxShadow(
                          color: Colors.white,
                          offset: Offset(-5, -5),
                          blurRadius: 8,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Icon(
                        Icons.security,
                        size: 30,
                      ),
                    ),
                  ),
                ),
                //Center Button - Toggle
                Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () => setState(() {
                      if (!isPressed) {
                        isPressed = !isPressed;
                        _controller1.forward();
                        Future.delayed(Duration(milliseconds: 50), () {
                          setState(() {
                            align1 = Alignment(
                              -0.4,
                              0.8,
                            );
                            align2 = Alignment(
                              0.4,
                              0.8,
                            );
                          });
                        });
                      } else {
                        isPressed = !isPressed;
                        _controller1.reverse();
                        Future.delayed(Duration(milliseconds: 50), () {
                          setState(() {
                            align1 = Alignment(
                              0.0,
                              1.0,
                            );
                            align2 = Alignment(
                              0.0,
                              1.0,
                            );
                          });
                        });
                      }
                    }),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 30),
                      child: Icon(
                        (isPressed) ? Icons.close : Icons.circle_outlined,
                        size: 35,
                      ),
                      // Image.asset(
                      //   "assets/expand_icon.png",
                      // ),
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[300],
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[600],
                            offset: Offset(10, 10),
                            blurRadius: 8,
                            spreadRadius: 2,
                            inset: isPressed,
                          ),
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(-5, -5),
                            blurRadius: 8,
                            spreadRadius: 2,
                            inset: isPressed,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          appBar: new PreferredSize(
            preferredSize: new Size(width, 60),
            child: Container(
              width: width * 1.0,
              height: 60,
              child: Row(
                children: [
                  Padding(
                    child: Image.asset("assets/mock_icon.png"),
                    padding: EdgeInsets.all(10),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      CustomPageRoute(
                        child: SettingsScreen(),
                        transitionDuration: Duration(milliseconds: 300),
                      ),
                    ),
                    child: Padding(
                      child: Icon(
                        Icons.settings_outlined,
                        size: 40,
                      ),
                      padding: EdgeInsets.all(10),
                    ),
                  ),
                ],
              ),
            ),
          ),
          //App Bar static on top

          //Main Body - Scroll
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
                    "Hey Sebastian,\nYour Passwords.",
                    style: GoogleFonts.lato(
                      //color: Colors.red[800],
                      color: Colors.black,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              StickyHeader(
                header: Padding(
                  padding: EdgeInsets.only(
                    left: 10.0,
                    right: 10.0,
                    top: 8.0,
                    bottom: 30.0,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 45.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey[300],
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[600],
                                offset: Offset(8, 8),
                                blurRadius: 10,
                                spreadRadius: 4,
                              ),
                              BoxShadow(
                                color: Colors.white,
                                offset: Offset(-8, -8),
                                blurRadius: 10,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8),
                                child: Icon(
                                  Icons.search,
                                  color: Colors.grey[600],
                                  size: 24,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  top: 5.0,
                                  right: 10.0,
                                  bottom: 5.0,
                                ),
                                child: Container(
                                  width: (width * 0.7),
                                  //child: CompositedTransformTarget(
                                  //link: this._layerLink,
                                  child: TextField(
                                    decoration: null,
                                    cursorColor: Colors.black,
                                    style: GoogleFonts.lato(
                                      fontSize: 20.0,
                                    ),
                                  ),
                                  //),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10.0),
                                child: GestureDetector(
                                  onTap: () {
                                  },
                                  child: Container(
                                    height: 40.0,
                                    width: 40.0,
                                    child: Center(
                                      child: Image.asset(
                                        "assets/wheel_icon.png",
                                        height: 30.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                content: Column(
                    children: List<int>.generate(11, (index) => index)
                        .map((item) => (item <= 9)
                            ? PasswordCard()
                            : Container(
                                height: 180,
                              ))
                        .toList()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PasswordCard extends StatelessWidget {
  const PasswordCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      child: Stack(
        children: [
          Container(
            height: 100.0,
            padding: EdgeInsets.all(10.0),
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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Colors.green[400],
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Google Account",
                      style: GoogleFonts.lato(
                        //color: Colors.red[800],
                        color: Colors.grey[800],
                        fontSize: 30.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: Text(
                            "Username:",
                            style: GoogleFonts.lato(
                              //color: Colors.red[800],
                              color: Colors.grey[700],
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 150,
                          child: Text(
                            "bastidmn",
                            style: GoogleFonts.lato(
                              //color: Colors.red[800],
                              color: Colors.grey[600],
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 100,
                          child: Text(
                            "Email:",
                            style: GoogleFonts.lato(
                              //color: Colors.red[800],
                              color: Colors.grey[600],
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 200,
                          child: Text(
                            "bastidmn080@gmail.com",
                            style: GoogleFonts.lato(
                              //color: Colors.red[800],
                              color: Colors.grey[600],
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Visibility(
            visible: true,
            child: Positioned(
              top: 10.0,
              right: 10.0,
              child: Container(
                height: 25.0,
                width: 25.0,
                decoration: BoxDecoration(
                  color: Colors.red[900],
                  borderRadius: BorderRadius.circular(15),
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
                child: Center(
                  child: Icon(
                    Icons.priority_high,
                    color: Colors.grey[300],
                    size: 20.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
