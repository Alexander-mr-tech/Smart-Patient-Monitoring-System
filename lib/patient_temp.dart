import 'package:flutter/material.dart';
import 'package:d_chart/d_chart.dart';
import 'package:smart_patient_monitoring_system/widgets/Drawer/Drawer.dart';
class Patient_Temp extends StatefulWidget {
  const Patient_Temp({Key? key}) : super(key: key);

  @override
  State<Patient_Temp> createState() => _Patient_TempState();
}

class _Patient_TempState extends State<Patient_Temp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildHeader(context),
              buildMenuItems(context),
            ],
          ),
        ),
      ),
      body: Container(
        color: Colors.grey,
        child: DChartGauge(
          data: const [
            {'domain': 'Off', 'measure': 30},
            {'domain': 'Warm', 'measure': 30},
            {'domain': 'Hot', 'measure': 30},
          ],
          fillColor: (pieData, index) {
            switch (pieData['domain']) {
              case 'Off':
                return Colors.green;
              case 'Warm':
                return Colors.orange;
              default:
                return Colors.red;
            }
          },
          showLabelLine: false,
          pieLabel: (pieData, index) {
            return "${pieData['domain']}";
          },
          labelPosition: PieLabelPosition.inside,
          labelPadding: 0,
          labelColor: Colors.white,
        ),
      ),
    );
  }
}