import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppSplashScreen extends StatefulWidget {
  const AppSplashScreen({super.key});

  @override
  State<AppSplashScreen> createState() => _AppSplashScreenState();
}

class _AppSplashScreenState extends State<AppSplashScreen>
    with SingleTickerProviderStateMixin {
  String _welcomeMessage = 'Gearing...';
  String _message = 'We’re setting up your experience.';

  late final AnimationController _animationController;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 400).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _startSplashSequence();
  }

  void _startSplashSequence() async {
    await Future.delayed(Duration(seconds: 3));

    setState(() {
      _message = 'Adjusting gears for a smooth ride!';
    });

    await Future.delayed(Duration(seconds: 4));

    setState(() {
      _welcomeMessage = 'Welcome';
      _message = 'Let’s get started.';
    });

    await Future.delayed(Duration(seconds: 3));

    _animationController.forward();

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.of(context)
            .pushReplacementNamed('/'); // Navigate to the home screen
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ScaleTransition(
        scale: _scaleAnimation,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    _welcomeMessage,
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                  Shimmer.fromColors(
                    baseColor: Colors.purple[300]!,
                    highlightColor: Colors.purple[100]!,
                    child: Text(
                      _message,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.purple,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
