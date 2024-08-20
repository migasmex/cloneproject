import 'package:spotify/pages/home_page.dart';
import 'package:spotify/pages/login_page.dart';
import 'package:spotify/pages/register_page.dart';

final routes = {
        '/': (context) => const HomePage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
      };