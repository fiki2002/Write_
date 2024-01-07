import 'package:write/core/core.dart';

class AuthForm extends StatelessWidget {
  const AuthForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: w(kfsMedium),
        vertical: screenHeight * .06,
      ),
      child: Column(
        children: [
          const TextFieldWidget(
            hintText: email,
          ),
          verticalGap(screenHeight * .02),
          const TextFieldWidget(
            hintText: password,
          ),
          verticalGap(screenHeight * .07),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const _Tile(),
              TextWidget(
                or,
                fontSize: sp(kfsVeryTiny),
                textColor: kText1Color,
                fontWeight: w500,
              ),
              const _Tile(),
            ],
          ),
          verticalGap(screenHeight * .04),
          Row(
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
          ),
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
      ),
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: h(kfs3),
      width: screenWidth * .4,
      decoration: BoxDecoration(
        color: kBorderColor.withOpacity(.6),
        borderRadius: BorderRadius.circular(sr(kfs3)),
      ),
    );
  }
}


