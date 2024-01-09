import 'package:write/core/core.dart';
import 'package:write/features/features.dart';

class SharedGridWidget extends StatelessWidget {
  const SharedGridWidget({
    super.key,
    this.isEmpty = false,
    this.isReader = false,
    required this.itemCount,
  });

  final bool isEmpty;
  final bool isReader;
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return itemCount == 0
        ? const EmptyReadMode()
        : SizedBox(
            height: screenHeight,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: w(kMinute),
                mainAxisSpacing: h(kMinute),
                childAspectRatio: 121 / 170,
              ),
              itemCount: itemCount,
              itemBuilder: (context, int i) {
                return _GridTile(
                  isFirst: i == 0,
                  isReader: isReader,
                  onTap: switch (isReader) {
                    true => () => goTo(PreviewView.route),
                    false => i == 0
                        ? () => goTo(WriteView.route)
                        : (!isEmpty)
                            ? () => goTo(PreviewView.route)
                            : () {},
                  },
                  isEmpty: isEmpty,
                  child: const _ContentWidget(
                    date: '02 April, 2019',
                    title: 'Song for the Old ones',
                    numberOfPages: '4 Pages',
                  ),
                );
              },
            ),
          );
  }
}

class _GridTile extends StatelessWidget {
  const _GridTile({
    Key? key,
    this.isFirst = false,
    this.onTap,
    required this.child,
    this.isEmpty = false,
    this.isReader = false,
  }) : super(key: key);

  final bool isFirst;
  final VoidCallback? onTap;
  final Widget child;
  final bool isEmpty;
  final bool isReader;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: _determineContainerColor(),
          borderRadius: BorderRadius.circular(
            sr(kMinute),
          ),
        ),
        child: switch (isReader) {
          true => child,
          false => switch (isFirst) {
              true => Center(
                  child: ImageWidget(
                    imageTypes: ImageTypes.svg,
                    imageUrl: addIcon,
                    height: h(kXtremeLarge),
                    onTap: onTap,
                  ),
                ),
              false => isEmpty ? const SizedBox.shrink() : child,
            },
        },
      ),
    );
  }

  Color _determineContainerColor() {
    if (isReader) {
      return kSecondaryColor;
    } else if (!isFirst && !isEmpty) {
      return kSecondaryColor;
    } else if (isFirst) {
      return kBg3;
    } else {
      return kBg4;
    }
  }
}

class _ContentWidget extends StatelessWidget {
  const _ContentWidget({
    required this.date,
    required this.title,
    required this.numberOfPages,
  });

  final String date;
  final String title;
  final String numberOfPages;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(kMinute),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextWidget(
            date,
            textColor: kText5Color,
            fontSize: kfsMedium,
          ),
          TextWidget(
            title,
            fontSize: kfsSuperLarge,
            fontWeight: w500,
            textAlign: TextAlign.center,
            textColor: kPrimaryColor,
          ),
          TextWidget(
            numberOfPages,
            textColor: kText5Color,
            fontSize: kfsMedium,
          ),
        ],
      ),
    );
  }
}
