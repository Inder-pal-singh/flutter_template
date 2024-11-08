import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/login/login.dart';

import '../presentation/home/home_view.dart';

final Map<String, WidgetBuilder> coreRoutes = {
  LoginView.routeName: (context) => const LoginView(),
  HomeView.routeName: (context) => const HomeView(),
};
