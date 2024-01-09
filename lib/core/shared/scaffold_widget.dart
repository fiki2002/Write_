import 'package:flutter/services.dart';
import 'package:write/core/core.dart';

class ScaffoldWidget extends StatelessWidget {
  const ScaffoldWidget({
    super.key,
    this.drawer,
    this.bottomNavigationBar,
    this.floatingActionButton,
    required this.body,
    this.appBar,
    this.usePadding = true,
    required this.useSingleScroll,
    this.bg = kPrimaryColor,
    this.scaffoldKey,
    this.controller,
    this.scrollPhysics,
    this.safeAreaTop,
    this.extendBody,
    this.statusBarColor,
    this.navBarColor,
    this.isLight = false, this.resizeToAvoidBottomInset,
  });

  final Widget? drawer;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final Widget body;
  final PreferredSizeWidget? appBar;
  final bool usePadding;
  final bool useSingleScroll;
  final Color? bg;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final ScrollController? controller;
  final ScrollPhysics? scrollPhysics;
  final bool? safeAreaTop;
  final bool? extendBody;
  final Color? statusBarColor;
  final Color? navBarColor;
  final bool? isLight;
  final bool? resizeToAvoidBottomInset;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: statusBarColor ?? bg ?? kSecondaryColor,
        statusBarBrightness: checkColorForBrightness(
          color: bg,
          statusBarColor: statusBarColor,
          isStatusBar: statusBarColor != null,
          isLight: isLight ?? false,
        ),
        statusBarIconBrightness: checkColorForBrightness(
          color: bg,
          statusBarColor: statusBarColor,
          isStatusBar: statusBarColor != null,
          isLight: isLight ?? false,
        ),
        systemNavigationBarColor: navBarColor ?? bg ?? kSecondaryColor,
        systemNavigationBarIconBrightness: checkColorForBrightness(
          color: bg,
          statusBarColor: statusBarColor,
          isStatusBar: statusBarColor != null,
          isLight: isLight ?? false,
        ),
      ),
      child: Scaffold(
        drawerEnableOpenDragGesture: true,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        key: scaffoldKey,
        appBar: appBar,
        extendBody: extendBody ?? false,
        backgroundColor: bg,
        body: SafeArea(
          top: safeAreaTop ?? true,
          bottom: false,
          child: SizedBox(
            height: sh(98),
            child: useSingleScroll
                ? SingleChildScrollView(
                    controller: controller,
                    physics: scrollPhysics,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                        usePadding ? w(kfsMedium) : 0,
                        usePadding ? h(kfsMedium) : 0,
                        usePadding ? w(kfsMedium) : 0,
                        0,
                      ),
                      child: body,
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: usePadding ? w(kfsMedium) : 0,
                    ),
                    child: body,
                  ),
          ),
        ),
        drawer: drawer,
        bottomNavigationBar: bottomNavigationBar,
        floatingActionButton: floatingActionButton,
      ),
    );
  }

  Brightness checkColorForBrightness({
    Color? color,
    bool isStatusBar = false,
    Color? statusBarColor,
    bool isLight = false,
  }) {
    if (isStatusBar == true &&
        statusBarColor != kSecondaryColor &&
        isLight == false) {
      return Brightness.light;
    } else if (isStatusBar == false &&
        color != kSecondaryColor &&
        isLight == false) {
      return Brightness.light;
    } else if (isLight == true && color != kSecondaryColor) {
      return Brightness.dark;
    } else {
      return Brightness.dark;
    }
  }
}
