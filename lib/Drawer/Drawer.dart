import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_patient_monitoring_system/Home%20Screen/home_screen.dart';
import 'package:smart_patient_monitoring_system/Patient%20History/patient_history.dart';
import 'package:smart_patient_monitoring_system/Predication%20Screen/predication_screen.dart';
import '../Contact Us/contactus.dart';
import '../Email Auth/SignIn.dart';
import '../Patient Records/patient_records.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {

  final auth = FirebaseAuth.instance;
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) => Drawer(
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          buildHeader(context),
          buildMenuItems(context),
        ],
      ),
    ),
  );
}
@override
Widget buildHeader(BuildContext context) => Container(
  decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Colors.deepPurpleAccent,
          Colors.cyan,
        ],
      )),
  width: double.infinity,
  padding: EdgeInsets.only(
    top: 10 + MediaQuery.of(context).padding.top,
    bottom: 10 + MediaQuery.of(context).padding.bottom,
  ),
  child: const Column(
    children: [
      CircleAvatar(
        radius: 70,
        backgroundColor: Colors.blue,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 67,
          backgroundImage: AssetImage('assets/images/Profile Image.png'),
        ),
      ),
      SizedBox(
        height: 12,
      ),
      Text(
        "S P M S",
        style: TextStyle(fontSize: 28, color: Colors.white),
      ),
      SizedBox(
        height: 4,
      ),
      Text(
        "monitoringsystempatient@gmaill.com",textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16, color: Colors.white),
      ),
    ],
  ),
);
Widget buildMenuItems(BuildContext context) => Container(
  decoration: const BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          Colors.deepPurpleAccent,
          Colors.cyan,
        ],
      )),
  child: Padding(
    padding: const EdgeInsets.all(10.0),
    child: Column(
      // runSpacing: 10,
      children: [
        ListTile(
          // contentPadding: const EdgeInsets.only(left: 10.0),
          leading: const Icon(
            Icons.home,
            color: Colors.white,
            size: 30,
          ),
          title: const Text(
            'Home',
            style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
          onTap: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const HomeScreen())),
        ),
        const Divider(
          color: Colors.blue,
          thickness: 2,
        ),
        ListTile(
          // contentPadding: const EdgeInsets.only(left: 10.0),
          leading: const Icon(
            Icons.details,
            color: Colors.white,
            size: 30,
          ),
          title: const Text(
            "Patient's Details",
            style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
          onTap: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const PatientRecord())),
        ),
        const Divider(
          color: Colors.blue,
          thickness: 2,
        ),
        ListTile(
          leading: const Icon(Icons.add_chart,
              color: Colors.white, size: 30),
          title: const Text(
            "Patient's History",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const patient_history())),
        ),
        const Divider(
          color: Colors.blue,
          thickness: 2,
        ),
        ListTile(
          leading: const Icon(Icons.precision_manufacturing,
              color: Colors.white, size: 30),
          title: const Text(
            "Predication",
            style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
          onTap: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const predication_screen())),
        ),
        const Divider(
          color: Colors.blue,
          thickness: 2,
        ),
        ListTile(
          leading: const Icon(Icons.contact_mail,
              color: Colors.white, size: 30),
          title: const Text(
            "About Us",
            style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
          onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Contact_Us())),
        ),
        const Divider(
          color: Colors.blue,
          thickness: 2,
        ),
        ListTile(
          leading: const Icon(Icons.logout,
              color: Colors.white, size: 30),
          title: const Text(
            "Logout",
            style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
          onTap:() async{
            await FirebaseAuth.instance.signOut();
            Navigator.popUntil(context, (route) => route.isFirst);
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => const Signin()));
          }
        ),
      ],
    ),
  ),
);
