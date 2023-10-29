import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';

import '../Drawer/Drawer.dart';


class Contact_Us extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
          appBar: AppBar(
            title: const Text("Contact Us"),
            centerTitle: true,
          ),
          bottomNavigationBar: ContactUsBottomAppBar(
            companyName: 'Noman & Shehryar',
            textColor: Colors.white,
            backgroundColor: Colors.teal.shade300,
            email: 'patientmoniteringsystem@gmail.com',
            // textFont: 'Sail',
          ),
          body: Container(
            height: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.deepPurpleAccent,
                    Colors.cyan,
                  ],
                )),
            child: ContactUs(
                cardColor: Colors.white,
                textColor: Colors.teal.shade900,
                logo: const AssetImage('assets/images/patientfever.jpg',),
                email: 'monitoringsystempatient@gmail.com',
                companyName: 'Smart Patient Monitoring System',
                companyFontSize: 24.0,
                companyColor: Colors.teal.shade100,
                dividerThickness: 3,
                phoneNumber: '+92 3165969815',
                website: 'https://pims.gov.pk/',
                tagLine: '',
                taglineColor: Colors.blue,
                twitterHandle: '',
                instagram: '',
                facebookHandle: ''),
          ),
      );
  }
}