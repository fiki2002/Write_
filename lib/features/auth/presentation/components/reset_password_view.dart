import 'package:write/core/core.dart';
import 'package:write/features/auth/auth.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});
  static const String route = 'reset-password';
  @override
  Widget build(BuildContext context) {
    return const ScaffoldWidget(
      body: Column(
        children: [
          ResetPasswordHeader(),
          ResetPasswordInputSection(),
        ],
      ),
      useSingleScroll: true,
      usePadding: false,
      navBarColor: kBg,
    );
  }
}

class ResetPasswordHeader extends StatelessWidget {
  const ResetPasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * .7,
      child: Column(
        children: [
          verticalGap(screenHeight * .2),
          const WriteWidget(),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextWidget(
                signIn,
                textColor: kText2Color,
                onTap: () => goTo(AuthView.route),
              ),
              const TextWidget(
                recoverPassword,
              ),
              TextWidget(
                signUp,
                textColor: kText2Color,
                onTap: () {
                  context.auth.add(
                    AuthToggle(currentState: AuthCurrentState.signUp),
                  );
                  goTo(AuthView.route);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ResetPasswordInputSection extends StatelessWidget {
  const ResetPasswordInputSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * .35,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const AuthBaseContainer(
            child: Column(),
          ),
          AnimatedPositioned(
            duration: duration300,
            top: screenHeight * .015,
            left: screenWidth / 2.25,
            child: const ClippedTip(),
          )
        ],
      ),
    );
  }
}
