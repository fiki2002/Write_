import 'package:write/core/core.dart';

class AuthBaseContainer extends StatelessWidget {
  const AuthBaseContainer({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
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
      child: child,
    );
  }
}
