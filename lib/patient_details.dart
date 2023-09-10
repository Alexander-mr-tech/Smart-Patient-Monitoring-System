// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:smart_patient_monitoring_system/widgets/Drawer/Drawer.dart';
//
// class patient_details extends StatefulWidget {
//   const patient_details({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<patient_details> createState() => _patient_detailsState();
// }
//
// class _patient_detailsState extends State<patient_details> {
//
//   String? PatientId, PatientName, BodyTemp;
//   double? StudentGpa;
//
//   getStudentId(id) {
//     PatientId =id;
//   }
//
//   getStudentName(patient_name) {
//     PatientName = patient_name;
//   }
//
//   getStudyProgram(body_temp) {
//     BodyTemp = body_temp;
//   }
//
//   getStudentGpa(gpa) {
//     StudentGpa = double.parse(gpa);
//   }
//
//   createData() {
//     DocumentReference documentReference =
//         FirebaseFirestore.instance.collection("MyStudents").doc("Patient_Records");
//
//     Map<String,dynamic> students={
//       "Patient_ID" : PatientId,
//       "Patient_Name" : PatientName,
//       "Patient_Temp" : BodyTemp,
//       "Patient_ECG" : EcgReading,
//       "Patient_Heart_Beat" : HeartBeat,
//       "Patient_Pluse_Rate" : PluseReading,
//       "Date" : DateTime.now(),
//     };
//     documentReference.set(students).whenComplete((){
//       print("$PatientName created");
//     });
//   }
//
//   readData() {
//     print("Read");
//   }
//
//   updateData() {
//     print("Updated");
//   }
//
//   deleteData() {
//     print("Deleted");
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: const MyDrawer(),
//       appBar: AppBar(
//         title: Text(widget.title),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.only(bottom: 8.0),
//               child: TextFormField(
//                   decoration: const InputDecoration(
//                       labelText: "Patient ID",
//                       fillColor: Colors.white,
//                       focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                         color: Colors.blue,
//                         width: 2,
//                       ))),
//                   onChanged: (String id) {
//                     getStudentId(id);
//                   }),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(bottom: 8.0),
//               child: TextFormField(
//                   decoration: const InputDecoration(
//                       labelText: "Patient Name",
//                       fillColor: Colors.white,
//                       focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                         color: Colors.blue,
//                         width: 2,
//                       ))),
//                   onChanged: (String student_name) {
//                     getStudentName(student_name);
//                   }),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(bottom: 8.0),
//               child: TextFormField(
//                   decoration: const InputDecoration(
//                       labelText: "Body Temperature",
//                       fillColor: Colors.white,
//                       focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                         color: Colors.blue,
//                         width: 2,
//                       ))),
//                   onChanged: (String study_program) {
//                     getStudyProgram(study_program);
//                   }),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(bottom: 8.0),
//               child: TextFormField(
//                   decoration: const InputDecoration(
//                       labelText: "GPA",
//                       fillColor: Colors.white,
//                       focusedBorder: OutlineInputBorder(
//                           borderSide: BorderSide(
//                         color: Colors.blue,
//                         width: 2,
//                       ))),
//                   onChanged: (String gpa) {
//                     getStudentGpa(gpa);
//                   }),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.green,
//                   ),
//                   onPressed: () {
//                     createData();
//                   },
//                   child: const Text(
//                     "Create",
//                     style: TextStyle(
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.blue,
//                   ),
//                   onPressed: () {
//                     readData();
//                   },
//                   child: const Text(
//                     "Read",
//                     style: TextStyle(
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.orange,
//                   ),
//                   onPressed: () {
//                     updateData();
//                   },
//                   child: const Text(
//                     "Update",
//                     style: TextStyle(
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.redAccent,
//                   ),
//                   onPressed: () {
//                     deleteData();
//                   },
//                   child: const Text(
//                     "Delete",
//                     style: TextStyle(
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
