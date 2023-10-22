import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Drawer/Drawer.dart';

class PatientRecord extends StatefulWidget {
  const PatientRecord({Key? key}) : super(key: key);

  @override
  State<PatientRecord> createState() => _PatientRecordState();
}

class _PatientRecordState extends State<PatientRecord> {

  String? _selectedGender;

  final user = FirebaseAuth.instance.currentUser!;
  final auth = FirebaseAuth.instance;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  final TextEditingController roomTempController = TextEditingController();
  final TextEditingController roomhumController = TextEditingController();
  final TextEditingController stepsController = TextEditingController();

  final DatabaseReference ref = FirebaseDatabase.instance.ref("All Parameters");

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void upload()async{

    String Name = nameController.text.trim();
    String StringAge = ageController.text.trim();
    int Age = int.parse(StringAge);
    String Gender = _selectedGender.toString();
    String BodyTemperature = bodyController.text.toString();
    String RoomTemperature = roomTempController.text.toString();
    String Roomhumidity = roomTempController.text.toString();
    String Steps = stepsController.text.toString();
    // String Stress= stressController.toString();
    print("Selected gender is : " + Gender);
    DocumentReference reference = await FirebaseFirestore.instance.collection("Patients Records").doc(Name);
    reference.set(
        {
          'Name':Name,
          'Age':Age,
          'Gender':Gender,
          'BodyTemperature':BodyTemperature,
          'RoomTemperature':RoomTemperature,
          'Roomhumidity':Roomhumidity,
          'Steps':Steps,
          'Stress':"High",
        }
    );
    nameController.clear();
    ageController.clear();
    bodyController.clear();
    roomTempController.clear();
    roomhumController.clear();
    stepsController.clear();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Records Save"),
        centerTitle: true,
      ),
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
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.white,
            Colors.blue.shade100,
            Colors.white,
          ],
        )),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Column(
                children: [
                  StreamBuilder(
                      stream: ref.onValue,
                      builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
                        if (!snapshot.hasData) {
                          return const Center(child: CircularProgressIndicator());
                        } else {
                          Map<dynamic, dynamic> map =
                              snapshot.data!.snapshot.value as dynamic;
                          List<dynamic> list =
                              List.from(map.values, growable: true);
                          list.clear();
                          list = map.values.toList();
                          print(list);
                          var roomtemp= list[0]['Temperature'].toString();
                          var roomhum= list[0]['Humidity'].toString();
                          var bodytemp= list[1]['Body Temperature'].toString();
                          var steps= list[2]['Steps'].toString();
                          print("Room temp " + roomtemp);
                          print("Room Humidity " + roomhum);
                          print("Body  temp " + bodytemp);
                          print("steps " + steps);
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
                                controller :ageController,
                                style: const TextStyle(
                                    fontSize: 30.0,
                                    fontFamily: 'Times New Roman',
                                    color: Colors.black),
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
                                    hintText: "Age",
                                    hintStyle: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Times New Roman',
                                        color: Colors.black26,
                                        fontSize: 24),
                                    prefixIcon: const Icon(Icons.date_range,size: 30,),
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
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: const EdgeInsets.all(14),
                                height:60,
                                decoration: BoxDecoration(
                                  color:Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.blue, // Border color
                                    width: 4.0,
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.person,size: 30,),
                                    const SizedBox(width: 10,),
                                    Text("Body Temerature = $bodytemp",style: const TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: const EdgeInsets.all(14),
                                height:60,
                                decoration: BoxDecoration(
                                  color:Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.blue, // Border color
                                    width: 4.0,
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.hot_tub,size: 30,),
                                    const SizedBox(width: 10,),
                                    Text("Room Temperature = $roomtemp",style: const TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                height:60,
                                decoration: BoxDecoration(
                                  color:Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.blue, // Border color
                                    width: 4.0,
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.ac_unit_rounded,size: 30,),
                                    const SizedBox(width: 10,),
                                    Text("Room Humidity = $roomhum" ,style: const TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                height:60,
                                decoration: BoxDecoration(
                                  color:Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.blue, // Border color
                                    width: 4.0,
                                  ),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.stacked_bar_chart_outlined,size: 30,),
                                    const SizedBox(width: 10,),
                                    Text("Total Steps Counts = $steps",style: const TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10,),
                              Container(
                                padding: const EdgeInsets.all(10),
                                height:60,
                                decoration: BoxDecoration(
                                  color:Colors.transparent,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.blue, // Border color
                                    width: 4.0,
                                  ),
                                ),
                                child: const Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.stream,size: 30,),
                                    SizedBox(width: 10,),
                                    Text("Stress Level = HIGH",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10,),
                              TextButton(onPressed:  (){}, child: const Text("Upload",style: TextStyle(fontSize: 24),),)
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
