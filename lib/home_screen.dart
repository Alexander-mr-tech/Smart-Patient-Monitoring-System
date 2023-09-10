import 'package:flutter/material.dart';
import 'package:smart_patient_monitoring_system/widgets/Drawer/Drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.deepPurpleAccent,
            Colors.cyan,
          ],
        )),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            const Text(
              "Welcome to \n Smart Patient\nMonitoring System",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Times New Roman',
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 20,
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 180.0,
                          height: 180.0,
                          decoration: BoxDecoration(
                            color:
                                Colors.white,
                            border: Border.all(
                              color: Colors.deepPurpleAccent,
                              width: 3.0,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Image.asset(
                            'assets/images/unilogo.png',
                            height: 140,
                            width: 175,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Body \nTemperature",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Times New Roman',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 180.0,
                          height: 180.0,
                          decoration: BoxDecoration(
                            color:
                            Colors.white,
                            border: Border.all(
                              color: Colors.deepPurpleAccent,
                              width: 3.0,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Image.asset(
                            'assets/images/unilogo.png',
                            height: 140,
                            width: 175,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Body \nTemperature",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Times New Roman',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
              ],
            )
          ],
        ),
      ),
    );
  }
}
