import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:huskies_app/provider/user_provider/user_notifer.dart';

import '../../models/user_vm/user_model.dart';

/// global user API that start with default null but after Login in must there a UserModel with a Uid.
/// return with ref.watch(userProvider) the return User from FirebaseAuth but started with null.
/// with the ref.read(userProvier.notfier) can you update the User.
final userProvider = NotifierProvider<UserNotifier, UserModel>(() => UserNotifier());
