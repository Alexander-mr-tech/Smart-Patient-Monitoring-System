import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../Drawer/Drawer.dart';

class patient_history extends StatefulWidget {
  const patient_history({super.key});

  @override
  State<patient_history> createState() => _patient_historyState();
}

class _patient_historyState extends State<patient_history> {
  @override
  Widget build(BuildContext context) {
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
            )),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
              .collection("Patients Records").snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
                  if(snapshot.connectionState==ConnectionState.waiting) {
                    print("connection sucssess");
                    return const Center(child: CircularProgressIndicator());
                  }
                  if(snapshot.hasData) {
                    print(snapshot.data!.docs);
                  }
                  if(snapshot.hasError) {
                    return const Center(child: Text("Error"));
                  }
                  return Expanded(child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index){
                        print(snapshot.data!.docs.length,);
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      // child: Container(
                      //   height: 150,
                      //   decoration: BoxDecoration(
                      //     border: Border.all(color: Colors.white), // Add border
                      //     borderRadius: BorderRadius.circular(16.0), // Add rounded corners
                      //     color: Colors.white.withOpacity(0.6), // Add background color
                      //     boxShadow: [
                      //       BoxShadow(
                      //         color: Colors.grey.withOpacity(0.5),
                      //         spreadRadius: 2,
                      //         blurRadius: 4,
                      //         offset: const Offset(0, 2), // Add shadow
                      //       ),
                      //     ],
                      //   ),
                      //   child: Column(
                      //     children: [
                      //       Text('Name : '+snapshot.data!.docs[index]['Name'],style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                      //       Text("Body Temperature : " + snapshot.data!.docs[index]['Body_Temperature'],style: const TextStyle(color:Colors.red,fontSize: 20,fontWeight: FontWeight.bold),),
                      //       Text("Room Temperature : " + snapshot.data!.docs[index]['Room_Temperature'],style: const TextStyle(color:Colors.greenAccent,fontSize: 20,fontWeight: FontWeight.bold),),
                      //       Text("Room Humidity : " + snapshot.data!.docs[index]['Room_Humidity'],style: const TextStyle(color:Colors.redAccent,fontSize: 20,fontWeight: FontWeight.bold),),
                      //       Text("Patients Steps : " + snapshot.data!.docs[index]['Steps'],style: const TextStyle(color:Colors.blueAccent,fontSize: 20,fontWeight: FontWeight.bold),),
                      //     ],
                      //   )
                      // ),
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


