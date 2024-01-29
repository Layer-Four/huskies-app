// ignore_for_file: unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/constants/app_theme.dart';
import 'package:huskies_app/constants/globals.dart';
import 'package:huskies_app/provider/notifier.dart';
import 'package:huskies_app/provider/season_provider/authstate_provider.dart';
import 'package:logger/logger.dart';

// * Provider provides inmutable objectes and give a reference to it self or all providers in the providerscope?.
// * Stateprovider contains mutable objects that are intended to change during runtime.
// * define a "Logger" object for Logging and give the acces to them

/// global instance for the FirebaseAuth API.
final fireAuthInstance = Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

/// a globale static instance of a Apptheme object that is imutable.
final themeProvider = Provider<AppTheme>((ref) => AppTheme());
// ? use a globale instance for logger? that use this provider its equal static singelton,
//  TODO: implement a customiced Logger?
final loggerProvider = Provider<Logger>((ref) => Logger());

/// listen on the userprovider that is, possible to react to Firebase and the updates of the user.
final statusProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) => AuthNotifier());

/// provide the current mainview and allow to navigate on itself to children views.
/// the Stateprovider was used here because the ref object must be mutable,
///  to change the view, the used Type is a enum so the views are scaleable and all values are known.
final viewProvider = StateProvider((ref) => ViewPage.login);
// * this Provider just listen to the other provider and
// * just update in case the references updated.
final providerProvider = StreamProvider<void>(
  (ref) async* {
    final theme = ref.watch(themeProvider);
    final logger = ref.watch(loggerProvider);
    final user = ref.watch(authStateProvider);
    final stateKind = ref.watch(statusProvider);
    final view = ref.watch(viewProvider);
  },
);

class ProviderViewer extends StateNotifier<String> {
  ProviderViewer([super._state = '']);
}
// StreamProvider((ref) => ref.watch(appStateNotifierProvider).map((kind) => ''));
// final languageProvider = Provider<Translation>((ref)=> TranslationObjekt());
// final stateProvider = StreamProvider<AppState?>((ref){return  Stream.listen<AppState>(, (previous, next) {

// }); AppState():null});


// * Future Provider are powerfull on
// * re-fetch and refresh data (useful for pull-to-refresh operations)
// * ref. listen are usefull fore snackbar notifcation, when user are incorrect or some state changes
