import 'package:flutter/material.dart';
import 'package:recipe_web/model/data.dart';
import 'package:recipe_web/route/route.dart';

class RecipeRouteInformationParser
    extends RouteInformationParser<RecipeRoutePath> {
  @override
  Future<RecipeRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location);
    // Handle '/'
    if (uri.pathSegments.length == 0) {
      return RecipeRoutePath.home();
    }

    if (uri.pathSegments.length > 0) {
      //Handles the possibles paths of the routes
      int index = recipePagesList.indexWhere((element) =>
          element.pagename.contains(uri.pathSegments[0].toString()));
      if (!index.isNegative) {
        return RecipeRoutePath.page(index);
      } else {
        return RecipeRoutePath.unknown();
      }
    }
    return RecipeRoutePath.unknown();
  }

//this provide the information on the weblink search bar
  @override
  RouteInformation restoreRouteInformation(RecipeRoutePath path) {
    if (path.isUnknown) {
      return RouteInformation(location: '/404');
    }
    if (path.isHomePage) {
      return RouteInformation(location: '/');
    }
    if (path.isDetailsPage) {
      return RouteInformation(
          location: '/${recipePagesList[path.id].pagename}');
    }
    return null;
  }
}
