import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/features/user/src/user_repository.dart';

import '../features/authentication/app_authentication.dart';
import '../features/connectivity/src/bloc/connectivity_bloc.dart';
import '../features/connectivity/src/data/connectivity_repository.dart';
import '../features/content/content.dart';
import '../features/locale/app_locale.dart';
import '../features/notification/notification.dart';
import '../features/user/src/bloc/user_bloc.dart';
import '../presentation/login/bloc/login_bloc.dart';

final blocProviders = [
  BlocProvider<AuthenticationBloc>(
    create: (BuildContext context) => AuthenticationBloc(
      authenticationRepository: RepositoryProvider.of<AuthenticationRepository>(
        context,
      ),
    ),
  ),
  BlocProvider<AppLocaleBloc>(
    create: (context) =>
        AppLocaleBloc(appLocaleRepository: context.read<AppLocaleRepository>()),
    lazy: false,
  ),
  BlocProvider<ConnectivityBloc>(
    create: (context) => ConnectivityBloc(
      connectivityRepository: context.read<ConnectivityRepository>(),
    ),
    lazy: false,
  ),
  BlocProvider<LoginBloc>(
    create: (BuildContext context) => LoginBloc(
      authenticationRepository: RepositoryProvider.of<AuthenticationRepository>(
        context,
      ),
    ),
  ),
  BlocProvider<NotificationBloc>(
    create: (context) => NotificationBloc(),
    lazy: false,
  ),
  BlocProvider<ContentBloc>(
    create: (context) => ContentBloc(
      repositoryProvider: RepositoryProvider.of<ContentRepository>(context),
    ),
    lazy: false,
  ),
  BlocProvider<UserBloc>(
    create: (context) => UserBloc(
      userRepository: RepositoryProvider.of<UserRepository>(context),
    ),
    lazy: false,
  ),
];
