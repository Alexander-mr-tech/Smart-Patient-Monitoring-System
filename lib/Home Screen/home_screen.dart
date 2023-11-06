import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Drawer/Drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final user = FirebaseAuth.instance.currentUser!;
  final auth = FirebaseAuth.instance;
  final DatabaseReference ref = FirebaseDatabase.instance.ref("All Parameters");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('${user.email!.toString()}'),
        centerTitle: true,
      ),
      drawer: const MyDrawer(),
      body: Container(
        height: screenHeight*1,
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
              Expanded(
                  child: StreamBuilder(
                      stream: ref.onValue,
                      builder:
                          (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          Map<dynamic, dynamic> map =
                              snapshot.data!.snapshot.value as dynamic;
                          List<dynamic> list =
                              List.from(map.values, growable: true);
                          list.clear();
                          list = map.values.toList();
                          return Column(
                            children: [
                              Container(
                                height: screenHeight*0.12,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black.withOpacity(0.5), width: 5.0)),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    height: screenHeight*0.09,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.blueAccent,
                                            width: 3.0)),
                                    child: Center(
                                      child: Text(
                                        "Smart Patient\nMonitoring System"
                                            .toUpperCase(),
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontFamily: 'Times New Roman',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 22,
                                            color: Colors.red),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: screenHeight *0.015,
                              ),
                              Container(
                                height: screenHeight * 0.08,
                                width: screenWidth * 1,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.blue, width: 5.0)),
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
                              SizedBox(
                                height: screenHeight *0.02,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: screenHeight * 0.20,
                                    width: screenWidth * 0.46,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black.withOpacity(0.5), width: 5.0)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
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
                                        const Divider(
                                          color: Colors.grey,
                                          thickness: 2,
                                        ),
                                        Text(
                                          "${list[0]['Temperature']}° C",
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              fontFamily: 'Times New Roman',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 40,
                                              color: Colors.red),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: screenWidth * 0.02,
                                  ),
                                  Container(
                                    height: screenHeight * 0.20,
                                    width: screenWidth * 0.46,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.blue, width: 5.0)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
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
                                        const Divider(
                                          color: Colors.grey,
                                          thickness: 2,
                                        ),
                                        Text(
                                          "${list[0]['Humidity']} %",
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              fontFamily: 'Times New Roman',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 40,
                                              color: Colors.blue),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: screenHeight*0.02,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: screenHeight * 0.20,
                                    width: screenWidth * 0.46,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.blue, width: 5.0)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
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
                                        const Divider(
                                          color: Colors.grey,
                                          thickness: 2,
                                        ),
                                        Text(
                                          "${list[1]['Body Temperature']}° F",
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              fontFamily: 'Times New Roman',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 40,
                                              color: Colors.blue),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: screenWidth * 0.02,),
                                  Container(
                                    height: screenHeight * 0.20,
                                    width: screenWidth * 0.46,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.black.withOpacity(0.5), width: 5.0)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
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
                                        const Divider(
                                          color: Colors.grey,
                                          thickness: 2,
                                        ),
                                        Text(
                                          list[3]['Steps'].toString(),
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              fontFamily: 'Times New Roman',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 40,
                                              color: Colors.red),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: screenHeight *0.02,
                              ),
                              Column(
                                children: [
                                  Container(
                                    height: screenHeight * 0.18,
                                    width: screenWidth * 1,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.blue, width: 5.0)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Patient's Stress Level"
                                                .toUpperCase(),
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                fontFamily: 'Times New Roman',
                                                fontWeight: FontWeight.bold,
                                                fontSize: 26,
                                                color: Colors.red),
                                          ),
                                          const Divider(
                                            color: Colors.grey,
                                            thickness: 2,
                                          ),
                                          Text(
                                            list[2]['Stress'].toString(),
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
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
                          );
                        }
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
