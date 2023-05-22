import 'package:flutter/material.dart';
import 'package:smart_patient_monitoring_system/drawer.dart';
class Ecg_Screen extends StatefulWidget {
  const Ecg_Screen({Key? key}) : super(key: key);

  @override
  State<Ecg_Screen> createState() => _Ecg_ScreenState();
}

class _Ecg_ScreenState extends State<Ecg_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: const Text("ECG Status"),
        centerTitle: true,
      ),
    );
  }
}
