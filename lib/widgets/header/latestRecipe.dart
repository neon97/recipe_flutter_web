import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:recipe_web/assets/images.dart';

import 'icondetails.dart';

class Latestrecipe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Text(
            "Latest Recipes",
            style: GoogleFonts.josefinSans(
                fontSize: 28.0, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: width < 1100
              ? gridView(width)
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 5, child: gridView(width)),
                    Expanded(
                        flex: 2,
                        child: Container(
                          padding: EdgeInsets.only(left: 25.0),
                          child: sideRow(),
                        ))
                  ],
                ),
        )
      ],
    );
  }

  Widget gridView(
    double width,
  ) {
    double aspctRatio = 0;
    if (width < 600)
      aspctRatio = 9 / 15;
    else if (width < 700)
      aspctRatio = 9 / 13;
    else if (width < 800)
      aspctRatio = 9 / 12;
      else if (width > 1200)
      aspctRatio = 9 / 15;
    else
      aspctRatio = 9 / 16;

    return GridView.count(
      childAspectRatio: aspctRatio,
      crossAxisCount: width < 800 ? 1 : 2,
      crossAxisSpacing: width < 800 ? 0.0 : 25.0,
      physics:
          NeverScrollableScrollPhysics(), // to disable GridView's scrolling
      shrinkWrap: true, // You won't see infinite size error
      children: [
        for (int i = 0; i < 4; i++)
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 1 / 1,
                  child: Image(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        latestRecipes[i]["image"],
                      )),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 30.0, bottom: 15.0),
                    child: Text(
                      latestRecipes[i]["title"],
                      style: GoogleFonts.josefinSans(
                          fontSize: 28.0, fontWeight: FontWeight.bold),
                    )),
                Row(
                  children: [
                    Text(latestRecipes[i]["subtitle"],
                        style: GoogleFonts.montserrat(
                            color: Colors.greenAccent[700],
                            fontSize: 13.0,
                            fontWeight: FontWeight.w500)),
                    SizedBox(
                      width: 8.0,
                    ),
                    iconContent(FontAwesome.comment,
                        latestRecipes[i]["comments"], 15, 13, Colors.black)
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Text(
                    latestRecipes[i]["data"],
                    style: GoogleFonts.raleway(height: 1.5),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 85.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("READ MORE",
                          style: GoogleFonts.montserrat(
                            fontSize: 13.0,
                          )),
                      Divider(
                        color: Colors.black,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget listTiles(List<Widget> children) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
      ),
      child: Column(children: children),
    );
  }

  Widget sideRow() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        DottedBorder(
            borderType: BorderType.Circle,
            dashPattern: [8, 4],
            strokeWidth: 2,
            color: Colors.greenAccent[700],
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: CircleAvatar(
                maxRadius: 100.0,
                backgroundImage: NetworkImage(
                    "https://yt3.ggpht.com/ytc/AAUvwnjYhYW6ObSKrjfGnO2bUmFO4tu8a72nWTyO_hwTTE4=s88-c-k-c0x00ffffff-no-rj"),
              ),
            )),

        SizedBox(
          height: 8.0,
        ),

//name
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text("Hi, I am Aarti!",
              style: GoogleFonts.josefinSans(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              )),
        ),

//decp
        Text(
          "Food stylist & photographer. Loves nature and healthy food, and good coffee. Don't hesitate to come for say a small 'hello!'",
          style: GoogleFonts.raleway(height: 1.5),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
