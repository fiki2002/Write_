import 'package:write/core/core.dart';

class PreviewView extends StatelessWidget {
  const PreviewView({super.key});

  static const String route = 'preview';

  @override
  Widget build(BuildContext context) {
    return const ScaffoldWidget(
      bg: kSecondaryColor,
      body: Column(
        children: [
          _PreviewHeader(),
        ],
      ),
      useSingleScroll: true,
    );
  }
}

class _PreviewHeader extends StatelessWidget {
  const _PreviewHeader();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ImageWidget(
          imageTypes: ImageTypes.svg,
          imageUrl: arrowLeftIcon,
          useIconColor: true,
          onTap: goBack,
          color: kText3Color,
        ),
        WriteWidget(
          color: kText6Color,
          fontSize: kfs30,
        ),
        TextWidget(
          share,
          textColor: kText3Color,
          fontSize: kfsExtraLarge,
          fontWeight: w500,
        ),
      ],
    );
  }
}
