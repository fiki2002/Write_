import 'package:write/core/core.dart';

class WriteWidget extends StatelessWidget {
  const WriteWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextWidget(
      write,
      fontSize: sp(kfs45),
      fontWeight: w800,
      fontFamily: 'Typewriter',
    );
  }
}
