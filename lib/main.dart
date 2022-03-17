import 'package:apreculture/api/culture_state.dart';
import 'package:apreculture/api/fertilizer_state.dart';
import 'package:apreculture/api/health_state.dart';
import 'package:apreculture/api/stock_state.dart';
import 'package:apreculture/pages/connexion/login.dart';
import 'package:apreculture/pages/connexion/registration.dart';
import 'package:apreculture/pages/fertilizer/fertilizer.dart';
import 'package:apreculture/pages/fertilizer/fertilizer1.dart';
import 'package:apreculture/pages/health/health.dart';
import 'package:apreculture/pages/health/health1.dart';
import 'package:apreculture/pages/home/home.dart';
import 'package:apreculture/pages/profile.dart';
import 'package:apreculture/pages/recommandation/recommandation.dart';
import 'package:apreculture/pages/recommandation/recommandation1.dart';
import 'package:apreculture/splash.dart';
import 'package:apreculture/api/user_state.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final Color _primaryColor = HexColor('#49EB3B');
  final Color _accentColor = HexColor('#03A135');

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => UserState()),
        ChangeNotifierProvider(create: (ctx) => CultureState()),
        ChangeNotifierProvider(create: (ctx) => FertilizerState()),
        ChangeNotifierProvider(create: (ctx) => HealthState()),
        ChangeNotifierProvider(create: (ctx) => StockState()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'AGRIE',
          theme: ThemeData(
            primaryColor: _primaryColor,
            scaffoldBackgroundColor: Colors.grey.shade100,
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.grey)
                .copyWith(secondary: _accentColor),
          ),
          home: const SplashSreen(),
          routes: {
            SplashSreen.routeName: (ctx) => const SplashSreen(),
            LoginScreen.routeName: (ctx) => const LoginScreen(),
            RegistrationPage.routeName: (ctx) => const RegistrationPage(),
            HomePage.routeName: (ctx) => const HomePage(),
            ProfileScreen.routeName: (ctx) => const ProfileScreen(),
            RecommandationPage.routeName: (ctx) => const RecommandationPage(),
            Recommandation1Page.routeName: (ctx) => const Recommandation1Page(),
            Fertilizer1Page.routeName: (ctx) => const Fertilizer1Page(),
            FertilizerPage.routeName: (ctx) => const FertilizerPage(),
            HealthPage.routeName: (ctx) => const HealthPage(),
            HealthPage1.routeName: (ctx) => const HealthPage1(),
            // ignore: equal_keys_in_map
            HomePage.routeName: (ctx) => const HomePage(),
          }),
    );
  }
}
