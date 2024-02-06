import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/provider/static_provider.dart';

class ErrorNotifier extends Notifier<List<String>> {
  @override
  List<String> build() => <String>[];

  void catchError(String error) {
    final oldErrors = state;
    state = [...oldErrors, error];
    ref.read(statusProvider.notifier).onError();
    return;
  }
}
