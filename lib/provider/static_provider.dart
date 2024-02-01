import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/constants/app_theme.dart';
import 'package:huskies_app/constants/globals.dart';
import 'package:huskies_app/provider/auth_provider/auth_notifier.dart';
import 'package:huskies_app/provider/error_provider/error_notifier.dart';
import 'package:logger/logger.dart';

// * Provider provides inmutable objectes and give a reference to it self or all providers in the providerscope?.
// * Stateprovider contains mutable objects that are intended to change during runtime.
// * define a "Logger" object for Logging and give the acces to them

/// a globale static instance of a Apptheme object that is imutable.
final themeProvider = Provider<AppTheme>((ref) => AppTheme());
// ? use a globale instance for logger? that use this provider its equal static singelton,
//  TODO: implement a customiced Logger?
final loggerProvider = Provider<Logger>((ref) => Logger());
// TODO: implement a language object
// final languageProvider = Provider<Language>((ref)=> LanguageObjekt());

/// provider to pass a error and react on it.
final errorProvider = NotifierProvider<ErrorNotifier, List<String>>(() => ErrorNotifier());

/// listen on the userprovider that is, possible to react to Firebase and the updates of the user.
final statusProvider = NotifierProvider<AuthNotifier, AuthState>(() => AuthNotifier());

/// provide the current mainview and allow to navigate on itself to children views.
/// the Stateprovider was used here because the ref object must be mutable,
///  to change the view, the used Type is a enum so the views are scaleable and all values are known.
final viewProvider = StateProvider<ViewPage>((ref) => ViewPage.login);

// * Future Provider are powerfull on
// * re-fetch and refresh data (useful for pull-to-refresh operations)
// * ref. listen are usefull fore snackbar notifcation, when user are incorrect or some state changes
