import 'dart:async';

import 'package:write/core/core.dart';
import 'package:write/features/features.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  static const String route = 'splash';

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    _timerForSplashScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0, end: 1),
      duration: duration,
      builder: (context, double val, Widget? child) {
        return ScaffoldWidget(
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Opacity(
                  opacity: val,
                  child: const WriteWidget(),
                ),
              ),
            ],
          ),
          useSingleScroll: false,
        );
      },
    );
  }

  void _timerForSplashScreen() {
    Timer(
      const Duration(seconds: 6),
      () {
        clearRoad(AuthView.route);
      },
    );
  }
}
