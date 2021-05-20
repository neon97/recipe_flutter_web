import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_web/assets/images.dart';

import 'icondetails.dart';

_TopCuisineHeaderState topCuisineHeaderState;

class TopCuisineHeader extends StatefulWidget {
  @override
  _TopCuisineHeaderState createState() {
    topCuisineHeaderState = _TopCuisineHeaderState();
    return topCuisineHeaderState;
  }
}

class _TopCuisineHeaderState extends State<TopCuisineHeader> {
  //datatypes
  int currentIndex = 0;
  double padd = 20;
  bool showOptions = false;
  double addSpace = 0.0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: width < 600.0
          ? 500
          : width > 1100.0
              ? 620
              : 560.0,
      width: width,
      child: Stack(
        children: [
//images bacground
          Container(
              height: width > 1100.0 ? 560 : 500.0,
              width: width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(headerCuisine[currentIndex]["image"]),
                      fit: BoxFit.cover,
                      colorFilter:
                          ColorFilter.mode(Colors.black26, BlendMode.darken)))),
//testing mode
          // Positioned(
          //   top: 0.0,
          //   left: width / 3.5 + addSpace,
          //   child: showOptions == true ? animatedtabs() : SizedBox.shrink(),
          // ),

//newly recipes imag dynamic size chnager
          width > 800.0
              ? Positioned(
                  bottom: 0.0,
                  right: width > 1200.0
                      ? 150.0
                      : width > 1000
                          ? 80.0
                          : width > 800
                              ? 40.0
                              : 35.0,
                  left: width > 1200.0
                      ? 150.0
                      : width > 1000
                          ? 80.0
                          : width > 800
                              ? 40.0
                              : 35.0,
                  child: listofCuisinesImages(width))
              : SizedBox.shrink(),

//detils of the bg recipe
          detailOfbgrecipe(currentIndex, width),
        ],
      ),
    );
  }

  void switchCuisine(int chnageno) {
    setState(() {
      currentIndex = chnageno;
    });
  }

  Widget listofCuisinesImages(double width) {
    return Container(
        height: width - width > 1200.0 ? 180.0 : 130.0,
        color: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 3.0, horizontal: 3.0),
        child: GridView.count(
            crossAxisSpacing: 3,
            crossAxisCount: 5,
            physics:
                NeverScrollableScrollPhysics(), // to disable GridView's scrolling
            shrinkWrap: true, // You won't see infinite size error
            children: <Widget>[
              for (int i = 0; i < 5; i++)
                GestureDetector(
                    child: changeCuisinetoTop(i),
                    onTap: () => switchCuisine(i)),
            ]));
  }

  Widget changeCuisinetoTop(int i) {
    return Image(
      fit: BoxFit.cover,
      color: Colors.black38,
      colorBlendMode: currentIndex == i ? BlendMode.lighten : BlendMode.darken,
      image: NetworkImage(headerCuisine[i]["image"]),
    );
  }

  Widget detailOfbgrecipe(int i, double width) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          headerCuisine[i]["name"],
          style: GoogleFonts.josefinSans(
              fontSize: width < 800 ? 35.0 : 60.0,
              color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0),
          child: Text(
            headerCuisine[i]["cuisine"],
            style: GoogleFonts.montserrat(fontSize: 20.0, color: Colors.white),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            iconContent(
              Icons.visibility,
              headerCuisine[i]["view"],
            ),
            iconContent(
              Icons.favorite,
              headerCuisine[i]["likes"],
            ),
            iconContent(
              FontAwesome.comments,
              headerCuisine[i]["comments"],
            ),
          ],
        )
      ],
    );
  }

 

  Widget animatedtabs() {
    return AnimatedPadding(
      padding: EdgeInsets.only(top: padd),
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 800),
      child: Container(
        width: 150.0,
        color: Colors.white,
        child: Column(
          children: [
            Text("Main Home"),
            Text("Main Home"),
            Text("Main Home"),
            Text("Main Home"),
            Text("Main Home"),
            Text("Main Home"),
            Text("Main Home"),
          ],
        ),
      ),
    );
  }
}
