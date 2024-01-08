import 'package:write/core/core.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const TextFieldWidget(
          hintText: name,
        ),
        verticalGap(screenHeight * .02),
        const TextFieldWidget(
          hintText: email,
        ),
        verticalGap(screenHeight * .02),
        const TextFieldWidget(
          hintText: password,
        ),
      ],
    );
  }
}
