import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_web/widgets/header/topcuisines.dart';

class BrandingHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.center,
      height: width > 1200 ? 90.0 : 100.0,
      width: width,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: width > 600 ? 50.0 : 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
//logo
          Container(
            height: width > 1100 ? 90.0 : 80.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Cuisine.studio",
                  style: GoogleFonts.architectsDaughter(fontSize: 35.0),
                ),
                Text(
                  "COOK & PRESENT",
                  textAlign: TextAlign.end,
                  style: GoogleFonts.signika(fontSize: 13.0),
                ),
              ],
            ),
          ),
          //tabs
          width > 1200
              ? Row(
                  children: [
                    tabs("HOME", 0.0),
                    tabs("RECIPES", 90.0),
                    tabs("FEATURES", 180.0),
                    tabs("PAGES", 270.0),
                    tabs("SHOPS", 360.0),
                    tabs("COURSES", 450.0),
                    tabs(
                      "PURCHASE",
                      540.0,
                      false,
                    )
                  ],
                )
              : SizedBox.shrink(),

          Row(
            children: [
              IconButton(icon: Icon(Icons.search), onPressed: () {}),
              width < 1100
                  ? IconButton(icon: Icon(Icons.menu), onPressed: () {})
                  : SizedBox.shrink()
            ],
          )
        ],
      ),
    );
  }

  Widget tabs(String content, double space, [bool show]) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GestureDetector(
        onTap: () {
          //hovering overlay affects
          // onhover( space);
        },
        child: Row(
          children: [
            Text(
              content,
              style: GoogleFonts.nunitoSans(
                  fontSize: 12.5, fontWeight: FontWeight.w800),
            ),
            SizedBox(
              width: 5.0,
            ),
            show == false
                ? SizedBox.shrink()
                : Icon(
                    Icons.keyboard_arrow_down,
                    size: 15.0,
                  )
          ],
        ),
      ),
    );
  }

  void onhover(double space) {
    if (topCuisineHeaderState.showOptions) {
      topCuisineHeaderState.showOptions = false;
      topCuisineHeaderState.padd = 0.0;
      topCuisineHeaderState.addSpace = 0.0;
      topCuisineHeaderState.setState(() {});
    } else {
      topCuisineHeaderState.addSpace = space;
      topCuisineHeaderState.showOptions = true;
      topCuisineHeaderState.padd = 0.0;
      topCuisineHeaderState.setState(() {});
    }
  }
}
