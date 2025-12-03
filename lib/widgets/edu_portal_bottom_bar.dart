import 'package:flutter/material.dart';
import '../screens/home/home_screen.dart';
import '../screens/profile_screen.dart';
import '../screens/subjects/subjects_screen.dart';
import '../screens/timetable/timetable_screen.dart';

class EduPortalBottomBar extends StatelessWidget {
  final int selectedIndex;

  const EduPortalBottomBar({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      elevation: 0,
      backgroundColor: Colors.white.withOpacity(0.8),
      selectedIndex: selectedIndex,
      onDestinationSelected: (index) {
        if (index == selectedIndex) return;

        if (index == 0) {
          Navigator.pushReplacementNamed(context, HomeScreen.routeName);
        } else if (index == 1) {
          Navigator.pushReplacementNamed(context, SubjectsScreen.routeName);
        } else if (index == 2) {
          Navigator.pushReplacementNamed(context, TimeTableScreen.routeName);
        } else if (index == 3) {
          Navigator.pushReplacementNamed(context, ProfileScreen.routeName);
        }
      },
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.book_outlined),
          selectedIcon: Icon(Icons.book),
          label: 'Subjects',
        ),
        NavigationDestination(
          icon: Icon(Icons.calendar_today_outlined),
          selectedIcon: Icon(Icons.calendar_today),
          label: 'Time Table',
        ),
        NavigationDestination(
          icon: Icon(Icons.person_outline),
          selectedIcon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
