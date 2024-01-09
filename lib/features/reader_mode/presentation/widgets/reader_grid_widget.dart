import 'package:write/core/core.dart';

class ReaderGridWidget extends StatelessWidget {
  const ReaderGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const SharedGridWidget(
      isReader: true,
      itemCount: 0,
    );
  }
}
