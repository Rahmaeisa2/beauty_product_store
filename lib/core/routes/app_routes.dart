import 'package:beauty_product_store/features/auth/presentation/cubit/signup_cubit.dart';
import 'package:beauty_product_store/features/auth/presentation/screen/signup_screen.dart';
import 'package:beauty_product_store/features/home/presentation/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/auth/presentation/cubit/login_cubit.dart';
import '../../features/auth/presentation/screen/login_screen.dart';
import '../../features/home/presentation/home_navigation_bar.dart';
import '../../features/splash/splash_screen.dart';

import '../di/service_locator.dart';
import 'routes_names.dart';

class AppRoutes {
  AppRoutes._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );

      case RouteNames.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<LoginCubit>(
            create: (_) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case RouteNames.signup:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<SignupCubit>(
            create: (_) => getIt<SignupCubit>(),
            child: const SignupScreen(),
          ),
        );
      case RouteNames.home:
        return MaterialPageRoute(
          builder: (_) => const Homescreen(),

        );
      case RouteNames.navBar:
        return MaterialPageRoute(
          builder: (_) => const HomeNavigationScreen(),

        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Route Not Found'),
            ),
          ),
        );
    }
  }
}
