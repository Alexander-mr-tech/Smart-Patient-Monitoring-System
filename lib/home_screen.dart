import 'package:flutter/material.dart';
import 'package:smart_patient_monitoring_system/drawer.dart';

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
      appBar: AppBar(
        title: const Text("Home Screen",style:TextStyle(color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold),
    ),
        centerTitle: true,
        shadowColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: 400,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.indigoAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                    child: Text(
                  "Welcome\nto\nSmart Patient Monitoring System",textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                )),
              )),
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: 400,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.indigoAccent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/body temperature.png",
                        height: 75, width: 75),
                    const Text(
                      "Body Temperature",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "42",
                          style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 60.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "°F",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: 400,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.indigoAccent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/room temperature.png",
                        height: 75, width: 75),
                    const Text(
                      "Room Temperature",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "97",
                          style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 60.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "°C",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: 400,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.indigoAccent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/room humidty.png",
                        height: 75, width: 75),
                    const Text(
                      "Room Humidity",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "65",
                          style: TextStyle(
                              color: Colors.redAccent,
                              fontSize: 60.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "%",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
