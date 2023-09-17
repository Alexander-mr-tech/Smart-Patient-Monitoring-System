import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_patient_monitoring_system/widgets/Drawer/Drawer.dart';

class patient_details extends StatefulWidget {
  const patient_details({super.key});
  @override
  State<patient_details> createState() => _patient_detailsState();
}

class _patient_detailsState extends State<patient_details> {

  final patientIdController = TextEditingController();
  final patientNameController = TextEditingController();
  final bodyTempController = TextEditingController();
  final roomTempController = TextEditingController();
  final roomHumidityController = TextEditingController();
  final patientStepsController = TextEditingController();

  String? PatientId, PatientName, BodyTemp,RoomTemperature,RoomHumidity, StepsCount;

  getPatientId(id) {
    PatientId = id;
  }

  getPatientName(patientName) {
    PatientName = patientName;
  }

  getPatientTemp(bodyTemp) {
    BodyTemp = bodyTemp;
  }

  getRoomTemp(roomTemp) {
    RoomTemperature = roomTemp;
  }

  getRoomHumidity(roomHumidity) {
    RoomHumidity = roomHumidity;
  }

  getStepsCount(stepsCounts) {
    StepsCount = stepsCounts;
  }

  createData() {
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection("My_Patients")
        .doc(PatientName);
    Map<String, dynamic> patientsList = {
      "Patient_ID": PatientId,
      "Patient_Name": PatientName,
      "Patient_Temp": BodyTemp,
      "Room_Temp": RoomTemperature,
      "Room_Humidity": RoomHumidity,
      "Steps_Counts": StepsCount,
    };
    documentReference.set(patientsList).whenComplete(() {
      print("$PatientName created");
    });
  }
  updateData() {
    print("Updated");
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection("My_Patients")
        .doc(PatientName);
    Map<String, dynamic> patientsList = {
      "Patient_ID": PatientId,
      "Patient_Name": PatientName,
      "Patient_Temp": BodyTemp,
      "Room_Temp": RoomTemperature,
      "Room_Humidity": RoomHumidity,
      "Steps_Counts": StepsCount,
    };
    documentReference.set(patientsList).whenComplete(() {
      print("$PatientName updated");
    });
  }

  deleteData() {
    DocumentReference documentReference = FirebaseFirestore.instance
        .collection("My_Patients")
        .doc(PatientName);
    documentReference.delete().whenComplete((){
      print("$PatientName deleted");
    });
  }

  void clearText() {
    patientIdController.clear();
    patientNameController .clear();
    bodyTempController .clear();
    roomTempController.clear();
    roomHumidityController.clear();
    patientStepsController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("Patient Records"),
        centerTitle: true,
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                    controller: patientIdController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        labelText: "Patient ID",
                        labelStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                          color: Colors.white,
                          width: 2,
                        ))),
                    onChanged: (String id) {
                      getPatientId(id);
                    }),
                const SizedBox(height: 20,),
                TextFormField(
                    controller: patientNameController,
                    decoration: const InputDecoration(
                        labelText: "Patient Name",
                        labelStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                          color: Colors.white,
                          width: 2,
                        ))),
                    onChanged: (String patientName) {
                      getPatientName(patientName);
                    }),
                const SizedBox(height: 20,),
                TextFormField(
                    controller: bodyTempController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        labelText: "Body Temperature",
                        labelStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                          color: Colors.white,
                          width: 2,
                        ))),
                    onChanged: (String bodyTemp) {
                      getPatientTemp(bodyTemp);
                    }),
                const SizedBox(height: 20,),
                TextFormField(
                    controller: roomTempController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        labelText: "Room Temperature",
                        labelStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            borderSide: BorderSide(
                          color: Colors.white,
                          width: 2,
                        ))),
                    onChanged: (String roomTemp) {
                      getRoomTemp(roomTemp);
                    }
                    ),
                const SizedBox(height: 20,),
                TextFormField(
                    controller: roomHumidityController,
                    keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: "Room Humidity",
                      labelStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 2,
                          ))),
                  onChanged: (String roomHumidity) {
                    getRoomHumidity(roomHumidity);
                  }
                ),
                const SizedBox(height: 20,),
                TextFormField(
                    controller: patientStepsController,
                    keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: "Steps Counts",
                      labelStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 2,
                          ))),
                  onChanged: (String stepsCounts) {
                    getStepsCount(stepsCounts);
                  }

                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      onPressed: () {
                        createData();
                      },
                      child: const Text(
                        "Create",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange,
                      ),
                      onPressed: () {
                        updateData();
                      },
                      child: const Text(
                        "Update",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                      ),
                      onPressed: () {
                        deleteData();
                      },
                      child: const Text(
                        "Delete",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                      ),
                      onPressed: () {
                        clearText();
                      },
                      child: const Text(
                        "Clear All",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
