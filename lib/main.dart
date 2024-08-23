
import 'package:flutter/services.dart';

import 'exports.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(const MyApp());
}


final GlobalKey<NavigatorState> navigatorKey = GlobalKey();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple, ),
        scaffoldBackgroundColor: AppColors.pureWhiteColor,
        splashColor: AppColors.transparentColor,
        hoverColor: AppColors.primaryColor,
        bottomSheetTheme: const BottomSheetThemeData(
          dragHandleSize: Size(400, 4),
          dragHandleColor: AppColors.ledGreyColor,
        ),
        useMaterial3: true,
      ),
      home: const BottomView(),
    );
  }
}

