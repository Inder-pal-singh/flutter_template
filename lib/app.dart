import 'dart:io';

import 'package:app_logger/app_logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template/helpers/bloc_providers.dart';
import 'package:flutter_template/helpers/bloc_repos.dart';
import 'package:flutter_template/presentation/home/home_view.dart';

import 'features/authentication/app_authentication.dart';
import 'features/locale/app_locale.dart';
import 'features/user/user.dart';
import 'presentation/login/login.dart';
import 'presentation/splash/view.dart';
import 'utils/app_routes.dart';
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
      providers: blocRepos,
      child: MultiBlocProvider(
        providers: blocProviders,
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
