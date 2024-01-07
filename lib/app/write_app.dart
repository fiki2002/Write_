import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:write/core/core.dart';
import 'package:write/features/features.dart';

class WriteApp extends StatelessWidget {
  const WriteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, Widget? child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (_) => AuthBloc()),
          ],
          child: MaterialApp(
            title: 'Write',
            initialRoute: SplashView.route,
            debugShowCheckedModeBanner: false,
            onGenerateRoute: RouteGenerator.generateRoute,
            navigatorKey: navigatorKey,
          ),
        );
      },
    );
  }
}
