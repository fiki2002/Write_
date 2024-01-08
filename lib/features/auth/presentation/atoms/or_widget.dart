import 'package:write/core/core.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const _Tile(),
        TextWidget(
          or,
          fontSize: sp(kfsVeryTiny),
          textColor: kText1Color,
          fontWeight: w500,
        ),
        const _Tile(),
      ],
    );
  }
}

class _Tile extends StatelessWidget {
  const _Tile();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: h(2),
      width: screenWidth * .4,
      decoration: BoxDecoration(
        color: kBorderColor.withOpacity(.6),
        borderRadius: BorderRadius.circular(sr(kfs3)),
      ),
    );
  }
}
