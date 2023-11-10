import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_patient_monitoring_system/widgets/Button/rounded_button.dart';

import '../Drawer/Drawer.dart';

class PredicationScreen extends StatefulWidget {
  const PredicationScreen({super.key});
  @override
  State<PredicationScreen> createState() => _PredicationScreenState();
}

class _PredicationScreenState extends State<PredicationScreen> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController bodyTemperatureController =
  TextEditingController();
  final TextEditingController roomTemperatureController =
  TextEditingController();
  final TextEditingController roomHumidityController = TextEditingController();
  final TextEditingController patientStepsController = TextEditingController();

  void _showDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Column(
            children: [
              Image.asset("assets/images/Predication.png"),
              const SizedBox(height: 10,),
              const Text("Predication Result"),
              const SizedBox(height: 10,),
              const Text("Stress Level"),
              const SizedBox(height: 10,),
              const Text(
                "Normal",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, color: Colors.lightGreenAccent),
              ),
            ],
          ),
          actions: [
            MaterialButton(
              color: Colors.blue,
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: const Text("Predication"),
        centerTitle: true,
      ),
      body: Container(
        height: screenHeight*1,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              colors: [
                Colors.deepPurpleAccent,
                Colors.lightBlueAccent,
              ],
            )),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 10),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  const Text("Enter Patient's Reading Here \n to\n Predicate Results",textAlign:TextAlign.center,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                  const SizedBox(height: 20,),
                  TextFormField(
                    style: const TextStyle(fontSize: 24.0,fontFamily: 'Times New Roman',color: Colors.white),
                    keyboardType: TextInputType.number,
                    controller: bodyTemperatureController,
                    decoration: InputDecoration(
                        labelText: "Body Temperature",
                        labelStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        prefixIcon:
                        const Icon(Icons.health_and_safety_outlined),
                        prefixIconColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Set the border radius for focused state
                          borderSide: const BorderSide(
                              width: 4.0, color: Colors.grey),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Set the border radius for focused state
                          borderSide: const BorderSide(
                              width: 3.0, color: Colors.white),
                        )),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Body Temperature';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: const TextStyle(fontSize: 24.0,fontFamily: 'Times New Roman',color: Colors.white),
                    keyboardType: TextInputType.number,
                    controller: bodyTemperatureController,
                    decoration: InputDecoration(
                        labelText: "Room Temperature",
                        labelStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        prefixIcon:
                        const Icon(Icons.hot_tub),
                        prefixIconColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Set the border radius for focused state
                          borderSide: const BorderSide(
                              width: 4.0, color: Colors.grey),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Set the border radius for focused state
                          borderSide: const BorderSide(
                              width: 3.0, color: Colors.white),
                        )),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Room Temperature';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: const TextStyle(fontSize: 24.0,fontFamily: 'Times New Roman',color: Colors.white),
                    keyboardType: TextInputType.number,
                    controller: roomTemperatureController,
                    decoration: InputDecoration(
                        labelText: "Room Humidity",
                        labelStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        prefixIcon:
                        const Icon(Icons.severe_cold),
                        prefixIconColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Set the border radius for focused state
                          borderSide: const BorderSide(
                              width: 4.0, color: Colors.grey),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Set the border radius for focused state
                          borderSide: const BorderSide(
                              width: 3.0, color: Colors.white),
                        )),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter Room Humidity';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    style: const TextStyle(fontSize: 24.0,fontFamily: 'Times New Roman',color: Colors.white),
                    keyboardType: TextInputType.number,
                    controller: patientStepsController,
                    decoration: InputDecoration(
                        labelText: "Patient's Steps",
                        labelStyle: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        prefixIcon:
                        const Icon(Icons.add_chart),
                        prefixIconColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.circular(10.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Set the border radius for focused state
                          borderSide: const BorderSide(
                              width: 4.0, color: Colors.grey),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              10.0), // Set the border radius for focused state
                          borderSide: const BorderSide(
                              width: 3.0, color: Colors.white),
                        )),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter Patient's Steps";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      RoundButton(
                        title: 'Predication',
                        onTap:  (){
                          if (_formKey.currentState!.validate()) {
                            _showDialog();
                          }
                        },
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
