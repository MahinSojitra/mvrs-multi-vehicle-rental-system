import 'package:flutter/material.dart';
import 'package:mvrs/entities/user.dart';
import 'package:mvrs/entities/user_with_message.dart';
import 'package:mvrs/screens/bottom_navigation_screens/profile_screens/profile_details_card_widget.dart';
import 'package:mvrs/screens/bottom_navigation_screens/profile_screens/profile_header_card_widget.dart';
import 'package:mvrs/screens/bottom_navigation_screens/user_acknowledgement_screens/user_signin_indication_screen.dart';
import 'package:mvrs/services/user_authentication_service.dart';
import 'package:mvrs/services/user_service.dart';
import 'package:shimmer/shimmer.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late bool _isSignedIn;
  bool _isLoading = false;
  User? _user;
  late UserWithMessage _userWithMessage = UserWithMessage("Init", null);
  final UserAuthenticationService _userAuthenticationService =
      UserAuthenticationService();
  final UserService _userService = UserService();

  @override
  void initState() {
    _isSignedIn =
        _userAuthenticationService.getCurrentUser() != null ? true : false;
    if (_isSignedIn) {
      _fetchUserDetails();
    }
    super.initState();
  }

  Future<void> _fetchUserDetails() async {
    setState(() {
      _isLoading = true;
    });
    _userWithMessage = await _userService.getCurrentUserDetails(
        _userAuthenticationService.getCurrentUser()!.uid);
    setState(() {
      _user = _userWithMessage.user;
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isSignedIn
          ? _isLoading
              ? Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Loading...",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                      Shimmer.fromColors(
                        baseColor: Colors.purple[300]!,
                        highlightColor: Colors.purple[100]!,
                        child: Text(
                          "Fetching data from the server.",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.purple,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Container(
                    child: _userWithMessage.message == "Success"
                        ? Column(
                            children: [
                              ProfileHeaderCardWidget(
                                imageUrl: _user!.profilePictureUrl ??
                                    Uri(
                                      path:
                                          "assets/jpg-images/profile-pic-empty-jpg.jpg",
                                    ),
                                firstName: _user!.firstName,
                                lastName: _user!.lastName ?? "",
                                joinedDate: _user!.createdAt,
                              ),
                              ProfileDetailsCardWidget(
                                firstName: _user!.firstName,
                                lastName: _user!.lastName ?? null,
                                username: _user!.username,
                                email: _user!.email,
                                phone: _user!.phoneNumber ?? null,
                                dob: _user!.dateOfBirth ?? null,
                                totalRentalTrips: _user!.totalRentals,
                                totalSpent: _user!.totalSpent,
                                address: _user!.address ?? null,
                              ),
                              Container()
                            ],
                          )
                        : Container(),
                  ),
                )
          : UserSigninIndicationScreen(
              title: "Personalize Your Experience!",
              subTitle: "Sign in first to access your profile information",
            ),
    );
  }
}
