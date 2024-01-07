
import 'package:write/core/core.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({
    Key? key,
    this.color,
    this.backGroundColor,
    this.value,
    this.strokeWidth,
  }) : super(key: key);

  final Color? color;
  final Color? backGroundColor;
  final double? value;
  final double? strokeWidth;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator.adaptive(
        strokeWidth: strokeWidth ?? 2.0,
        backgroundColor: backGroundColor ?? kSecondaryColor,
        value: value,
      ),
    );
  }
}
