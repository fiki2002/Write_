import 'package:write/core/core.dart';
import 'package:write/features/features.dart';

class NavBarView extends StatelessWidget {
  NavBarView({super.key});
  static const String route = 'nav-bar';

  static void _onTap(int index) => _currentIndex.value = index;
  static final ValueNotifier<int> _currentIndex = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: _currentIndex,
      builder: (context, value, _) {
        return ScaffoldWidget(
          body: IndexedStack(
            index: value,
            children: _screens,
          ),
          bottomNavigationBar: Container(
            padding: EdgeInsets.only(top: h(kMinute)),
            height: screenHeight * .082,
            decoration: const BoxDecoration(
              color: kBg1,
              border: Border(top: BorderSide(color: kBorderColor1)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _NavBarTile(
                  imageUrl: documentIcon,
                  isSelected: value == 0,
                  onTap: () => _onTap(0),
                ),
                _NavBarTile(
                  imageUrl: bookmarkIcon,
                  isSelected: value == 1,
                  onTap: () => _onTap(1),
                ),
                _NavBarTile(
                  imageUrl: settingsIcon,
                  isSelected: value == 2,
                  onTap: () => _onTap(2),
                ),
              ],
            ),
          ),
          useSingleScroll: false,
          usePadding: false,
          navBarColor: kBg1,
        );
      },
    );
  }

  final List<Widget> _screens = [
    const DocumentsView(),
    const ReaderModeView(),
    const SettingsView(),
  ];
}

class _NavBarTile extends StatelessWidget {
  const _NavBarTile({
    required this.imageUrl,
    this.isSelected = false,
    required this.onTap,
  });
  final String imageUrl;
  final bool isSelected;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ImageWidget(
      imageTypes: ImageTypes.svg,
      imageUrl: imageUrl,
      useIconColor: true,
      color: isSelected ? kSecondaryColor : kIconColor,
      onTap: onTap,
    );
  }
}
