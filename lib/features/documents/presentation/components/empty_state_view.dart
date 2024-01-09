import 'package:write/core/core.dart';
import 'package:write/features/features.dart';

class EmptyStateView extends StatelessWidget {
  const EmptyStateView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight,
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: w(kMinute),
          mainAxisSpacing: h(kMinute),
          childAspectRatio: 121 / 170,
        ),
        itemCount: 5,
        itemBuilder: (context, int i) {
          return _GridTile(
            isFirst: i == 0,
            onTap: i == 0 ? () => goTo(WriteView.route) : () {},
          );
        },
      ),
    );
  }
}

class _GridTile extends StatelessWidget {
  const _GridTile({
    this.isFirst = false,
    this.onTap,
  });
  final bool isFirst;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: screenHeight * 2,
        decoration: BoxDecoration(
          color: isFirst ? kBg3 : kBg4,
          borderRadius: BorderRadius.circular(
            sr(kMinute),
          ),
        ),
        child: switch (isFirst) {
          true => Center(
              child: ImageWidget(
                imageTypes: ImageTypes.svg,
                imageUrl: addIcon,
                height: h(kXtremeLarge),
                onTap: onTap,
              ),
            ),
          false => const SizedBox()
        },
      ),
    );
  }
}
