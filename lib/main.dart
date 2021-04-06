import 'package:flutter/material.dart';
import 'package:recipe_web/route/linkHandler.dart';
import 'package:recipe_web/route/routeDelegate.dart';


void main() {
  runApp(RecipeApp());
}

class RecipeApp extends StatefulWidget {
  @override
  _RecipeAppState createState() => _RecipeAppState();
}

class _RecipeAppState extends State<RecipeApp> {
  RecipeRouterDelegate _routerDelegate = RecipeRouterDelegate();
  RecipeRouteInformationParser _routeInformationParser =
      RecipeRouteInformationParser();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Cuisine App',
      routerDelegate: _routerDelegate,
      routeInformationParser: _routeInformationParser,
    );
  }
}
