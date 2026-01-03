import 'package:flutter/material.dart';
import 'package:medi_queue_notify/data/token_storage.dart';
import 'package:medi_queue_notify/features/auth/pages/login_page.dart';
import 'package:medi_queue_notify/pages/welcome_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final tokenStorage = TokenStorage();

  @override
  void initState() {
    super.initState();
    checkToken();
  }

  void checkToken() async {
    final token = await tokenStorage.getToken();

    if (token != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => WelcomePage()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
