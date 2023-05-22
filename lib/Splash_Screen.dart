import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:smart_patient_monitoring_system/welcome_Screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();

    Future.delayed(const Duration(seconds: 3)).then((value){
      Navigator.of(context).pushReplacement(
          CupertinoPageRoute(builder: (ctx)=> WelcomeScreen()));
    });
  }
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Smart\n Health Monitoring \nSystem",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 36),
            ),
            SizedBox(
              height: 10,
            ),
            SpinKitPumpingHeart(
              color: Colors.red,
              size: 100.0,
            )
          ],
        ),
      ),
    );
  }
}