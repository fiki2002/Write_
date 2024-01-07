
import 'package:write/core/core.dart';

Route<dynamic> errorRoute() {
  return MaterialPageRoute(
    builder: (_) {
      return ScaffoldWidget(
        appBar: AppBar(
          backgroundColor: kPrimaryColor,
          title: const TextWidget('Page Not Found'),
        ),
        body: const Center(
          child: TextWidget('ERROR! Page not found'),
        ),
        useSingleScroll: false,
      );
    },
  );
}
