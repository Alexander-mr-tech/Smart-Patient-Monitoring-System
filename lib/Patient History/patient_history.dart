import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Drawer/Drawer.dart';
import 'package:intl/intl.dart';

class patient_history extends StatefulWidget {
  const patient_history({Key? key});

  @override
  State<patient_history> createState() => _patient_historyState();
}

class _patient_historyState extends State<patient_history> {
  @override
  Widget build(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    final userUID = user?.uid;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Patient History"),
        centerTitle: true,
      ),
      drawer: const MyDrawer(),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.deepPurpleAccent,
              Colors.cyan,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection("Patient History")
                    .doc(userUID)
                    .collection("Records")
                    .snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasData) {
                    if (snapshot.data!.docs.isEmpty) {
                      return const Center(child: Text("No Records"));
                    }
                    return Expanded(
                      child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (BuildContext context, int index) {
                          String name = snapshot.data!.docs[index]["Name"];
                          String age =
                              snapshot.data!.docs[index]["Age"].toString();
                          String gender = snapshot.data!.docs[index]["Gender"];
                          String body_temp =
                              snapshot.data!.docs[index]["Body_Temperature"];
                          String room_temp =
                              snapshot.data!.docs[index]["Room_Temperature"];
                          String room_hum =
                              snapshot.data!.docs[index]["Room_humidity"];
                          String steps = snapshot.data!.docs[index]["Steps"];
                          String stress = snapshot.data!.docs[index]["Stress"];
                          // String time = snapshot.data!.docs[index]["Timestamp"].toString();
                          // DateTime dateTime = DateTime.parse(time);
                          // final dateFormat = DateFormat('yyyy-MM-dd HH:mm:ss');
                          // String formattedTimestamp = dateFormat.format(dateTime);
                          return SingleChildScrollView(
                              child: Container(
                                  height: 275,
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.white60.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color:Colors.blue, // Set the border color
                                      width: 2.0,
                                    ),
                                  ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Patient Name : $name",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                                  Divider(thickness: 2,height: 5,color: Colors.black12,),
                                  Text("Age : $age",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                                  Divider(thickness: 2,height: 5,),
                                  Text("Gender : $gender",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                                  Divider(thickness: 2,height: 5,),
                                  Text("Body Temperature : $body_temp",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                                  Divider(thickness: 2,height: 5,),
                                  Text("Room Temperature : $room_temp",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                                  Divider(thickness: 2,height: 5,),
                                  Text("Room Humidity : $room_hum",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                                  Divider(thickness: 2,height: 5,),
                                  Text("Steps : $steps",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                                  Divider(thickness: 2,height: 5,),
                                  Text("Stress Level : $stress",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                                  Divider(thickness: 2,height: 5,),
                                  Text("Time : ",style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                                ],
                              ),));
                        },
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return const Center(child: Text("Error"));
                  }
                  return const Center(child: Text("No data available."));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
