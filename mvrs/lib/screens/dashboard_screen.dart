import 'package:delightful_toast/delight_toast.dart';
import 'package:delightful_toast/toast/components/toast_card.dart';
import 'package:delightful_toast/toast/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:mvrs/entities/custom_message.dart';
import 'package:mvrs/screens/bottom_navigation_screens/home_screen.dart';
import 'package:mvrs/screens/bottom_navigation_screens/host_vehicle_screen.dart';
import 'package:mvrs/screens/bottom_navigation_screens/my_trips_screen.dart';
import 'package:mvrs/screens/bottom_navigation_screens/profile_screen.dart';
import 'package:mvrs/services/user_authentication_service.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  bool _isLoading = false;
  late bool _isSignedIn;

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

  late UserAuthenticationService _userAuthenticationService;
  static DelightToastBar? _toastBar;

  @override
  void initState() {
    _userAuthenticationService = UserAuthenticationService();
    _isSignedIn =
        _userAuthenticationService.getCurrentUser() != null ? true : false;
    super.initState();
  }

  void _signOut() async {
    setState(() {
      _isLoading = true;
    });

    CustomMessage message = _userAuthenticationService.signOut(
      _userAuthenticationService.getCurrentUser()!,
    );

    if (message.cause == "Success") {
      _showToastMessage(message);
      _refereshPage();
    } else {
      _showToastMessage(message);
    }
  }

  void _refereshPage() {
    setState(() {
      _isLoading = false;
      _isSignedIn = false;
      _selectedIndex = 0;
    });
  }

  void _showToastMessage(CustomMessage message) {
    _toastBar = DelightToastBar(
      position: DelightSnackbarPosition.top,
      autoDismiss: true,
      animationDuration: Duration(milliseconds: 15),
      builder: (context) => ToastCard(
        leading: Icon(
          Icons.flutter_dash,
          size: 30,
          color: Colors.blue,
        ),
        title: Text(
          "${message.description}.",
          style: TextStyle(
            fontSize: message.cause == "Success" ? 14 : 12,
            fontWeight:
                message.cause == "Success" ? FontWeight.bold : FontWeight.w700,
          ),
        ),
        trailing: IconButton(
          onPressed: null,
          icon: Icon(
            message.cause == "Success" ? Icons.verified : Icons.error_outline,
            size: 25,
            color: message.cause == "Success" ? Colors.green : Colors.red,
          ),
        ),
      ),
    );
    setState(() {
      _toastBar?.show(context);
    });
  }

  Widget _signOutButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: Container(
        decoration: BoxDecoration(
          color: _isLoading ? Colors.purple.shade200 : Colors.purple,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Tooltip(
          message: 'Sign Out',
          child: _isLoading
              ? Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      color: Colors.white,
                    ),
                  ),
                )
              : IconButton(
                  icon: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  disabledColor: Colors.white,
                  onPressed: _isLoading ? null : _signOut,
                ),
        ),
      ),
    );
  }

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
            _isSignedIn ? _signOutButton() : Container(),
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
