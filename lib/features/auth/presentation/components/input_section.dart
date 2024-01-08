import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:write/core/core.dart';
import 'package:write/features/features.dart';

class InputSection extends StatelessWidget {
  const InputSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * .65,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, authState) {
              final currentState = (authState as AuthStateInitial).state;

              return Container(
                height: screenHeight,
                width: double.infinity,
                margin: const EdgeInsets.only(top: 20),
                padding: EdgeInsets.symmetric(
                  horizontal: w(kfsMedium),
                  vertical: screenHeight * .06,
                ),
                decoration: BoxDecoration(
                  color: kBg,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(sr(20)),
                    topRight: Radius.circular(sr(20)),
                  ),
                ),
                child: switch (currentState) {
                  AuthCurrentState.signIn => const SignInInputSection(),
                  AuthCurrentState.signUp => const SignUpInputSection(),
                },
              );
            },
          ),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, authState) {
              final currentState = (authState as AuthStateInitial).state;
              return AnimatedPositioned(
                duration: duration300,
                top: screenHeight * .015,
                left: screenWidth * .22,
                child: Visibility(
                  visible:
                      currentState == AuthCurrentState.signIn ? true : false,
                  child: const ClippedTip(),
                ),
              );
            },
          ),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, authState) {
              final currentState = (authState as AuthStateInitial).state;
              return AnimatedPositioned(
                duration: duration300,
                top: screenHeight * .015,
                right: screenWidth * .22,
                child: Visibility(
                  visible:
                      currentState == AuthCurrentState.signUp ? true : false,
                  child: const ClippedTip(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
