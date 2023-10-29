import 'package:flutter/material.dart';
import '../Drawer/Drawer.dart';

class Patient_Temp extends StatefulWidget {
  const Patient_Temp({Key? key}) : super(key: key);

  @override
  State<Patient_Temp> createState() => _Patient_TempState();
}

class _Patient_TempState extends State<Patient_Temp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Patient Temperature"),
          centerTitle: true,
        ),
        drawer: const MyDrawer(),
        body: Container(
          // width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.deepPurpleAccent,
                  Colors.cyan,
                ],
              )),
          child: Column(
            children: [
              Container(
                color: Colors.red,
                child: Image.asset(
                  'assets/images/BodyTemp.png',
                    height: 100,
                    width: 400,
                  fit: BoxFit.contain
                ),
              ),
              const SizedBox(height: 10),
              const Text('Body Temperature \n Current Value',textAlign: TextAlign.center,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
              const SizedBox(height: 10),
              const CircleAvatar(
                radius: 80,
                backgroundColor: Colors.white,
                child: CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  radius: 77,
                  child: Center(child: Text("97.7 \n F",textAlign: TextAlign.center,style: TextStyle(fontSize: 36,fontWeight: FontWeight.bold,color: Colors.red),)),
                ),
              ),
              const SizedBox(height: 30,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 60,
                    width: 170,
                    decoration: BoxDecoration(
                      color:Colors.lightBlue,
                      border: Border.all(color: Colors.lightGreenAccent,width: 2),
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(20))
                    ),
                    child: const Center(child: Text("Status",style: TextStyle(color: Colors.black,fontSize: 30),)),
                  ),
                  Container(
                    height: 60,
                    width: 170,
                    decoration: BoxDecoration(
                        color:Colors.lightBlue,
                        border: Border.all(color: Colors.lightGreenAccent,width: 2),
                        borderRadius: const BorderRadius.only(topRight: Radius.circular(20))
                    ),
                    child: const Center(child: Text("Readings",style: TextStyle(color: Colors.black,fontSize: 30),)),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 60,
                    width: 170,
                    decoration: BoxDecoration(
                        color:Colors.lightGreen,
                        border: Border.all(color: Colors.lightGreenAccent,width: 2),
                    ),
                    child: const Center(child: Text("Normal",style: TextStyle(color: Colors.black,fontSize: 30),)),
                  ),
                  Container(
                    height: 60,
                    width: 170,
                    decoration: BoxDecoration(
                      color:Colors.white,
                      border: Border.all(color: Colors.lightGreenAccent,width: 2),
                    ),
                    child: const Center(child: Text("97.7 - 99.5 F",style: TextStyle(color: Colors.black,fontSize: 30),)),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 60,
                    width: 170,
                    decoration: BoxDecoration(
                      color:Colors.pinkAccent,
                      border: Border.all(color: Colors.lightGreenAccent,width: 2),
                    ),
                    child: const Center(child: Text("Low Fever",style: TextStyle(color: Colors.black,fontSize: 30),)),
                  ),
                  Container(
                    height: 60,
                    width: 170,
                    decoration: BoxDecoration(
                      color:Colors.white,
                      border: Border.all(color: Colors.lightGreenAccent,width: 2),
                    ),
                    child: const Center(child: Text("> 100.9 F",style: TextStyle(color: Colors.black,fontSize: 30),)),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 60,
                    width: 170,
                    decoration: BoxDecoration(
                      color:Colors.red,
                      border: Border.all(color: Colors.lightGreenAccent,width: 2),
                      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(20))
                    ),
                    child: const Center(child: Text("High Fever",style: TextStyle(color: Colors.black,fontSize: 30),)),
                  ),
                  Container(
                    height: 60,
                    width: 170,
                    decoration: BoxDecoration(
                        color:Colors.white,
                        border: Border.all(color: Colors.lightGreenAccent,width: 2),
                        borderRadius: const BorderRadius.only(bottomRight: Radius.circular(20))
                    ),
                    child: const Center(child: Text("> 106.7 F",style: TextStyle(color: Colors.black,fontSize: 30),)),
                  ),
                ],
              ),

            ],
          ),
        )
      ),
    );
  }
}