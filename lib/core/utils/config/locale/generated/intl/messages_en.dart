// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(amount) => "${amount} EGP";

  static String m1(min) => "Can\'t be less than ${min}";

  static String m2(max) => "Can\'t be more than ${max}";

  static String m3(date) => "Last Order : ${date}";

  static String m4(orderNumber) => "Order No: ${orderNumber}";

  static String m5(pageName) => "Page \'${pageName}\' not found in routes";

  static String m6(number) => "Question ${number}:";

  static String m7(reportNumber) => "Report No: ${reportNumber}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "accountAlreadyExistsForThatEmail": MessageLookupByLibrary.simpleMessage(
      "The account already exists for that email.",
    ),
    "addReport": MessageLookupByLibrary.simpleMessage("Add Report"),
    "amountEGP": m0,
    "areYouSureYouWantToReturnBack": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to return back",
    ),
    "back": MessageLookupByLibrary.simpleMessage("Back"),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "cantBeLessThan": m1,
    "cantBeMoreThan": m2,
    "clientTookTooLong": MessageLookupByLibrary.simpleMessage(
      "The client took too long to respond.",
    ),
    "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
    "confirmPassword": MessageLookupByLibrary.simpleMessage("Confirm Password"),
    "connectedToInternet": MessageLookupByLibrary.simpleMessage(
      "Connected to the internet",
    ),
    "createYourOwnEmail": MessageLookupByLibrary.simpleMessage(
      "Create your own email",
    ),
    "date": MessageLookupByLibrary.simpleMessage("Date"),
    "doNotHaveAnAccount": MessageLookupByLibrary.simpleMessage(
      "Don\'t have an account ? ",
    ),
    "done": MessageLookupByLibrary.simpleMessage("Done"),
    "emailAddress": MessageLookupByLibrary.simpleMessage("Email address"),
    "empty": MessageLookupByLibrary.simpleMessage("Empty"),
    "enableService": MessageLookupByLibrary.simpleMessage("Enable Service"),
    "enterEmailAddress": MessageLookupByLibrary.simpleMessage(
      "Enter email address",
    ),
    "enterThePassword": MessageLookupByLibrary.simpleMessage(
      "Enter the password",
    ),
    "enterValidEmail": MessageLookupByLibrary.simpleMessage(
      "Enter valid E-mail",
    ),
    "enterYourCredentialsToContinue": MessageLookupByLibrary.simpleMessage(
      "Enter your credentials to continue.",
    ),
    "enterYourMobileNumber": MessageLookupByLibrary.simpleMessage(
      "Enter your mobile number",
    ),
    "error": MessageLookupByLibrary.simpleMessage("Error"),
    "fillField": MessageLookupByLibrary.simpleMessage("fill this field"),
    "findWhatYouAreLookingFor": MessageLookupByLibrary.simpleMessage(
      "Find what you\'re looking for",
    ),
    "forgetPassword": MessageLookupByLibrary.simpleMessage(
      "Forget password ? ",
    ),
    "goBack": MessageLookupByLibrary.simpleMessage("Go back"),
    "grantLocationAccess": MessageLookupByLibrary.simpleMessage(
      "Allow Location Access",
    ),
    "hidePassword": MessageLookupByLibrary.simpleMessage("Hide password"),
    "home": MessageLookupByLibrary.simpleMessage("Home"),
    "ifYouReturnNowYouWillLoseAllData": MessageLookupByLibrary.simpleMessage(
      "If you return now, you will lose all data!",
    ),
    "lastOrder": m3,
    "locationServiceDisabled": MessageLookupByLibrary.simpleMessage(
      "The location service on the device is disabled.",
    ),
    "logOut": MessageLookupByLibrary.simpleMessage("Log out"),
    "login": MessageLookupByLibrary.simpleMessage("Log in"),
    "loginNow": MessageLookupByLibrary.simpleMessage("Log in Now"),
    "mobileNumber": MessageLookupByLibrary.simpleMessage("Mobile Number"),
    "name": MessageLookupByLibrary.simpleMessage("Name"),
    "needsSynchronization": MessageLookupByLibrary.simpleMessage(
      "Needs synchronization",
    ),
    "noData": MessageLookupByLibrary.simpleMessage("No Data"),
    "noInternetConnection": MessageLookupByLibrary.simpleMessage(
      "No internet connection",
    ),
    "noUserFoundForThatEmail": MessageLookupByLibrary.simpleMessage(
      "No user found for that email.",
    ),
    "notSamePass": MessageLookupByLibrary.simpleMessage("Not same password"),
    "orderNo": MessageLookupByLibrary.simpleMessage("Order No."),
    "orderNoNumber": m4,
    "orders": MessageLookupByLibrary.simpleMessage("Orders"),
    "pageNameNotFoundInRoutes": m5,
    "pageNotFound": MessageLookupByLibrary.simpleMessage("Page not found"),
    "password": MessageLookupByLibrary.simpleMessage("Password"),
    "passwordProvidedIsTooWeak": MessageLookupByLibrary.simpleMessage(
      "The password provided is too weak.",
    ),
    "pleaseAnswerAllQuestions": MessageLookupByLibrary.simpleMessage(
      "Please answer all questions",
    ),
    "pressAgainToExit": MessageLookupByLibrary.simpleMessage(
      "Press again to exit",
    ),
    "privacyPolicy": MessageLookupByLibrary.simpleMessage("Privacy Policy"),
    "questionNo": m6,
    "recover": MessageLookupByLibrary.simpleMessage("Recover"),
    "rememberMe": MessageLookupByLibrary.simpleMessage("Remember me"),
    "reportDetails": MessageLookupByLibrary.simpleMessage("Report Details"),
    "reportNo": MessageLookupByLibrary.simpleMessage("Report No."),
    "reportNoNumber": m7,
    "reports": MessageLookupByLibrary.simpleMessage("Reports"),
    "requestLocationPermission": MessageLookupByLibrary.simpleMessage(
      "Please grant permission to access your device\'s location",
    ),
    "save": MessageLookupByLibrary.simpleMessage("Save"),
    "search": MessageLookupByLibrary.simpleMessage("Search"),
    "selectDate": MessageLookupByLibrary.simpleMessage("Select date"),
    "selectMonth": MessageLookupByLibrary.simpleMessage("Select Month"),
    "serverTookTooLong": MessageLookupByLibrary.simpleMessage(
      "The server took too long to respond.",
    ),
    "serverTookTooLongToRespond": MessageLookupByLibrary.simpleMessage(
      "The server took too long to respond.",
    ),
    "showPassword": MessageLookupByLibrary.simpleMessage("Show password"),
    "signUp": MessageLookupByLibrary.simpleMessage("Sign up"),
    "sslCertificateNotTrusted": MessageLookupByLibrary.simpleMessage(
      "The SSL certificate is not trusted.",
    ),
    "stayHere": MessageLookupByLibrary.simpleMessage("Stay here"),
    "successfully": MessageLookupByLibrary.simpleMessage("successfully"),
    "termsConditions": MessageLookupByLibrary.simpleMessage(
      "Terms & Conditions",
    ),
    "theSuppliedAuthCredentialIsIncorrect": MessageLookupByLibrary.simpleMessage(
      "The supplied auth credential is incorrect, malformed or has expired.",
    ),
    "thereIsProblemWithServerTryAgainLater":
        MessageLookupByLibrary.simpleMessage(
          "There is a problem with the server. Try again later.",
        ),
    "totalOrder": MessageLookupByLibrary.simpleMessage("Total Order"),
    "typeYourAnswerHere_": MessageLookupByLibrary.simpleMessage(
      "Type your answer here ...",
    ),
    "unauthorizedError": MessageLookupByLibrary.simpleMessage(
      "Your session has expired or you are not authorized. Please log in again.",
    ),
    "understood": MessageLookupByLibrary.simpleMessage("Understood"),
    "unknown": MessageLookupByLibrary.simpleMessage("Unknown"),
    "unknownErrorOccurred": MessageLookupByLibrary.simpleMessage(
      "An unknown error occurred.",
    ),
    "unverified": MessageLookupByLibrary.simpleMessage("Unverified"),
    "verified": MessageLookupByLibrary.simpleMessage("Verified"),
    "wrongPasswordProvidedForThatUser": MessageLookupByLibrary.simpleMessage(
      "Wrong password provided for that user.",
    ),
  };
}
