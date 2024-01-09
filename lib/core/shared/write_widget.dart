import 'package:write/core/core.dart';

class WriteWidget extends StatelessWidget {
  const WriteWidget({
    super.key,
    this.fontSize,
  });
  final double? fontSize;
  @override
  Widget build(BuildContext context) {
    return TextWidget(
      write,
      fontSize: sp(fontSize ?? kfs45),
      fontWeight: w800,
      fontFamily: 'Typewriter',
    );
  }
}
