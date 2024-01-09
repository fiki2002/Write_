import 'package:write/core/core.dart';
import 'package:write/features/documents/presentation/components/empty_state_view.dart';

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
            const _SearchTextField(),
            vSpace(kfsMedium),
            const EmptyStateView(),
          ],
        ),
      ),
      useSingleScroll: true,
    );
  }
}

class _SearchTextField extends StatelessWidget {
  const _SearchTextField();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h(kfs56),
      child: TextFormField(
        textAlign: TextAlign.center,
        cursorColor: kSecondaryColor,
        cursorWidth: 1,
        decoration: InputDecoration(
          fillColor: kBg2,
          filled: true,
          contentPadding: EdgeInsets.zero,
          hintStyle: const TextStyle(color: kSecondaryColor),
          hintText: search,
          border: _border,
          enabledBorder: _border,
          focusedBorder: _border,
        ),
      ),
    );
  }

  OutlineInputBorder get _border {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(sr(kMinute)),
    );
  }
}
