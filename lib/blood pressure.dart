import 'package:flutter/material.dart';
import 'package:smart_patient_monitoring_system/drawer.dart';
import 'package:d_chart/d_chart.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: DChartBarCustom(
              showDomainLine: true,
              showMeasureLine: true,
              showDomainLabel: true,
              showMeasureLabel: true,
              spaceBetweenItem: 8,
              listData: [
                DChartBarDataCustom(
                  value: 13,
                  label: 'Jan',
                  color: Colors.blue,
                ),
                DChartBarDataCustom(value: 20, label: 'Feb'),
                DChartBarDataCustom(value: 30, label: 'Mar'),
                DChartBarDataCustom(value: 40, label: 'Apr'),
                DChartBarDataCustom(value: 25, label: 'Mei'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
