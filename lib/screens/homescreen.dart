import 'package:flutter/material.dart';
import 'package:recipe_web/model/recipePage.dart';
import 'package:recipe_web/widgets/header/branding.dart';
import 'package:recipe_web/widgets/header/cuisine_face.dart';
import 'package:recipe_web/widgets/header/header.dart';
import 'package:recipe_web/widgets/header/latestRecipe.dart';
import 'package:recipe_web/widgets/header/popularCui.dart';
import 'package:recipe_web/widgets/header/topcuisines.dart';

class HomeScreen extends StatelessWidget {
  final List<RecipePage> recipePage;
  final ValueChanged<RecipePage> onTapped;

  HomeScreen({
    @required this.recipePage,
    @required this.onTapped,
  });
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
//header
              width > 1000
                  ? BlackHeader(
                      onTapped: onTapped,
                      recipePage: recipePage,
                    )
                  : SizedBox.shrink(),

//branding
              BrandingHeader(),

//carousel images of top cuisines
              TopCuisineHeader(),
              SizedBox(
                height: 15.0,
              ),

//most popular recipes
              PopularCuisine(),
              SizedBox(
                height: 40.0,
              ),

//cuisine avatar
              circleCuisineFace(width),
              SizedBox(
                height: 40.0,
              ),

//latest recipe
              Latestrecipe()
            ],
          ),
        ),
      ),
    );
  }
}
