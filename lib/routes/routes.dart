import 'package:get/get.dart';
import 'package:mnbr/view/screens/auth/register_screen.dart';
import 'package:mnbr/view/screens/auth/verify_screen.dart';
import 'package:mnbr/view/screens/else/done_screen.dart';
import '../view/screens/auth/login_screen.dart';
import '../view/screens/map/map_animated_marker_map.dart';
import '../view/screens/else/splash_screen.dart';
import '../view/screens/else/vote_screen.dart';
import '../view/screens/welcome/welcome_screen.dart';

class AppRoutes {

  static const login = '/login';
  static const splash = '/splash';
  static const map = '/map';



  static final routes = [
    GetPage(
      name: '/login',
      page: () => LoginScreen(),
    ),
    GetPage(
      name: '/splash',
      page: () => SplashScreen(),
    ),
    GetPage(
      name: '/map',
      page: () => MapAnimatedMarkerMap(),
    ),
    GetPage(
      name: '/welcome',
      page: () => WelcomeScreen(),
    ),
    GetPage(
      name: '/verify',
      page: () => VerifyScreen(),
    ),
    GetPage(
      name: '/vote',
      page: () => VoteScreen(),
    ),
    GetPage(
      name: '/register',
      page: () => RegisterScreen(),
    ),
    GetPage(
      name: '/done',
      page: () => DoneScreen(),
    ),
  ];

}