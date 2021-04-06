import 'package:flutter/material.dart';
import 'package:recipe_web/model/recipePage.dart';
import 'package:recipe_web/route/ongeneRoute.dart';

class RecipeRoutePath {
  final int id;
  final bool isUnknown;

  RecipeRoutePath.home()
      : id = null,
        isUnknown = false;

  RecipeRoutePath.page(this.id) : isUnknown = false;

  RecipeRoutePath.unknown()
      : id = null,
        isUnknown = true;

  bool get isHomePage => id == null;

  bool get isDetailsPage => id != null;
}

class RecipeDetailsPage extends Page {
  final RecipePage recipePage;

  RecipeDetailsPage({
    this.recipePage,
  }) : super(key: ValueKey(recipePage));

  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return getRoute(recipePage);
      },
    );
  }
}
