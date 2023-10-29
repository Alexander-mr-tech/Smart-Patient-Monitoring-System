import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_patient_monitoring_system/widgets/Button/rounded_button.dart';

import '../Drawer/Drawer.dart';

class predication_screen extends StatefulWidget {
  const predication_screen({super.key});
  @override
  State<predication_screen> createState() => _predication_screenState();
}

class _predication_screenState extends State<predication_screen> {
  void _showDialog(){
    showDialog(context: context, builder: (context){
      return CupertinoAlertDialog(
        title: Column(
          children: [
            Image.asset("assets/images/Predication.png"),
            const SizedBox(height: 10,),
            const Text("Predication Result"),
            const SizedBox(height: 10,),
            const Text("Stress Level"),
            const SizedBox(height: 10,),
            const Text("Normal",textAlign: TextAlign.center,style: TextStyle(fontSize: 24,color: Colors.lightGreenAccent),),
            // const Text("Title"),
          ],
        ),
        // content: const Text("Content, more info"),
        actions: [
          MaterialButton(
            color: Colors.blue,
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => const predication_screen()));

            },
            child: const Text("Close"),
          ),
        ],
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: AppBar(
        title: const Text("Predication"),
        centerTitle: true,
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20),
            child: Column(
              children: <Widget>[
                const Text("Enter Patient's Reading Here \n to\n Predicate Results",textAlign:TextAlign.center,style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                const SizedBox(height: 20,),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Body Temperature",
                      labelStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 2,
                          ))),
                  // onChanged: (String gpa) {
                  //   getStudentGpa(gpa);
                  // }
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Room Temperature",
                      labelStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 2,
                          ))),
                  // onChanged: (String gpa) {
                  //   getStudentGpa(gpa);
                  // }
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Room Humidity",
                      labelStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 2,
                          ))),
                  // onChanged: (String gpa) {
                  //   getStudentGpa(gpa);
                  // }
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Patient Steps",
                      labelStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 2,
                          ))),
                  // onChanged: (String gpa) {
                  //   getStudentGpa(gpa);
                  // }
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RoundButton(
                      title: 'Predication',
                      onTap: _showDialog,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
