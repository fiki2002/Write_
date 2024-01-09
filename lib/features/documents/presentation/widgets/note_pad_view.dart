import 'package:write/core/core.dart';

class NotePadView extends StatelessWidget {
  const NotePadView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight,
      decoration: BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.circular(sr(kfsMedium)),
      ),
      child: TextFormField(
        maxLines: null,
        cursorColor: kPrimaryColor,
        style: const TextStyle(
          fontFamily: 'Helvetica',
        ),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(
            horizontal: w(kfsMedium),
            vertical: h(kGlobalPadding),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
