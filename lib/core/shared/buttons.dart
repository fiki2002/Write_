import 'package:write/core/core.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    this.text,
    required this.onTap,
    this.color,
    this.textColor,
    this.textSize = kfsTiny,
    this.height,
    this.width,
    this.useHeightOrWidth = true,
    this.textFontWeight = w400,
    this.circular = false,
    this.active = true,
    this.child,
  })  : busy = false,
        iconData = null,
        borderColor = null,
        iconSize = null,
        iconColor = null;

  const Button.withBorderLine({
    super.key,
    this.text,
    this.onTap,
    this.color = Colors.transparent,
    this.borderColor = kPrimaryColor,
    this.textColor = kPrimaryColor,
    this.textSize = kfsTiny,
    this.height,
    this.width,
    this.useHeightOrWidth = true,
    this.textFontWeight = w400,
    this.circular = true,
    this.active = true,
    this.child,
  })  : busy = false,
        iconData = null,
        iconSize = null,
        iconColor = null;

  const Button.loading({
    super.key,
    this.onTap,
    this.color,
    this.height,
    this.useHeightOrWidth = true,
    this.width,
  })  : busy = true,
        iconData = null,
        text = null,
        textColor = null,
        textSize = kfsTiny,
        textFontWeight = null,
        iconSize = null,
        iconColor = null,
        borderColor = null,
        child = null,
        active = true,
        circular = false;

  const Button.smallSized({
    super.key,
    this.text,
    required this.onTap,
    this.color,
    this.textColor,
    this.useHeightOrWidth = true,
    this.textSize = kfsTiny,
    this.height,
    this.width,
    this.textFontWeight = w400,
    this.circular = true,
    this.active = true,
    this.child,
  })  : busy = false,
        iconData = null,
        iconSize = null,
        borderColor = null,
        iconColor = null;

  const Button.textOnly({
    super.key,
    required this.text,
    required this.onTap,
    this.textColor = kPrimaryColor,
    this.textSize = kfsTiny,
    this.textFontWeight = w400,
    this.useHeightOrWidth = false,
  })  : active = false,
        borderColor = null,
        busy = false,
        circular = false,
        color = null,
        height = null,
        child = null,
        iconColor = null,
        iconData = null,
        iconSize = null,
        width = null;

  const Button.icon({
    super.key,
    required this.iconData,
    required this.height,
    required this.width,
    required this.onTap,
    this.useHeightOrWidth = true,
    this.color,
    this.iconColor,
    this.iconSize,
    this.circular = true,
    this.active = true,
  })  : busy = false,
        text = null,
        borderColor = null,
        textColor = null,
        textSize = kfsTiny,
        child = null,
        textFontWeight = null;

  final String? text;
  final IconData? iconData;
  final void Function()? onTap;
  final bool busy;
  final bool active;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final double? textSize;
  final double? height;
  final double? width;
  final FontWeight? textFontWeight;
  final Color? iconColor;
  final double? iconSize;
  final bool circular;
  final bool? useHeightOrWidth;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    double defaultHeight = h(kfs56);

    return SizedBox(
      height: useHeightOrWidth == false ? null : height ?? defaultHeight,
      width: width,
      child: TextButton(
        onPressed: onTap,
        style: getButtonStyle(),
        child: child ?? getButtonChild(),
      ),
    );
  }

  ButtonStyle getButtonStyle() {
    MaterialStateProperty<RoundedRectangleBorder> shape;

    if (circular) {
      shape = MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(sr(kfs100)),
          side: BorderSide(color: borderColor ?? Colors.transparent),
        ),
      );
    } else {
      shape = MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(sr(kSize5)),
          side: BorderSide(color: borderColor ?? Colors.transparent),
        ),
      );
    }

    MaterialStateProperty<Color> backgroundColor;
    if (busy) {
      backgroundColor = MaterialStateProperty.all(kPrimaryColor);
    } else if (active == false) {
      backgroundColor = MaterialStateProperty.all(kSecondaryColor);
    } else {
      backgroundColor = MaterialStateProperty.all(color ?? kPrimaryColor);
    }

    return ButtonStyle(
      shape: shape,
      overlayColor:
          MaterialStateColor.resolveWith((states) => Colors.transparent),
      backgroundColor: backgroundColor,
    );
  }

  Widget getButtonChild() {
    if (text == null) {
      if (busy) {
        return SizedBox(
          height: h(21),
          width: w(21),
          child: const LoadingWidget(
            color: kSecondaryColor,
            backGroundColor: kPrimaryColor,
          ),
        );
      } else {
        return Icon(
          iconData,
          color: iconColor ?? kSecondaryColor,
          size: iconSize ?? 20.0,
        );
      }
    } else {
      return Center(
        child: TextWidget(
          text ?? 'no text',
          onTap: onTap,
          textColor: textColor ?? kSecondaryColor,
          fontSize: textSize,
          fontWeight: textFontWeight,
        ),
      );
    }
  }
}


class SecondaryButtons extends StatelessWidget {
  const SecondaryButtons({
    super.key,
    required this.iconUrl,
    required this.title,
  });

  final String iconUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: w(kMinute),
        vertical: h(kfsMedium),
      ),
      decoration: BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.circular(sr(kfs8)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageWidget(
            imageTypes: ImageTypes.svg,
            imageUrl: iconUrl,
          ),
          hSpace(kfs8),
          TextWidget(
            title,
            textColor: kPrimaryColor,
            fontSize: sp(kfsTiny),
            fontWeight: w500,
          ),
        ],
      ),
    );
  }
}
