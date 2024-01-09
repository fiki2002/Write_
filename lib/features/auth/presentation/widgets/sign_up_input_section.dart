import 'package:write/core/core.dart';
import 'package:write/features/features.dart';

class SignUpInputSection extends StatelessWidget {
  const SignUpInputSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SignUpForm(),
        verticalGap(screenHeight * .03),
        const OrWidget(),
        verticalGap(screenHeight * .04),
        const SocialButtons(),
        verticalGap(screenHeight * .03),
        Button(
          onTap: () => clearRoad(NavBarView.route),
          text: signUp,
        ),
      ],
    );
  }
}
