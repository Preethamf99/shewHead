import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shewhead_shoes_app/firebase_options.dart';
import 'package:shewhead_shoes_app/on%20boarding%20screens/splashScreen.dart';
import 'package:shewhead_shoes_app/providers/CartProvider.dart';
import 'package:shewhead_shoes_app/providers/pageprovider.dart';
import 'package:shewhead_shoes_app/providers/product_notifier.dart';
import 'package:shewhead_shoes_app/widgets/bottomnavigationbar.dart';

int? isviewed;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isviewed = prefs.getInt('SplashScreen');

  await Hive.openBox('cart_box');
  await Hive.openBox('fav_box');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => OnBoardNotifier()),
          ChangeNotifierProvider(create: (context) => ProductsNotifier()),
          ChangeNotifierProvider(create: (context) => CartProvider()),
          // ChangeNotifierProvider(create: (context) => FavouritesNotifier())
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            // This is the theme of your application.
            //
            // TRY THIS: Try running your application with "flutter run". You'll see
            // the application has a purple toolbar. Then, without quitting the app,
            // try changing the seedColor in the colorScheme below to Colors.green
            // and then invoke "hot reload" (save your changes or press the "hot
            // reload" button in a Flutter-supported IDE, or press "r" if you used
            // the command line to start the app).
            //
            // Notice that the counter didn't reset back to zero; the application
            // state is not lost during the reload. To reset the state, use hot
            // restart instead.
            //
            // This works for code too, not just values: Most code changes can be
            // tested with just a hot reload.
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: isviewed != 0 ? SplashScreenOpen() : Rootpage(),
        ),
      ),
    );
  }
}
