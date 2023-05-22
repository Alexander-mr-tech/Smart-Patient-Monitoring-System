import 'package:flutter/material.dart';
import 'package:smart_patient_monitoring_system/drawer.dart';
class Patient_Temp extends StatefulWidget {
  const Patient_Temp({Key? key}) : super(key: key);

  @override
  State<Patient_Temp> createState() => _Patient_TempState();
}

class _Patient_TempState extends State<Patient_Temp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: const Text("Patient Temperature"),
        centerTitle: true,
      ),
    );
  }
}