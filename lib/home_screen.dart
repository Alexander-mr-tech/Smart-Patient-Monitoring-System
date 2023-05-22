import 'package:flutter/material.dart';
import 'package:smart_patient_monitoring_system/drawer.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(),
      appBar: AppBar(
        title: const Text("Home Screen"),
        centerTitle: true,
      ),
    );
  }
}
