import 'package:write/core/core.dart';
import 'package:write/features/features.dart';

class WriteView extends StatelessWidget {
  const WriteView({super.key});

  static const String route = 'write';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScaffoldWidget(
            body: Column(
              children: [
                const _Header(),
                vSpace(kGlobalPadding),
                const SingleChildScrollView(child: NotePadView()),
              ],
            ),
            useSingleScroll: true,
            navBarColor: kBg5,
          ),
          AnimatedPositioned(
            duration: duration,
            bottom: 0,
            child: Container(
              width: screenWidth,
              height: screenHeight * .06,
              decoration: const BoxDecoration(
                color: kBg5,
                border: Border(
                  bottom: BorderSide(color: kBorderColor2, width: 2),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextEditorItems(imageUrl: boldIcon),
                  TextEditorItems(imageUrl: italicIcon),
                  TextEditorItems(imageUrl: underlinedIcon),
                  TextEditorItems(imageUrl: colorText),
                  TextEditorItems(imageUrl: alignLeft),
                  TextEditorItems(imageUrl: alignCenter),
                  TextEditorItems(imageUrl: alignRight),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: h(kGlobalPadding)),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWidget(
            save,
            textColor: kGreenShade,
            fontSize: kfsExtraLarge,
            fontWeight: w500,
          ),
          WriteWidget(
            fontSize: kfs30,
          ),
          TextWidget(
            share,
            textColor: kText3Color,
            fontSize: kfsExtraLarge,
            fontWeight: w500,
          ),
        ],
      ),
    );
  }
}

class TextEditorItems extends StatelessWidget {
  const TextEditorItems({super.key, required this.imageUrl});
  final String imageUrl;
  @override
  Widget build(BuildContext context) {
    return ImageWidget(
      imageTypes: ImageTypes.svg,
      imageUrl: imageUrl,
    );
  }
}
