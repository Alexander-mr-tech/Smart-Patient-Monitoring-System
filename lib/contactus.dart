import 'package:contactus/contactus.dart';
import 'package:flutter/material.dart';
import 'package:smart_patient_monitoring_system/drawer.dart';

class Contact_Us extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Contact Us'),
          ),
          bottomNavigationBar: ContactUsBottomAppBar(
            companyName: 'Noman & Shehryar',
            textColor: Colors.white,
            backgroundColor: Colors.teal.shade300,
            email: 'patientmoniteringsystem@gmail.com',
            // textFont: 'Sail',
          ),
          backgroundColor: Colors.blue,
          body: ContactUs(
              cardColor: Colors.white,
              textColor: Colors.teal.shade900,
              logo: const AssetImage('assets/images/Contactuslogo.png',),
              email: 'monitoringsystempatient@gmail.com',
              companyName: 'Smart Patient Monitoring',
              companyFontSize: 24.0,
              companyColor: Colors.teal.shade100,
              dividerThickness: 3,
              phoneNumber: '+92 3165969815',
              website: 'https://pims.gov.pk/',
              tagLine: 'Smart Patient Monitoring System',
              taglineColor: Colors.blue,
              twitterHandle: '',
              instagram: '',
              facebookHandle: ''),
          drawer: const MyDrawer()
      );
  }
}