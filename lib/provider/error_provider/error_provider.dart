import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/provider/error_provider/error_notifier.dart';

/// provider to pass a error and react on it.
final errorProvider = NotifierProvider<ErrorNotifier, List<String>>(() => ErrorNotifier());
