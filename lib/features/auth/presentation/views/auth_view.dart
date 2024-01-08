import 'package:write/core/core.dart';
import 'package:write/features/features.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  static const String route = 'auth';

  @override
  Widget build(BuildContext context) {
    return const ScaffoldWidget(
      body: Column(
        children: [
          TextHeaderSection(),
          InputSection(),
        ],
      ),
      usePadding: false,
      useSingleScroll: true,
      navBarColor: kBg,
    );
  }
}
