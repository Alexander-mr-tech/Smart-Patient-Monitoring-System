import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({
    Key? key,
  }) : super(key: key);
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

Widget buildHeader(BuildContext context) => Material(
  color: Colors.indigo,
  child: Container(
    width: double.infinity,
    padding: EdgeInsets.only(
      top: 24 + MediaQuery.of(context).padding.top,
      bottom: 24,
    ),
    child: const Column(
      children: [
        CircleAvatar(
          radius: 80,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 77,
            backgroundImage: AssetImage('assets/images/Logo.png'),
          ),
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          "SEPSMM",
          style: TextStyle(fontSize: 28, color: Colors.white),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          "sepsmm@gmaill.com",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ],
    ),
  ),
);
Widget buildMenuItems(BuildContext context) => Container(
  padding: const EdgeInsets.all(10),
  child: const Wrap(
    // runSpacing: 10,
    children: [
      ListTile(
        // contentPadding: const EdgeInsets.only(left: 10.0),
        leading: Icon(
          Icons.home,
          color: Colors.indigo,
          size: 30,
        ),
        title: Text(
          'Home',
          style: TextStyle(
              color: Colors.blue,
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        // onTap: () => Navigator.of(context).pushReplacement(
        //     MaterialPageRoute(builder: (context) => const HomeScreen())),
      ),
      Divider(
        color: Colors.blue,
        thickness: 2,
      ),
      ListTile(
        // contentPadding: const EdgeInsets.only(left: 10.0),
        leading: Icon(
          Icons.settings_remote,
          color: Colors.indigo,
          size: 30,
        ),
        title: Text(
          'Devices Control',
          style: TextStyle(
              color: Colors.blue,
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        // onTap: () => Navigator.of(context).pushReplacement(
        //     MaterialPageRoute(builder: (context) => const DeviceControl())),
      ),
      Divider(
        color: Colors.blue,
        thickness: 2,
      ),
      ListTile(
        leading: Icon(Icons.calculate_outlined,
            color: Colors.indigo, size: 30),
        title: Text(
          "Measuring Units",
          style: TextStyle(
            color: Colors.blue,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        // onTap: () => Navigator.of(context).pushReplacement(
        //     MaterialPageRoute(builder: (context) => units_measurements())),
      ),
      Divider(
        color: Colors.blue,
        thickness: 2,
      ),
      ListTile(
        leading: Icon(Icons.electrical_services,
            color: Colors.indigo, size: 30),
        title: Text(
          "Ohm's Law",
          style: TextStyle(
              color: Colors.blue,
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        // onTap: () => Navigator.of(context)
        //     .push(MaterialPageRoute(builder: (context) => const OhmLaw())),
      ),
      Divider(
        color: Colors.blue,
        thickness: 2,
      ),
      ListTile(
        leading: Icon(Icons.calculate,
            color: Colors.indigo, size: 30),
        title: Text(
          "Calculate Bills",
          style: TextStyle(
              color: Colors.blue,
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        // onTap: () => Navigator.of(context).push(MaterialPageRoute(
        //     builder: (context) => BillCalculatorScreen())),
      ),
      Divider(
        color: Colors.blue,
        thickness: 2,
      ),
      ListTile(
        leading: Icon(Icons.contact_mail,
            color: Colors.indigo, size: 30),
        title: Text(
          "About Us",
          style: TextStyle(
              color: Colors.blue,
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
        // onTap: () => Navigator.of(context)
        //     .push(MaterialPageRoute(builder: (context) => const AboutUs())),
      ),
    ],
  ),
);
