import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
//https://tinysalt.loftocean.com/

class FooterPart extends StatefulWidget {
  @override
  _FooterPartState createState() => _FooterPartState();
}

class _FooterPartState extends State<FooterPart> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Divider(
          color: Colors.grey[300],
        ),

//never miss widget
        neverMiss(),

// tagline
        Text(
          "Join thousands of Cuisine Studio subcribers and get our best recipes delivered each week!",
          textAlign: TextAlign.center,
        ),

//email and subcribe button
        emailSub()
      ],
    );
  }

  Widget emailSub() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          width: 500.0,
          height: 40.0,
          child: Stack(
            children: [
              Container(
                alignment: Alignment.center,
                width: 500.0,
                height: 40.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[200]),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 5,
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              contentPadding:
                                  EdgeInsets.fromLTRB(20, 0, 20, 10),
                              hintText: "Your Email Address",
                              hintStyle: TextStyle(
                                  color: Colors.grey[500], fontSize: 14.0)),
                        )),
                    Expanded(
                      flex: 2,
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromRGBO(0, 223, 110, 1)),
                        child: Text(
                          "SUBSCRIBE",
                          style: TextStyle(color: Colors.white, fontSize: 14.0),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget neverMiss() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          height: 100,
          child: Stack(
            children: [
              Positioned(
                right: 0,
                top: 0,
                child: Transform.rotate(
                  angle: 3.14 / 6,
                  child: Icon(
                    Octicons.mail,
                    color: Colors.grey[300].withOpacity(0.6),
                    size: 100.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25, right: 20),
                child: Text("Never Miss a Recipe!",
                    style: GoogleFonts.nunito(
                        fontSize: 26.0, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
