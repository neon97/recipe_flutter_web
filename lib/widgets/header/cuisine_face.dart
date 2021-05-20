import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_web/assets/images.dart';

Widget circleCuisineFace(double width) {
  return Container(
    color: Colors.deepOrangeAccent[100].withOpacity(0.1),
    width: width,
    // height: 300.0,
    padding: EdgeInsets.all(55.0),
    child: GridView.count(
        crossAxisSpacing: 15, //vertical
        mainAxisSpacing:  15, // horizontal
        crossAxisCount: width > 1200
            ? 8
            : width > 800
                ? 4
                : 2,
        physics:
            NeverScrollableScrollPhysics(), // to disable GridView's scrolling
        shrinkWrap: true, // You won't see infinite size error
        children: <Widget>[
          for (int i = 0; i < 8; i++)
            Column(
              children: [
                Flexible(
                  child: CircleAvatar(
                    maxRadius: 80.0,
                    // minRadius: 50.0,
                    backgroundColor: Colors.blue,
                    backgroundImage: NetworkImage(avatarCuisine[i]["image"]),
                  ),
                ),
                SizedBox(
                  height: 7.0,
                ),
                Text(avatarCuisine[i]["name"],
                    style: GoogleFonts.ubuntu(
                        fontSize: 13.0, fontWeight: FontWeight.w500))
              ],
            ),
        ]),
  );
}
