import 'package:flutter/material.dart';
import 'package:recipe_web/model/data.dart';
import 'package:recipe_web/route/route.dart';
import 'package:recipe_web/model/recipePage.dart';
import 'package:recipe_web/screens/errorRoute.dart';
import 'package:recipe_web/screens/homescreen.dart';

class RecipeRouterDelegate extends RouterDelegate<RecipeRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RecipeRoutePath> {
  final GlobalKey<NavigatorState> navigatorKey;

  RecipePage _selectedpage;
  bool show404 = false;



  RecipeRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  RecipeRoutePath get currentConfiguration {
    if (show404) {
      return RecipeRoutePath.unknown();
    }
    return _selectedpage == null
        ? RecipeRoutePath.home()
        : RecipeRoutePath.page(recipePagesList.indexOf(_selectedpage));
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          key: ValueKey('RecipeListPage'),
          child: HomeScreen(   
            recipePage: recipePagesList,
            onTapped: _handleBookTapped,
          ),
        ),
        if (show404)
          MaterialPage(key: ValueKey('UnknownPage'), child: UnknownScreen())
        else if (_selectedpage != null)
          RecipeDetailsPage(recipePage: _selectedpage)
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }

        // Update the list of pages by setting _selectedBook to null
        _selectedpage = null;
        show404 = false;
        notifyListeners();
        return true;
      },
    );
  }
//woorking ??
  @override
  Future<void> setNewRoutePath(RecipeRoutePath path) async {
    if (path.isUnknown) {
      _selectedpage = null;
      show404 = true;
      return;
    }

    if (path.isDetailsPage) {
      if (path.id < 0 || path.id > recipePagesList.length - 1) {
        show404 = true;
        return;
      }

      _selectedpage = recipePagesList[path.id];
    } else {
      _selectedpage = null;
    }

    show404 = false;
  }

  void _handleBookTapped(RecipePage page) {
    _selectedpage = page;
    notifyListeners();
  }
}
