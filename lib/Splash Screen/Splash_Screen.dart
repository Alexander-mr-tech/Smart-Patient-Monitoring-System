import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:smart_patient_monitoring_system/Welcome%20Screen/welcome_Screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    Future.delayed(const Duration(seconds: 5)).then((value){
      Navigator.of(context).pushReplacement(
          CupertinoPageRoute(builder: (ctx)=> WelcomeScreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            opacity: 0.4,
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
            children: [
              const Positioned(
                left: 235,
                top: 200,
                child: SpinKitPumpingHeart(
                  color: Colors.red,
                  size: 60.0,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Smart \nPatient\nMonitoring\nSystem".toUpperCase(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontFamily: 'Times New Roman',
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      wordSpacing: 2,
                      letterSpacing: 2,
                      color: Colors.blueAccent),
                ),
              ),
            ],
          ),
        ),
    );
  }
}