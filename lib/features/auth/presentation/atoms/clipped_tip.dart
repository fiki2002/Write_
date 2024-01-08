import 'package:write/core/core.dart';

class ClippedTip extends StatelessWidget {
  const ClippedTip({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(sr(kfs8)),
      child: ClipPath(
        clipper: _TipClipper(),
        child: Container(
          height: h(kfsExtraLarge),
          width: w(kfs30),
          decoration: const BoxDecoration(
            color: kBg,
          ),
        ),
      ),
    );
  }
}


class _TipClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(size.width / 2, 0);
    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
