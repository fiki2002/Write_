import 'package:write/core/core.dart';

class WriteWidget extends StatelessWidget {
  const WriteWidget({
    super.key,
    this.fontSize,
    this.color,
  });
  final double? fontSize;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return TextWidget(
      write,
      fontSize: sp(fontSize ?? kfs45),
      fontWeight: w800,
      textColor: color ?? kSecondaryColor,
      fontFamily: 'Typewriter',
    );
  }
}
