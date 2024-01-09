import 'package:write/core/core.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

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
