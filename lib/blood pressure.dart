import 'package:flutter/material.dart';
import 'package:smart_patient_monitoring_system/drawer.dart';
class Blood_Pressure extends StatefulWidget {
  const Blood_Pressure({Key? key}) : super(key: key);

  @override
  State<Blood_Pressure> createState() => _Blood_PressureState();
}

class _Blood_PressureState extends State<Blood_Pressure> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: const Text("Blood Pressure Screen"),
        centerTitle: true,
      ),
    );
  }
}
