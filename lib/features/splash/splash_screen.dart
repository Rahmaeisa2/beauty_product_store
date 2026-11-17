import 'package:beauty_product_store/core/constants/app_color.dart';
import 'package:flutter/material.dart';

import '../../core/di/service_locator.dart';
import '../../core/routes/routes_names.dart';
import '../../core/storage/flutter_secure_storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _goNext();
    _checkAuth();
  }
  Future<void> _checkAuth() async {
    print('SPLASH: started');

    final secureStorage = getIt<SecureStorageService>();
    final token = await secureStorage.getAccessToken();

    print('SPLASH: token exists = '
        '${token != null && token.isNotEmpty}');
    print(token);
    if (!mounted) return;

    if (token != null && token.isNotEmpty) {
      print('SPLASH: navigating to HOME');

      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteNames.navBar,
            (route) => false,
      );
    } else {
      print('SPLASH: navigating to LOGIN');

      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteNames.login,
            (route) => false,
      );
    }
  }

  Future<void> _goNext() async {
    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;
    Navigator.pushReplacementNamed(
      context,
      RouteNames.login,
    );  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Beauty Store ",style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: AppColors.textLight,
            ),)
          ],
        ),
      ),
    );
  }
}
