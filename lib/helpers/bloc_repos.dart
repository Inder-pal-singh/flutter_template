import 'package:app_storage/app_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../features/authentication/app_authentication.dart';
import '../features/connectivity/src/data/connectivity_repository.dart';
import '../features/content/content.dart';
import '../features/locale/app_locale.dart';
import '../features/user/src/user_repository.dart';

final blocRepos = [
  RepositoryProvider<AppStorage>(create: (context) => AppStorage()),
  RepositoryProvider<ConnectivityRepository>(
    create: (context) => ConnectivityRepository(),
    lazy: false,
  ),
  RepositoryProvider<AppLocaleRepository>(
    create: (context) => AppLocaleRepository(),
    lazy: false,
  ),
  RepositoryProvider<AuthenticationRepository>(
    create: (context) => AuthenticationRepository(),
    lazy: false,
  ),
  RepositoryProvider<ContentRepository>(
    create: (context) => ContentRepository(),
    lazy: false,
  ),
  RepositoryProvider<UserRepository>(
    create: (context) => UserRepository(),
    lazy: false,
  ),
];
