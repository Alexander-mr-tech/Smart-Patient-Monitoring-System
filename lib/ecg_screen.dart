import 'package:flutter/material.dart';
import 'package:smart_patient_monitoring_system/drawer.dart';
import 'package:d_chart/d_chart.dart';
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
      body: DChartLine(
        data: [
          {
            'id': 'Line',
            'data': [
              {'domain': 0, 'measure': -50},
              {'domain': 2, 'measure': 4},
              {'domain': 3, 'measure': 6},
              {'domain': 100, 'measure': 1},
            ],
          },
        ],
        lineColor: (lineData, index, id) => Colors.amber,
      ),
    );
  }
}
