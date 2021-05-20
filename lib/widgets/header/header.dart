import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_web/model/recipePage.dart';
// ignore: avoid_web_libraries_in_flutter


import '../socialIcons.dart';     //can create issue bcause this is web plugin

class BlackHeader extends StatelessWidget {
  final List<RecipePage> recipePage;
  final ValueChanged<RecipePage> onTapped;
  BlackHeader({@required this.recipePage, @required this.onTapped});

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: _width > 1200 ? 50.0 : 20.0),
      width: _width,
      height: 40.0,
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              tabs("ABOUT", context, 0),
              tabs("CONTACT", context, 1),
              tabs("NEWSLETTER", context, 2)
            ],
          ),
          Row(
            children: [
              icons(FontAwesome5Brands.facebook_f, "facebbok"),
              icons(FontAwesome5Brands.twitter, "twitter"),
              icons(FontAwesome5Brands.instagram, "instagram"),
              icons(FontAwesome5Brands.pinterest_p, "pinterest"),
              icons(FontAwesome5Brands.youtube, "youtube"),
            ],
          )
        ],
      ),
    );
  }

  Widget tabs(String _data, BuildContext _context, int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0),
      child: GestureDetector(
          child: Text(
            _data,
            style:
                GoogleFonts.nunitoSans(fontSize: 12.5, color: Colors.white70),
          ),
          onTap: () => onTapped(recipePage[index])),
    );
  }


}
