import 'package:write/core/core.dart';

class EmptyStateView extends StatelessWidget {
  const EmptyStateView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SharedGridWidget(
      isEmpty: true,
      itemCount: 5,
    );
  }
}
