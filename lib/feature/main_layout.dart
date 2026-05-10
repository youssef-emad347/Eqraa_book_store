import 'package:eqraa_book_store/core/constants/constants.dart';
import 'package:eqraa_book_store/feature/home/home_screen.dart';
import 'package:eqraa_book_store/feature/search/search_screen.dart';
import 'package:flutter/material.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const SearchScreen(),
    const Center(child: Text("Categories Screen")),
    const Center(child: Text("Favourite Screen")),
    const Center(child: Text("Profile Screen")),
  ];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey.shade200, width: 1),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: Constants.mainColor,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: TextStyle(fontSize: screenWidth * 0.025, fontWeight: FontWeight.w500),
          unselectedLabelStyle: TextStyle(fontSize: screenWidth * 0.025, fontWeight: FontWeight.w500),
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Image.asset(
                  "assets/homeIcon.png",
                  height: 24,
                  color: _selectedIndex == 0 ? Constants.mainColor : Colors.grey,
                ),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Image.asset(
                  "assets/searchIcon.png",
                  height: 24,
                  color: _selectedIndex == 1 ? Constants.mainColor : Colors.grey,
                ),
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Image.asset(
                  "assets/categoriesIcon.png",
                  height: 24,
                  color: _selectedIndex == 2 ? Constants.mainColor : Colors.grey,
                ),
              ),
              label: 'Categories',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Image.asset(
                  "assets/favIcon.png",
                  height: 24,
                  color: _selectedIndex == 3 ? Constants.mainColor : Colors.grey,
                ),
              ),
              label: 'Favourite',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Image.asset(
                  "assets/profileIcon.png",
                  height: 24,
                  color: _selectedIndex == 4 ? Constants.mainColor : Colors.grey,
                ),
              ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
