
import 'package:flutter/material.dart';

import '../../../core/widget/custom_bottom_nav_bar.dart';
import 'home_screen.dart';


class HomeNavigationScreen extends StatefulWidget {
  const HomeNavigationScreen({super.key});

  @override
  State<HomeNavigationScreen> createState() =>
      _HomeNavigationScreenState();
}

class _HomeNavigationScreenState
    extends State<HomeNavigationScreen> {
  int currentIndex = 0;

  late final List<Widget> pages = [
    const Homescreen(),
    const Center(child: Text('Favorites')),
    const Center(child: Text('Cart')),
    const Center(child: Text('Profile')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: CustomBottomNavBar(
        index: currentIndex,
        ontap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
