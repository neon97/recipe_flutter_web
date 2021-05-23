import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../assets/images.dart';
import '../../model/recipePage.dart';

//https://tinysalt.loftocean.com/

class FooterPart extends StatefulWidget {
  final List<RecipePage> recipePage;
  final ValueChanged<RecipePage> onTapped;
  FooterPart({@required this.recipePage, @required this.onTapped});
  @override
  _FooterPartState createState() => _FooterPartState();
}

class _FooterPartState extends State<FooterPart> {
  //datatypes
  bool agree = false;
  double width;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
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
          style:
              GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 16.5),
        ),

//email and subcribe button
        emailSub(),

//terms & condidions
        termsCond(),
        SizedBox(
          height: 70.0,
        ),

//lastPhotos & Insta
        lastFooter()
      ],
    );
  }

  Widget lastFooter() {
    return Container(
      height: width < 600
          ? 570
          : width > 800
              ? width / 4
              : width / 3,
      color: Colors.black,
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: GridView.count(
              physics: new NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              crossAxisCount: width < 600 ? 3 : 6,
              children: [
                for (String image in footerImages)
                  Image(
                    image: NetworkImage(image),
                    fit: BoxFit.cover,
                  )
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: width > 1200 ? 50.0 : 20.0),
              child: width < 800
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [footerSections(true), madeBy(true)],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [footerSections(false), madeBy(false)],
                    ),
            ),
          )
        ],
      ),
    );
  }

  Widget footerSections(bool width800) {
    return Row(
      mainAxisAlignment:
          width800 ? MainAxisAlignment.center : MainAxisAlignment.start,
      children: [
        footerTab("IMPRINT", 4),
        footerTab("PRIVACY POLICY", 5),
        footerTab("CONTACT", 2),
      ],
    );
  }

  Widget madeBy(bool width800) {
    return Column(
      mainAxisAlignment:
          width800 ? MainAxisAlignment.start : MainAxisAlignment.center,
      crossAxisAlignment:
          width800 ? CrossAxisAlignment.center : CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment:
              width800 ? MainAxisAlignment.center : MainAxisAlignment.end,
          children: [
            Text(
              "Cook & Write with ",
              style: GoogleFonts.nunitoSans(
                  fontSize: 13,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Icon(
              Icons.favorite,
              color: Colors.red,
              size: 12,
            ),
            Text(
              " by Mr.Neon",
              style: GoogleFonts.nunitoSans(fontSize: 13, color: Colors.white),
            ),
          ],
        ),
        Text(
          "Cuisine.Studio © Copyright 2021. All rights reserved.",
          style: GoogleFonts.nunitoSans(fontSize: 13, color: Colors.white),
        ),
      ],
    );
  }

  Widget footerTab(String _data, int index) {
    return Padding(
        padding: const EdgeInsets.only(left: 30.0),
        child: GestureDetector(
            child: Text(
              _data,
              style:
                  GoogleFonts.nunitoSans(fontSize: 12.5, color: Colors.white),
            ),
            onTap: () => widget.onTapped(widget.recipePage[index])));
  }

  Widget termsCond() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
            activeColor: Color.fromRGBO(0, 223, 110, 1),
            value: agree,
            onChanged: (value) {
              setState(() {
                agree = value;
              });
            }),
        Text(
          "I have read and agree to the ",
          style: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Text(
          "terms & conditions.",
          style: GoogleFonts.nunito(fontWeight: FontWeight.bold, fontSize: 16),
        )
      ],
    );
  }

  Widget emailSub() {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0, bottom: 25.0),
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
