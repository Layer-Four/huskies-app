import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/constants/app_theme.dart';
import 'package:huskies_app/constants/globals.dart';
import 'package:logger/logger.dart';

// * Provider provides inmutable obkectes and give a reference to it self.
// * Stateprovider contains mutable objects that are intended to change during runtime.
// * define a "Logger" object for Logging and give the acces to them

final authProvider =
    StreamProvider<User?>((ref) => FirebaseAuth.instance.authStateChanges().map((user) {
          if (user != null) {
            if (!user.emailVerified) {
              ref.read(statusProvider.notifier).state = AuthState.onRegistation;
              return user;
            }
            ref.read(statusProvider.notifier).state = AuthState.loggedIn;
            return user;
          }

          return null;
        }));
final themeProvider = Provider<AppTheme>((ref) => AppTheme());
final loggerProvider = Provider<Logger>((ref) => Logger());
final statusProvider = StateProvider<AuthState>((ref) => AuthState.unAuthificated);
final viewProvider = StateProvider((ref) => ViewPage.login);
// StreamProvider((ref) => ref.watch(appStateNotifierProvider).map((kind) => ''));
// final languageProvider = Provider<Translation>((ref)=> TranslationObjekt());
// final stateProvider = StreamProvider<AppState?>((ref){return  Stream.listen<AppState>(, (previous, next) {

// }); AppState():null});

/// this notifier handle the Authification callbacks,
/// and use the connetcion from Firebase, to change, register or something else
// class AuthNotifier extends StateNotifier<AuthState> {
//   AuthNotifier() : super(AuthState.unAuthificated);
//   void changeAuthStatus(AuthState kind) => state = kind;
// }
