import 'package:flutter/material.dart';
import 'package:mvrs/screens/bottom_navigation_screens/home_screen.dart';
import 'package:mvrs/screens/bottom_navigation_screens/host_vehicle_screen.dart';
import 'package:mvrs/screens/bottom_navigation_screens/my_trips_screen.dart';
import 'package:mvrs/screens/bottom_navigation_screens/profile_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<String> _appBarTitles = [
    'Home',
    'My Trips',
    'Profile',
    'Be a Host',
  ];

  final List<Widget> _navigationPagesList = [
    HomeScreen(),
    MyTripsScreen(),
    ProfileScreen(),
    HostVehicleScreen(),
  ];

  void _onBottomNavigationItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Return false to prevent back navigation
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Icon(
            Icons.dashboard_customize,
            color: Colors.purple,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.purple,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Tooltip(
                  message: 'Sign Out',
                  child: IconButton(
                    icon: Icon(
                      Icons.logout,
                      color: Colors.white,
                    ), // Use the logout icon from Material Icons
                    onPressed: () {},
                  ),
                ),
              ),
            ),
          ],
          title: Text(
            _appBarTitles[_selectedIndex],
            style: TextStyle(
              color: Colors.purple,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: _navigationPagesList[_selectedIndex],
        bottomNavigationBar: Container(
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
                activeIcon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.directions_car_outlined),
                label: 'My Trips',
                activeIcon: Icon(Icons.directions_car),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person_outline),
                label: 'Profile',
                activeIcon: Icon(Icons.person),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.car_rental_outlined),
                label: 'Be a Host',
                activeIcon: Icon(Icons.car_rental),
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onBottomNavigationItemTapped,
            unselectedItemColor: Colors.blue,
            selectedItemColor: Colors.purple,
            selectedLabelStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
            showUnselectedLabels: true,
          ),
        ),
      ),
    );
  }
}
