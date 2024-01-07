import 'package:write/core/core.dart';
import 'package:write/features/features.dart';

class SignInInputSection extends StatelessWidget {
  const SignInInputSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextFieldWidget(
          hintText: email,
        ),
        verticalGap(screenHeight * .02),
        const TextFieldWidget(
          hintText: password,
        ),
        verticalGap(screenHeight * .07),
        const OrWidget(),
        verticalGap(screenHeight * .04),
        const SocialButtons(),
        verticalGap(screenHeight * .03),
        Button(
          onTap: () {},
          text: signIn,
        ),
        verticalGap(screenHeight * .02),
        const TextWidget(
          forgotPassword,
          textColor: kPrimaryColor,
        ),
      ],
    );
  }
}
