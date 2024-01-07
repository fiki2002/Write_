import 'package:write/core/core.dart';

class WriteApp extends StatelessWidget {
  const WriteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, Widget? child) {
        return MaterialApp(
          title: 'Write',
          initialRoute: '/',
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RouteGenerator.generateRoute,
          navigatorKey: navigatorKey,
        );
      },
    );
  }
}
