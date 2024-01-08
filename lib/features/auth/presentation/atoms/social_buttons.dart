import 'package:write/core/core.dart';

class SocialButtons extends StatelessWidget {
  const SocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: SecondaryButtons(
            iconUrl: twitterIcon,
            title: continueWithTwitter,
          ),
        ),
        hSpace(kMinute),
        const Expanded(
          child: SecondaryButtons(
            iconUrl: facebookIcon,
            title: continueWithFacebook,
          ),
        ),
      ],
    );
  }
}
