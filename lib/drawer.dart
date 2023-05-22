import 'package:flutter/material.dart';
import 'package:smart_patient_monitoring_system/blood%20pressure.dart';
import 'package:smart_patient_monitoring_system/contactus.dart';
import 'package:smart_patient_monitoring_system/ecg_screen.dart';
import 'package:smart_patient_monitoring_system/home_screen.dart';
import 'package:smart_patient_monitoring_system/patient_temp.dart';
import 'package:smart_patient_monitoring_system/sign_in_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text("Noman Nadeem"),
            accountEmail: Text("19690@student.riphah.edu.pk"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.orange,
              child: Text(
                "N",
                style: TextStyle(fontSize: 50.0),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Home", style: TextStyle(fontSize: 20.0)),
            onTap: () {
              _navigateToHomeScreen(context);
            },
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
            leading: const Icon(Icons.heat_pump),
            title: const Text("Patient Temperature Readings",
                style: TextStyle(fontSize: 20.0)),
            onTap: () {
              _navigateToTemp(context);
            },
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
            leading: const Icon(Icons.window_sharp),
            title: const Text("Blood Pressure Charts",
                style: TextStyle(fontSize: 20.0)),
            onTap: () {
              _navigateToBlood(context);
            },
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
            leading: const Icon(Icons.accessibility),
            title: const Text("ECG Readings", style: TextStyle(fontSize: 20.0)),
            onTap: () {
              _navigateToEcg(context);
            },
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
            leading: const Icon(Icons.contacts),
            title: const Text("Contact Us", style: TextStyle(fontSize: 20.0)),
            onTap: () {
              _navigateToContact_Us(context);
            },
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text("Logout", style: TextStyle(fontSize: 20.0)),
            onTap: () {
              _navigateToLogOut_Screen(context);
            },
          ),
          const Divider(
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}

void _navigateToHomeScreen(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const HomeScreen()));
}

void _navigateToEcg(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const Ecg_Screen()));
}

void _navigateToTemp(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const Patient_Temp()));
}

void _navigateToBlood(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const Blood_Pressure()));
}

void _navigateToContact_Us(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => Contact_Us()));
}

void _navigateToLogOut_Screen(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const SignInScreen()));
}
