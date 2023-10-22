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
    return Scaffold(
      appBar: AppBar(
        title: Text('${user.email!.toString()}'),
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
                          // print("value is "+list[2]['Steps'].toString());
                          return Column(
                            children: [
                              Container(
                                height: 110,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.red, width: 5.0)),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    height: 90,
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
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 150,
                                    width: 165,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.red, width: 5.0)),
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
                                          list[0]['Temperature'].toString(),
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
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
                                          list[0]['Humidity'].toString(),
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
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 150,
                                    width: 165,
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
                                          list[1]['Body Temperature']
                                              .toString(),
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
                                  Container(
                                    height: 150,
                                    width: 165,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Colors.red, width: 5.0)),
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
                                          list[2]['Steps'].toString(),
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
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
                                                fontSize: 24,
                                                color: Colors.red),
                                          ),
                                          const Divider(
                                            color: Colors.grey,
                                            thickness: 2,
                                          ),
                                          const Text(
                                            "12548",
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
                          );
                          //   Column(
                          //   children: [
                          //     Text(list[0]['Room Humidity'].toString()),
                          //     Text(list[0]['Room Temperature'].toString()),
                          //     Text(list[1]['Steps Counts'].toString()),
                          //     Text(list[2]['Body Temperature'].toString()),
                          //   ],
                          // );
                        }
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
