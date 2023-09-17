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
      appBar: AppBar(
        title: const Text("Home Screen"),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildHeader(context),
              buildMenuItems(context),
            ],
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.white,
                Colors.blue.shade100,
                Colors.white,
              ],
            )),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                height: 110,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.red,width: 5.0)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    height: 90,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blueAccent,width: 3.0)
                    ),
                    child:  Center(
                      child: Text(
                        "Smart Patient\nMonitoring System".toUpperCase(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontFamily: 'Times New Roman',
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            color: Colors.red),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue,width: 5.0)
                ),
                child: Center(
                  child: Text(
                    "Monitoring Devices".toUpperCase(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontFamily: 'Times New Roman',
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                        color: Colors.red),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 150,
                    width: 165,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.red,width: 5.0)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Room\nTemperature".toUpperCase(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontFamily: 'Times New Roman',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.blue),
                        ),
                        const Divider(color: Colors.grey,thickness: 2,),
                        const Text(
                          "25",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Times New Roman',
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 150,
                    width: 165,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue,width: 5.0)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Room\nHumidity".toUpperCase(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontFamily: 'Times New Roman',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.red),
                        ),
                        const Divider(color: Colors.grey,thickness: 2,),
                        const Text(
                          "65",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Times New Roman',
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.blue),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 150,
                    width: 165,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue,width: 5.0)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Body\nTemperature".toUpperCase(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontFamily: 'Times New Roman',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.red),
                        ),
                        const Divider(color: Colors.grey,thickness: 2,),
                        const Text(
                          "25",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Times New Roman',
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.blue),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 150,
                    width: 165,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.red,width: 5.0)
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Patient's\nSteps".toUpperCase(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontFamily: 'Times New Roman',
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.blue),
                        ),
                        const Divider(color: Colors.grey,thickness: 2,),
                        const Text(
                          "65",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Times New Roman',
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.red),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Container(
                    height: 120,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue,width: 5.0)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Patient's Stress Level".toUpperCase(),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontFamily: 'Times New Roman',
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Colors.red),
                          ),
                          const Divider(color: Colors.grey,thickness: 2,),
                          const Text(
                            "1234 Steps",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'Times New Roman',
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.blue),
                          ),
                        ],
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
