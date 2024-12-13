// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:amata_podcast/favorite_screen.dart';
import 'package:amata_podcast/home.dart';
import 'package:amata_podcast/profile_page.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentPage = BottomNavIndex.home;

  List<Widget> get screens => [
        const HomeScreen(),
        const FavoriteScreen(),
        const ProfileScreen(),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentPage],
      bottomNavigationBar: SizedBox(
        height: 72,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 25,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NavBarTile(
                isSelected: currentPage == BottomNavIndex.home,
                isHome: true,
                onPressed: () {
                  setState(() {
                    currentPage = BottomNavIndex.home;
                  });
                },
                selectedIcon: Icons.home,
                unSelectedIcon: Icons.home_outlined,
              ),
              NavBarTile(
                isSelected: currentPage == BottomNavIndex.favorite,
                onPressed: () {
                  setState(() {
                    currentPage = BottomNavIndex.favorite;
                  });
                },
                selectedIcon: Icons.favorite,
                unSelectedIcon: Icons.favorite_outline,
              ),
              NavBarTile(
                isSelected: currentPage == BottomNavIndex.profile,
                onPressed: () {
                  setState(() {
                    currentPage = BottomNavIndex.profile;
                  });
                },
                selectedIcon: Icons.supervised_user_circle,
                unSelectedIcon: Icons.supervised_user_circle_outlined,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomNavIndex {
  BottomNavIndex._();

  static const int home = 0;
  static const int favorite = 1;
  static const int profile = 2;
}

class NavBarTile extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onPressed;
  final IconData selectedIcon;
  final IconData unSelectedIcon;
  final bool isHome;
  const NavBarTile({
    super.key,
    required this.isSelected,
    required this.onPressed,
    required this.selectedIcon,
    required this.unSelectedIcon,
    this.isHome = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isSelected ? null : onPressed,
      borderRadius: BorderRadius.circular(25),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: isHome ? 10 : 6, vertical: 6),
        decoration: BoxDecoration(
          color: isHome ? Theme.of(context).colorScheme.primaryContainer : null,
          borderRadius: const BorderRadius.all(Radius.circular(25)),
        ),
        child: isHome
            ? Opacity(
                opacity: isSelected ? 1 : 0.55,
                child: Row(
                  children: [
                    Icon(
                      selectedIcon,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'صفحه اصلی',
                      style: TextStyle(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer),
                    )
                  ],
                ),
              )
            : isSelected
                ? Icon(selectedIcon)
                : Icon(unSelectedIcon),
      ),
    );
  }
}
