import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:puffyapp/screens/clinics_screen.dart';
import 'package:puffyapp/screens/profile_screen.dart';
import 'package:puffyapp/widgets/adopt_pet_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const routeName = '/';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const AdoptPetWidget(),
    const ClinicsScreen(),
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Theme.of(context).colorScheme.primary,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          elevation: 5,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                    _selectedIndex == 0 ? Ionicons.paw : Ionicons.paw_outline),
                label: 'Adopt'),
            BottomNavigationBarItem(
                icon: Icon(_selectedIndex == 1
                    ? Ionicons.bandage
                    : Ionicons.bandage_outline),
                label: 'Clinics'),
            BottomNavigationBarItem(
                icon: Icon(_selectedIndex == 2
                    ? Ionicons.person
                    : Ionicons.person_outline),
                label: 'Profile'),
          ],
        ));
  }
}
