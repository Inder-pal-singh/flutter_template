import 'package:app_assets/app_assets.dart';
import 'package:flutter/material.dart';

import '../../utils/responsive_utils.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SplashPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          children: [
            const Spacer(),
            Center(
              child: Image.asset(AppAssets.logoOutlined,
                  height: Sizer.of(context).width * 0.3),
            ),
            const CircularProgressIndicator.adaptive(),
            const SizedBox(height: 20),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
