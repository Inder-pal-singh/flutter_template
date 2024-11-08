import 'dart:async';

import 'package:app_logger/app_logger.dart';
import 'package:app_storage/app_storage.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import 'models/user.model.dart';
import 'user_provider.dart';

class UserRepository {
  final UserApi _authApi = UserApi();
  late StreamController<User>? _userSubscription;
  UserRepository() {
    _userSubscription = StreamController<User>();
  }
  Stream<User?> get user async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield* _userSubscription!.stream;
  }

  Future<User?> getUser({User? user}) async {
    try {
      final res = await _authApi.getUser();
      _userSubscription!.add(User.fromJson(res!.data!));
      return User.fromJson(res.data!);
    } catch (e) {
      ConnectivityResult connectivityResult =
          (await Connectivity().checkConnectivity())[0];
      if (connectivityResult == ConnectivityResult.none && user != null) {
        _userSubscription!.add(User.fromJson(user.toJson()));
        logger.e('No internet connection');
        return user;
      }
      AppStorage().clear();
      logger.e('Error getting user: $e');
      rethrow;
    }
  }

  Future<User?> updateUser(User user) async {
    try {
      final res = await _authApi.updateUser(user);
      _userSubscription!.add(User.fromJson(res!.data!));
      return User.fromJson(res.data!);
    } catch (e) {
      logger.e('Error updating user: $e');
      return null;
    }
  }
}
