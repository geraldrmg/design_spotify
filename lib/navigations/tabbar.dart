

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/views/home.dart';
import '../views/librarry.dart' as libraryView; 
import '/views/profile.dart' as profileView;    
import '/views/search.dart';

class Tabbar extends StatefulWidget {
  const Tabbar({super.key});

  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {
  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: (index) {
          setState(() {
            _selectedTab = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_music), label: "Library"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
      body: Stack(
        children: [
          render(0, const HomeView()),
          render(1, const SearchView()),
          render(2, const libraryView.LibraryView()),  
          render(3, const profileView.ProfileView()),  
        ],
      ),
    );
  }

  Widget render(int index, Widget view) {
    return IgnorePointer(
      ignoring: _selectedTab != index,
      child: Opacity(
        opacity: _selectedTab == index ? 1 : 0,
        child: view,
      ),
    );
  }
}
