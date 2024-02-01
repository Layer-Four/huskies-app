import 'package:firebase_storage/firebase_storage.dart';

String getMessageFromErrorCodeEN(FirebaseException e) {
  switch (e.code) {
    case "ERROR_EMAIL_ALREADY_IN_USE":
    case "account-exists-with-different-credential":
    case "email-already-in-use":
      return "Email already in use";

    case "ERROR_WRONG_PASSWORD":
    case "wrong-password":
      return "Wrong Email or password";

    case "ERROR_USER_NOT_FOUND":
    case "user-not-found":
      return "User not found";

    case "ERROR_USER_DISABLED":
    case "user-disabled":
      return "User disabled";

    case "ERROR_TOO_MANY_REQUESTS":
    case "operation-not-allowed":
      return "Too many requests";

    case "ERROR_OPERATION_NOT_ALLOWED":
      return "Operation not allowed";

    case "ERROR_INVALID_EMAIL":
    case "invalid-email":
      return "Invalid email";

    default:
      return "Error, please try again";
  }
}

String getMessageFromErrorCodeDE(FirebaseException e) {
  switch (e.code) {
    case "ERROR_EMAIL_ALREADY_IN_USE":
    case "account-exists-with-different-credential":
    case "email-already-in-use":
      return "E-mail wurde bereits registriert. Bitte Einloggen oder neue E-mail registrieren";

    case "ERROR_WRONG_PASSWORD":
    case "wrong-password":
      return "Email oder ";

    case "ERROR_USER_NOT_FOUND":
    case "user-not-found":
      return "Es wurde kein Benutzer mit dieser E-mail gefunden";

    case "ERROR_USER_DISABLED":
    case "user-disabled":
      return "Nutzer deaktiviert";

    case "ERROR_TOO_MANY_REQUESTS":
    case "operation-not-allowed":
      return "Zu viele Login anfragen für diesen Account";

    case "ERROR_OPERATION_NOT_ALLOWED":
      return "Server error, bitte versuche es später nochmal";

    case "ERROR_INVALID_EMAIL":
    case "invalid-email":
      return "E-mail Adresse ist ungültig";

    case "ERROR_INVALID_CREDENTIAL":
    case "invalid-credential":
      return 'Ungültige eingabe';
    default:
      return "Fehlgeschlagen, bitte versuche es nochmal";
  }
}
