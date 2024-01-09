import 'package:write/core/core.dart';
import 'package:write/features/auth/auth.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldWidget(
      appBar: AppBar(
        backgroundColor: kBg1,
        title: const TextWidget(
          settings,
          fontWeight: w500,
          fontSize: kfsExtraLarge,
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: w(kfsMedium),
              top: h(kfsMedium),
            ),
            child: const TextWidget(
              writing,
              textColor: kText3Color,
              fontSize: kfsExtraLarge,
            ),
          ),
          vSpace(kMinute),
          ValueListenableBuilder(
            valueListenable: _shouldShowWordCount,
            builder: (context, val, _) {
              return _ListTile(
                text: showWordCount,
                onTap: _onShowWordCountTapped,
                isSelected: val,
              );
            },
          ),
          verticalGap(screenHeight * .03),
          Padding(
            padding: EdgeInsets.only(
              left: w(kfsMedium),
              top: h(kfsMedium),
            ),
            child: const TextWidget(
              other,
              textColor: kText3Color,
              fontSize: kfsExtraLarge,
            ),
          ),
          vSpace(kMinute),
          _ListTile(
            text: logOut,
            onTap: () => clearRoad(AuthView.route),
            hasNoCheck: false,
          ),
          verticalGap(screenHeight * .2),
          const Center(
            child: WriteWidget(
              color: kText7Color,
            ),
          )
        ],
      ),
      usePadding: false,
      useSingleScroll: true,
      statusBarColor: kBg1,
    );
  }

  void _onShowWordCountTapped() =>
      _shouldShowWordCount.value = !_shouldShowWordCount.value;

  static final ValueNotifier<bool> _shouldShowWordCount = ValueNotifier(false);
}

class _ListTile extends StatelessWidget {
  const _ListTile({
    required this.text,
    required this.onTap,
    this.isSelected = false,
    this.hasNoCheck = true,
  });

  final String text;
  final VoidCallback onTap;
  final bool isSelected;
  final bool hasNoCheck;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: kfsMedium,
          vertical: kMinute,
        ),
        decoration: const BoxDecoration(
          color: kText7Color,
          border: Border(
            bottom: BorderSide(color: kText1Color, width: .5),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextWidget(
              text,
              fontSize: kfsExtraLarge,
            ),
            switch (hasNoCheck) {
              true => ImageWidget(
                  imageTypes: ImageTypes.svg,
                  imageUrl: isSelected ? checkBoxFilled : checkBox,
                  onTap: onTap,
                ),
              false => ImageWidget(
                  imageTypes: ImageTypes.svg,
                  imageUrl: arrowRight,
                  useIconColor: true,
                  color: kSecondaryColor,
                  onTap: onTap,
                ),
            }
          ],
        ),
      ),
    );
  }
}
