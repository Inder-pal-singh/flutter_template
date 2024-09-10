import 'package:flutter/material.dart';
import 'package:flutter_template/presentation/home/widgets/entry_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            EntryCard(),
            SizedBox(
              height: 20,
            ),
            EntryCard(),
          ],
        ),
      ),
    );
  }
}
