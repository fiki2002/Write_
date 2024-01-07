import 'package:write/core/core.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    this.hintText,
    this.label,
    this.focusNode,
    this.height,
    this.onChanged,
  });

  final String? hintText;
  final String? label;
  final FocusNode? focusNode;
  final double? height;
  final void Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h(height ?? kfs48),
      child: TextFormField(
        focusNode: focusNode,
        cursorColor: kPrimaryColor,
        onChanged: onChanged,
        decoration: InputDecoration(
          fillColor: kSecondaryColor,
          filled: true,
          contentPadding: EdgeInsets.symmetric(horizontal: w(kMinute)),
          hintText: hintText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintStyle: TextStyle(
            color: kHintText,
            fontSize: sp(kfsTiny),
            fontWeight: w400,
            fontFamily: 'Helvetica',
          ),
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
