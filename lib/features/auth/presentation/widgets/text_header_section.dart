import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:write/core/core.dart';
import 'package:write/features/features.dart';

class TextHeaderSection extends StatelessWidget {
  const TextHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * .35,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          verticalGap(screenHeight * .12),
          const Hero(
            tag: 'write',
            child: WriteWidget(),
          ),
          verticalGap(screenHeight * .12),
          BlocBuilder<AuthBloc, AuthState>(
            builder: (context, authState) {
              final currentState = (authState as AuthStateInitial).state;
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextWidget(
                    signIn,
                    onTap: () => context.auth.add(
                      AuthToggle(currentState: AuthCurrentState.signIn),
                    ),
                    textColor: currentState == AuthCurrentState.signIn
                        ? kSecondaryColor
                        : kText2Color,
                  ),
                  TextWidget(
                    signUp,
                    onTap: () => context.auth.add(
                      AuthToggle(currentState: AuthCurrentState.signUp),
                    ),
                    textColor: currentState == AuthCurrentState.signUp
                        ? kSecondaryColor
                        : kText2Color,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
