import 'package:recipe_web/model/recipePage.dart';
import 'package:recipe_web/screens/about.dart';
import 'package:recipe_web/screens/contact.dart';
import 'package:recipe_web/screens/errorRoute.dart';
import 'package:recipe_web/screens/imprint.dart';
import 'package:recipe_web/screens/newslatter.dart';
import 'package:recipe_web/screens/privacy_policy.dart';

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
    case "imprint":
      return Imprint();
      break;
    case "privacy_policy":
      return PrivacyPolicy();
      break;
    default:
      return UnknownScreen();
  }
}
