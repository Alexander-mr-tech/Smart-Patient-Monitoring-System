import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_patient_monitoring_system/widgets/Drawer/Drawer.dart';
class patient_history extends StatefulWidget {
  const patient_history({super.key});

  @override
  State<patient_history> createState() => _patient_historyState();
}

class _patient_historyState extends State<patient_history> {
  final fireStore = FirebaseFirestore.instance
      .collection("My_Patients").snapshots();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Patient History"),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      ),
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
            )),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              StreamBuilder<QuerySnapshot>(
                stream: fireStore,
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                  if(snapshot.connectionState==ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  }
                  if(snapshot.hasError) {
                    return const Text("Error");
                  }
                  return Expanded(child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index){
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: Container(
                        height: 120,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black), // Add border
                          borderRadius: BorderRadius.circular(8.0), // Add rounded corners
                          color: Colors.white, // Add background color
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: Offset(0, 2), // Add shadow
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Text('Patient ID : '+snapshot.data!.docs[index]['Patient_ID'],style: TextStyle(fontSize: 18),),
                            Text('Patient Name : '+snapshot.data!.docs[index]['Patient_Name']),
                            Text("Body Temperature : " + snapshot.data!.docs[index]['Patient_Temp'],style: const TextStyle(color:Colors.red),),
                            Text("Room Temperature : " + snapshot.data!.docs[index]['Room_Temp'],style: const TextStyle(color:Colors.greenAccent),),
                            Text("Room Humidity : " + snapshot.data!.docs[index]['Room_Humidity'],style: const TextStyle(color:Colors.redAccent),),
                            Text("Patients Steps : " + snapshot.data!.docs[index]['Steps_Counts'],style: const TextStyle(color:Colors.blueAccent),),
                          ],
                        )
                      ),
                    );
                  }),
                  );
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}


