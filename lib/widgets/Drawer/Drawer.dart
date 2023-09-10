import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
          height: 200,
          width: double.infinity,
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.deepPurpleAccent,
                  Colors.cyan,
                ],
              )),
          child: ListView(
            children: [
              const DrawerHeader(
                child: Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage("assets/images/unilogo.png"),
                        ),
                        Text("Nouman Kiyani",style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontFamily: 'Times New Roman',
                            fontWeight: FontWeight.bold),),
                        Text("noumanKayani@gmail.com",style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Times New Roman',
                            fontWeight: FontWeight.bold),)
                      ],
                    )),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text("Page 1",style: (TextStyle(fontSize: 20,color: Colors.black))),
                onTap: (){
                  // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AnimateIcon()));
                },
              ),
            ],
          ),
        ),
      );
  }
}