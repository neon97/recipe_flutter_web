import 'package:recipe_web/model/recipePage.dart';
import 'package:recipe_web/screens/about.dart';
import 'package:recipe_web/screens/contact.dart';
import 'package:recipe_web/screens/errorRoute.dart';
import 'package:recipe_web/screens/newslatter.dart';

getRoute(RecipePage recipePage) {
  print(recipePage.pagename);
  switch (recipePage.pagename) {
    case "about":
      return AboutPage();
      break;
    case "contactus":
      return ContactPage();
      break;
    case "newsletter":
      return NewletterPage();
      break;
    default:
      return UnknownScreen();
  }
}
