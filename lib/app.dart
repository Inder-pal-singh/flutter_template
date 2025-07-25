import 'dart:io';

import 'package:app_logger/app_logger.dart';
import 'package:app_storage/app_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/presentation/home/home_view.dart';

import 'features/authentication/app_authentication.dart';
import 'features/connectivity/src/bloc/connectivity_bloc.dart';
import 'features/connectivity/src/data/connectivity_repository.dart';
import 'features/content/content.dart';
import 'features/locale/app_locale.dart';
import 'features/notification/notification.dart';
import 'features/user/user.dart';
import 'helpers/app_routes.dart';
import 'presentation/login/login.dart';
import 'presentation/splash/view.dart';
import 'utils/theme_config.dart';

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
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
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthenticationBloc>(
            create: (BuildContext context) => AuthenticationBloc(
              authenticationRepository:
                  RepositoryProvider.of<AuthenticationRepository>(context),
            ),
          ),
          BlocProvider<AppLocaleBloc>(
            create: (context) => AppLocaleBloc(
              appLocaleRepository: context.read<AppLocaleRepository>(),
            ),
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
              authenticationRepository:
                  RepositoryProvider.of<AuthenticationRepository>(context),
            ),
          ),
          BlocProvider<NotificationBloc>(
            create: (context) => NotificationBloc(),
            lazy: false,
          ),
          BlocProvider<ContentBloc>(
            create: (context) => ContentBloc(
              repositoryProvider: RepositoryProvider.of<ContentRepository>(
                context,
              ),
            ),
            lazy: false,
          ),
        ],
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> with WidgetsBindingObserver {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // useInheritedMediaQuery: true,
      navigatorKey: _navigatorKey,
      theme: AppTheme.of(context).appTheme,
      localizationsDelegates: [
        AppLocale.appLocaleDelegate,
        AppLocale.materialDelegate,
        AppLocale.widgetsDelegate,
        AppLocale.cupertinoDelegate,
      ],
      supportedLocales: AppLocale.supportedLanguages.map((e) => e.locale),
      locale: View.of(context).platformDispatcher.locale,
      builder: (context, child) {
        final mq = MediaQuery.of(context);
        final scale = mq.textScaler.clamp(
          minScaleFactor: 0.9, // Minimum scale factor allowed.
          maxScaleFactor: Platform.isAndroid
              ? 0.93
              : 1.0, // Maximum scale factor allowed.
        );

        return MediaQuery(
          data: mq.copyWith(textScaler: scale),
          child: MultiBlocListener(
            listeners: [
              BlocListener<AuthenticationBloc, AuthenticationState>(
                listenWhen: (previous, current) =>
                    previous.status != current.status,
                listener: (context, state) {
                  logger.i("Authentication state: ${state.status}");
                  if (state.status == AuthenticationStatus.authenticated) {
                    _navigator.pushNamedAndRemoveUntil<void>(
                      HomeView.routeName,
                      (route) => false,
                    );
                    context.read<UserBloc>().add(const UserFetchEvent());
                  } else if (state.status ==
                      AuthenticationStatus.unauthenticated) {
                    _navigator.pushNamedAndRemoveUntil<void>(
                      LoginView.routeName,
                      (route) => false,
                    );
                  }
                },
              ),
            ],
            child: child!,
          ),
        );
      },
      debugShowCheckedModeBanner: false,
      routes: coreRoutes,
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }
}
