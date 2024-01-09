import 'package:write/core/core.dart';
import 'package:write/features/features.dart';

class DocumentsView extends StatelessWidget {
  const DocumentsView({super.key});

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
            const EmptyStateView(),
          ],
        ),
      ),
      useSingleScroll: true,
    );
  }
}

