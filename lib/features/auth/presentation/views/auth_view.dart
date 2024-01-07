import 'package:write/core/core.dart';
import 'package:write/features/features.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  static const String route = 'auth';

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      body: Column(
        children: [
          SizedBox(
            height: screenHeight * .4,
            child: const Center(
              child: WriteWidget(),
            ),
          ),
          AnimatedContainer(
            duration: duration,
            height: screenHeight * .6,
            width: double.infinity,
            decoration: BoxDecoration(
              color: kBg,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(sr(20)),
                topRight: Radius.circular(sr(20)),
              ),
            ),
            child: const AuthForm(),
          ),
        ],
      ),
      usePadding: false,
      useSingleScroll: true,
      navBarColor: kBg,
    );
  }
}
