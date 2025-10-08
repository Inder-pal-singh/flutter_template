import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  static const String routeName = '/home';
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('Home', style: Theme.of(context).textTheme.titleLarge),
        ],
      ),
    );
  }
}
