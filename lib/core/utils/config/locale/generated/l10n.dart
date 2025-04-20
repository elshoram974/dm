// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name =
        (locale.countryCode?.isEmpty ?? false)
            ? locale.languageCode
            : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Terms & Conditions`
  String get termsConditions {
    return Intl.message(
      'Terms & Conditions',
      name: 'termsConditions',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `Report Details`
  String get reportDetails {
    return Intl.message(
      'Report Details',
      name: 'reportDetails',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message('Error', name: 'error', desc: '', args: []);
  }

  /// `Understood`
  String get understood {
    return Intl.message('Understood', name: 'understood', desc: '', args: []);
  }

  /// `Please answer all questions`
  String get pleaseAnswerAllQuestions {
    return Intl.message(
      'Please answer all questions',
      name: 'pleaseAnswerAllQuestions',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Type your answer here ...`
  String get typeYourAnswerHere_ {
    return Intl.message(
      'Type your answer here ...',
      name: 'typeYourAnswerHere_',
      desc: '',
      args: [],
    );
  }

  /// `Add Report`
  String get addReport {
    return Intl.message('Add Report', name: 'addReport', desc: '', args: []);
  }

  /// `Question {number}:`
  String questionNo(String number) {
    return Intl.message(
      'Question $number:',
      name: 'questionNo',
      desc: '',
      args: [number],
    );
  }

  /// `Empty`
  String get empty {
    return Intl.message('Empty', name: 'empty', desc: '', args: []);
  }

  /// `Total Order`
  String get totalOrder {
    return Intl.message('Total Order', name: 'totalOrder', desc: '', args: []);
  }

  /// `{amount} EGP`
  String amountEGP(String amount) {
    return Intl.message(
      '$amount EGP',
      name: 'amountEGP',
      desc: '',
      args: [amount],
    );
  }

  /// `Order No.`
  String get orderNo {
    return Intl.message('Order No.', name: 'orderNo', desc: '', args: []);
  }

  /// `Order No: {orderNumber}`
  String orderNoNumber(String orderNumber) {
    return Intl.message(
      'Order No: $orderNumber',
      name: 'orderNoNumber',
      desc: '',
      args: [orderNumber],
    );
  }

  /// `Select Month`
  String get selectMonth {
    return Intl.message(
      'Select Month',
      name: 'selectMonth',
      desc: '',
      args: [],
    );
  }

  /// `Date`
  String get date {
    return Intl.message('Date', name: 'date', desc: '', args: []);
  }

  /// `Report No.`
  String get reportNo {
    return Intl.message('Report No.', name: 'reportNo', desc: '', args: []);
  }

  /// `Report No: {reportNumber}`
  String reportNoNumber(String reportNumber) {
    return Intl.message(
      'Report No: $reportNumber',
      name: 'reportNoNumber',
      desc: '',
      args: [reportNumber],
    );
  }

  /// `Select date`
  String get selectDate {
    return Intl.message('Select date', name: 'selectDate', desc: '', args: []);
  }

  /// `Find what you're looking for`
  String get findWhatYouAreLookingFor {
    return Intl.message(
      'Find what you\'re looking for',
      name: 'findWhatYouAreLookingFor',
      desc: '',
      args: [],
    );
  }

  /// `Reports`
  String get reports {
    return Intl.message('Reports', name: 'reports', desc: '', args: []);
  }

  /// `Orders`
  String get orders {
    return Intl.message('Orders', name: 'orders', desc: '', args: []);
  }

  /// `Unverified`
  String get unverified {
    return Intl.message('Unverified', name: 'unverified', desc: '', args: []);
  }

  /// `Verified`
  String get verified {
    return Intl.message('Verified', name: 'verified', desc: '', args: []);
  }

  /// `Last Order : {date}`
  String lastOrder(String date) {
    return Intl.message(
      'Last Order : $date',
      name: 'lastOrder',
      desc: '',
      args: [date],
    );
  }

  /// `Mobile Number`
  String get mobileNumber {
    return Intl.message(
      'Mobile Number',
      name: 'mobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter your mobile number`
  String get enterYourMobileNumber {
    return Intl.message(
      'Enter your mobile number',
      name: 'enterYourMobileNumber',
      desc: '',
      args: [],
    );
  }

  /// `Log in Now`
  String get loginNow {
    return Intl.message('Log in Now', name: 'loginNow', desc: '', args: []);
  }

  /// `Your session has expired or you are not authorized. Please log in again.`
  String get unauthorizedError {
    return Intl.message(
      'Your session has expired or you are not authorized. Please log in again.',
      name: 'unauthorizedError',
      desc: '',
      args: [],
    );
  }

  /// `There is a problem with the server. Try again later.`
  String get thereIsProblemWithServerTryAgainLater {
    return Intl.message(
      'There is a problem with the server. Try again later.',
      name: 'thereIsProblemWithServerTryAgainLater',
      desc: '',
      args: [],
    );
  }

  /// `The server took too long to respond.`
  String get serverTookTooLongToRespond {
    return Intl.message(
      'The server took too long to respond.',
      name: 'serverTookTooLongToRespond',
      desc: '',
      args: [],
    );
  }

  /// `The SSL certificate is not trusted.`
  String get sslCertificateNotTrusted {
    return Intl.message(
      'The SSL certificate is not trusted.',
      name: 'sslCertificateNotTrusted',
      desc: '',
      args: [],
    );
  }

  /// `An unknown error occurred.`
  String get unknownErrorOccurred {
    return Intl.message(
      'An unknown error occurred.',
      name: 'unknownErrorOccurred',
      desc: '',
      args: [],
    );
  }

  /// `The client took too long to respond.`
  String get clientTookTooLong {
    return Intl.message(
      'The client took too long to respond.',
      name: 'clientTookTooLong',
      desc: '',
      args: [],
    );
  }

  /// `The server took too long to respond.`
  String get serverTookTooLong {
    return Intl.message(
      'The server took too long to respond.',
      name: 'serverTookTooLong',
      desc: '',
      args: [],
    );
  }

  /// `Connected to the internet`
  String get connectedToInternet {
    return Intl.message(
      'Connected to the internet',
      name: 'connectedToInternet',
      desc: '',
      args: [],
    );
  }

  /// `Enable Service`
  String get enableService {
    return Intl.message(
      'Enable Service',
      name: 'enableService',
      desc: '',
      args: [],
    );
  }

  /// `The location service on the device is disabled.`
  String get locationServiceDisabled {
    return Intl.message(
      'The location service on the device is disabled.',
      name: 'locationServiceDisabled',
      desc: '',
      args: [],
    );
  }

  /// `Allow Location Access`
  String get grantLocationAccess {
    return Intl.message(
      'Allow Location Access',
      name: 'grantLocationAccess',
      desc: '',
      args: [],
    );
  }

  /// `Please grant permission to access your device's location`
  String get requestLocationPermission {
    return Intl.message(
      'Please grant permission to access your device\'s location',
      name: 'requestLocationPermission',
      desc: '',
      args: [],
    );
  }

  /// `successfully`
  String get successfully {
    return Intl.message(
      'successfully',
      name: 'successfully',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get logOut {
    return Intl.message('Log out', name: 'logOut', desc: '', args: []);
  }

  /// `Done`
  String get done {
    return Intl.message('Done', name: 'done', desc: '', args: []);
  }

  /// `No internet connection`
  String get noInternetConnection {
    return Intl.message(
      'No internet connection',
      name: 'noInternetConnection',
      desc: '',
      args: [],
    );
  }

  /// `Needs synchronization`
  String get needsSynchronization {
    return Intl.message(
      'Needs synchronization',
      name: 'needsSynchronization',
      desc: '',
      args: [],
    );
  }

  /// `No Data`
  String get noData {
    return Intl.message('No Data', name: 'noData', desc: '', args: []);
  }

  /// `Unknown`
  String get unknown {
    return Intl.message('Unknown', name: 'unknown', desc: '', args: []);
  }

  /// `Page not found`
  String get pageNotFound {
    return Intl.message(
      'Page not found',
      name: 'pageNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Page '{pageName}' not found in routes`
  String pageNameNotFoundInRoutes(String pageName) {
    return Intl.message(
      'Page \'$pageName\' not found in routes',
      name: 'pageNameNotFoundInRoutes',
      desc: '',
      args: [pageName],
    );
  }

  /// `Back`
  String get back {
    return Intl.message('Back', name: 'back', desc: '', args: []);
  }

  /// `Show password`
  String get showPassword {
    return Intl.message(
      'Show password',
      name: 'showPassword',
      desc: '',
      args: [],
    );
  }

  /// `Hide password`
  String get hidePassword {
    return Intl.message(
      'Hide password',
      name: 'hidePassword',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get login {
    return Intl.message('Log in', name: 'login', desc: '', args: []);
  }

  /// `Enter your credentials to continue.`
  String get enterYourCredentialsToContinue {
    return Intl.message(
      'Enter your credentials to continue.',
      name: 'enterYourCredentialsToContinue',
      desc: '',
      args: [],
    );
  }

  /// `Email address`
  String get emailAddress {
    return Intl.message(
      'Email address',
      name: 'emailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Enter email address`
  String get enterEmailAddress {
    return Intl.message(
      'Enter email address',
      name: 'enterEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `fill this field`
  String get fillField {
    return Intl.message(
      'fill this field',
      name: 'fillField',
      desc: '',
      args: [],
    );
  }

  /// `Not same password`
  String get notSamePass {
    return Intl.message(
      'Not same password',
      name: 'notSamePass',
      desc: '',
      args: [],
    );
  }

  /// `Enter valid E-mail`
  String get enterValidEmail {
    return Intl.message(
      'Enter valid E-mail',
      name: 'enterValidEmail',
      desc: '',
      args: [],
    );
  }

  /// `Can't be less than {min}`
  String cantBeLessThan(String min) {
    return Intl.message(
      'Can\'t be less than $min',
      name: 'cantBeLessThan',
      desc: '',
      args: [min],
    );
  }

  /// `Can't be more than {max}`
  String cantBeMoreThan(String max) {
    return Intl.message(
      'Can\'t be more than $max',
      name: 'cantBeMoreThan',
      desc: '',
      args: [max],
    );
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Enter the password`
  String get enterThePassword {
    return Intl.message(
      'Enter the password',
      name: 'enterThePassword',
      desc: '',
      args: [],
    );
  }

  /// `Forget password ? `
  String get forgetPassword {
    return Intl.message(
      'Forget password ? ',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Recover`
  String get recover {
    return Intl.message('Recover', name: 'recover', desc: '', args: []);
  }

  /// `Sign up`
  String get signUp {
    return Intl.message('Sign up', name: 'signUp', desc: '', args: []);
  }

  /// `Don't have an account ? `
  String get doNotHaveAnAccount {
    return Intl.message(
      'Don\'t have an account ? ',
      name: 'doNotHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Remember me`
  String get rememberMe {
    return Intl.message('Remember me', name: 'rememberMe', desc: '', args: []);
  }

  /// `Create your own email`
  String get createYourOwnEmail {
    return Intl.message(
      'Create your own email',
      name: 'createYourOwnEmail',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message('Name', name: 'name', desc: '', args: []);
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message('Confirm', name: 'confirm', desc: '', args: []);
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Go back`
  String get goBack {
    return Intl.message('Go back', name: 'goBack', desc: '', args: []);
  }

  /// `Stay here`
  String get stayHere {
    return Intl.message('Stay here', name: 'stayHere', desc: '', args: []);
  }

  /// `Are you sure you want to return back`
  String get areYouSureYouWantToReturnBack {
    return Intl.message(
      'Are you sure you want to return back',
      name: 'areYouSureYouWantToReturnBack',
      desc: '',
      args: [],
    );
  }

  /// `If you return now, you will lose all data!`
  String get ifYouReturnNowYouWillLoseAllData {
    return Intl.message(
      'If you return now, you will lose all data!',
      name: 'ifYouReturnNowYouWillLoseAllData',
      desc: '',
      args: [],
    );
  }

  /// `The password provided is too weak.`
  String get passwordProvidedIsTooWeak {
    return Intl.message(
      'The password provided is too weak.',
      name: 'passwordProvidedIsTooWeak',
      desc: '',
      args: [],
    );
  }

  /// `Press again to exit`
  String get pressAgainToExit {
    return Intl.message(
      'Press again to exit',
      name: 'pressAgainToExit',
      desc: '',
      args: [],
    );
  }

  /// `The account already exists for that email.`
  String get accountAlreadyExistsForThatEmail {
    return Intl.message(
      'The account already exists for that email.',
      name: 'accountAlreadyExistsForThatEmail',
      desc: '',
      args: [],
    );
  }

  /// `No user found for that email.`
  String get noUserFoundForThatEmail {
    return Intl.message(
      'No user found for that email.',
      name: 'noUserFoundForThatEmail',
      desc: '',
      args: [],
    );
  }

  /// `Wrong password provided for that user.`
  String get wrongPasswordProvidedForThatUser {
    return Intl.message(
      'Wrong password provided for that user.',
      name: 'wrongPasswordProvidedForThatUser',
      desc: '',
      args: [],
    );
  }

  /// `The supplied auth credential is incorrect, malformed or has expired.`
  String get theSuppliedAuthCredentialIsIncorrect {
    return Intl.message(
      'The supplied auth credential is incorrect, malformed or has expired.',
      name: 'theSuppliedAuthCredentialIsIncorrect',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[Locale.fromSubtags(languageCode: 'en')];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
