import 'package:lottie/lottie.dart';
import 'package:write/core/core.dart';

class EmptyReadMode extends StatelessWidget {
  const EmptyReadMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(child: Lottie.asset(emptyLottie)),
        const TextWidget(
          thereIsNothingToRead,
          textAlign: TextAlign.center,
          fontSize: kfsMedium,
          fontWeight: w600,
        )
      ],
    );
  }
}
