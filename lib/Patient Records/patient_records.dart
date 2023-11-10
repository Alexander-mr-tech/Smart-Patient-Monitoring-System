import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import '../Drawer/Drawer.dart';
import '../widgets/Button/rounded_button.dart';

class PatientRecord extends StatefulWidget {
  const PatientRecord({Key? key}) : super(key: key);

  @override
  State<PatientRecord> createState() => _PatientRecordState();
}

class _PatientRecordState extends State<PatientRecord> {
  String? _selectedGender;
  bool loading = false;

  final user = FirebaseAuth.instance.currentUser!;
  final _auth = FirebaseAuth.instance;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController genderController = TextEditingController();

  final DatabaseReference ref = FirebaseDatabase.instance.ref("All Parameters");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Records Save"),
        centerTitle: true,
      ),
      drawer: const MyDrawer(),
      body: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.white60,
              Colors.cyan,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:10.0),
            child: Center(
              child: Column(
                children: [
                  StreamBuilder(
                      stream: ref.onValue,
                      builder:
                          (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else {
                          Map<dynamic, dynamic> map =
                              snapshot.data!.snapshot.value as dynamic;
                          List<dynamic> list =
                              List.from(map.values, growable: true);
                          // print(list);
                          list.clear();
                          list = map.values.toList();
                          var roomtemp = list[0]['Temperature'].toString();
                          var roomhum = list[0]['Humidity'].toString();
                          var bodytemp = list[1]['Body Temperature'].toString();
                          var stress = list[2]['Stress'].toString();
                          var steps = list[3]['Steps'].toString();
                          return Column(
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.blue, width: 5.0)),
                                child: Center(
                                  child: Text(
                                    "Store Data to FireStore".toUpperCase(),
                                    style: const TextStyle(
                                        fontFamily: 'Times New Roman',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                        color: Colors.red),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: nameController,
                                style: const TextStyle(
                                    fontSize: 30.0,
                                    fontFamily: 'Times New Roman',
                                    color: Colors.black),
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 14.0),
                                    hintText: "Enter Your Name",
                                    hintStyle: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Times New Roman',
                                        color: Colors.black26,
                                        fontSize: 24),
                                    prefixIcon: const Icon(
                                      Icons.person,
                                      size: 30,
                                    ),
                                    prefixIconColor: Colors.black,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: const BorderSide(
                                          width: 2.0, color: Colors.black),
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
                                          width: 4.0, color: Colors.blueAccent),
                                    )),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                controller: ageController,
                                style: const TextStyle(
                                    fontSize: 30.0,
                                    fontFamily: 'Times New Roman',
                                    color: Colors.black),
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 14.0),
                                    hintText: "Age",
                                    hintStyle: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Times New Roman',
                                        color: Colors.black26,
                                        fontSize: 24),
                                    prefixIcon: const Icon(
                                      Icons.date_range,
                                      size: 30,
                                    ),
                                    prefixIconColor: Colors.black,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: const BorderSide(
                                          width: 2.0, color: Colors.black),
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
                                          width: 4.0, color: Colors.blueAccent),
                                    )),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.blueAccent, width: 4),
                                    borderRadius: BorderRadius.circular(08)),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButtonFormField<String>(
                                    alignment: Alignment.center,
                                    dropdownColor: Colors.blueAccent,
                                    iconSize: 36,
                                    style: const TextStyle(
                                        fontSize: 24.0,
                                        fontFamily: 'Times New Roman',
                                        color: Colors.white),
                                    value: _selectedGender,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedGender = value;
                                      });
                                    },
                                    items: ['Male', 'Female']
                                        .map<DropdownMenuItem<String>>(
                                          (String value) =>
                                              DropdownMenuItem<String>(
                                            value: value,
                                            child: Center(child: Text(value)),
                                          ),
                                        )
                                        .toList(),
                                    decoration: const InputDecoration(
                                      labelStyle: TextStyle(
                                          fontSize: 24.0,
                                          fontFamily: 'Times New Roman',
                                          color: Colors.white),
                                      hintText: 'Select your gender',
                                      hintStyle: TextStyle(
                                          fontSize: 24.0,
                                          fontFamily: 'Times New Roman',
                                          color: Colors.grey),
                                      prefixIcon: Icon(Icons.person),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please select your gender';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: const EdgeInsets.all(14),
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.blue, // Border color
                                    width: 4.0,
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.person,
                                      size: 30,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Body Temerature = $bodytemp",
                                      style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: const EdgeInsets.all(14),
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.blue, // Border color
                                    width: 4.0,
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.hot_tub,
                                      size: 30,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Room Temperature = $roomtemp",
                                      style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.blue, // Border color
                                    width: 4.0,
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.ac_unit_rounded,
                                      size: 30,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Room Humidity = $roomhum",
                                      style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.blue, // Border color
                                    width: 4.0,
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.stacked_bar_chart_outlined,
                                      size: 30,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Total Steps Counts = $steps",
                                      style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.blue, // Border color
                                    width: 4.0,
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.stream,
                                      size: 30,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Stress Level = $stress",
                                      style: const TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              RoundButton(
                                title: 'Store Records',
                                loading: loading,
                                onTap: () async {
                                  setState(() {
                                    loading = true;
                                  });
                                  String Name = nameController.text;
                                  String StringAge = ageController.text.trim();
                                  int Age = int.parse(StringAge);
                                  String Gender = _selectedGender.toString();
                                  String BodyTemperature = bodytemp;
                                  String RoomTemperature = roomtemp;
                                  String Roomhumidity = roomhum;
                                  String Steps = steps;
                                  String Stress = stress;
                                  final User? user = _auth.currentUser;
                                  FirebaseFirestore firestore = FirebaseFirestore.instance;
                                  if (user != null) {
                                    final userUID = user.uid;
                                    final userDocRef = firestore.collection('Patients Records').doc(userUID);
                                    final currentData = {
                                      'Name':Name,
                                      'Age': Age,
                                      'Body_Temperature': BodyTemperature,
                                      'Gender': Gender,
                                      'Room_Temperature': RoomTemperature,
                                      'Room_humidity': Roomhumidity,
                                      'Steps': Steps,
                                      'Stress': Stress,
                                      'Timestamp': FieldValue.serverTimestamp(),
                                    };
                                    await userDocRef.set(currentData);
                                    final historicalDataCollectionRef = firestore.collection('Patient History').doc(userUID).collection('Records');
                                    final historicalData = {
                                      'Name':Name,
                                      'Age': Age,
                                      'Body_Temperature': BodyTemperature,
                                      'Gender': Gender,
                                      'Room_Temperature': RoomTemperature,
                                      'Room_humidity': Roomhumidity,
                                      'Steps': Steps,
                                      'Stress': Stress,
                                      'Timestamp': FieldValue.serverTimestamp(),
                                    };
                                    await historicalDataCollectionRef.add(historicalData);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Center(child: Text('Data saved successfully!'))),
                                    );
                                    nameController.clear();
                                    ageController.clear();
                                    genderController.clear();
                                  }
                                  setState(() {
                                    loading = false;
                                  });

                                },
                              )
                            ],
                          );
                        }
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// reference.doc(user!.uid).set(
// {
// 'Age':Age,
// 'Gender':Gender,
// 'Body_Temperature':BodyTemperature,
// 'Room_Temperature':RoomTemperature,
// 'Room_humidity':Roomhumidity,
// 'Steps':Steps,
// 'Stress':Stress,
// 'Timestamp': FieldValue.serverTimestamp(),
// }
