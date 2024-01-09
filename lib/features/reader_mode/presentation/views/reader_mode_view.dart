import 'package:write/core/core.dart';
import 'package:write/features/features.dart';

class ReaderModeView extends StatelessWidget {
  const ReaderModeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      body: Padding(
        padding: EdgeInsets.only(top: h(kfs30)),
        child: Column(
          children: [
            const Center(
              child: WriteWidget(
                fontSize: kfs30,
              ),
            ),
            vSpace(kfsMedium),
            const SearchTextField(),
            vSpace(kfsMedium),
            const ReaderGridWidget(),
          ],
        ),
      ),
      useSingleScroll: true,
    );
  }
}
