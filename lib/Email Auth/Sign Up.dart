import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_patient_monitoring_system/Email%20Auth/SignIn.dart';
import '../widgets/Button/rounded_button.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool loading = false;
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  Future<void> signUp() async {
    String name = nameController.text.trim();
    String email = emailController.text.trim();
    try {
      setState(() {
        loading= true;
      });
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      String userId = userCredential.user!.uid;
      // Add additional details to Firestore
      await addUserDetails(userId, name, email);
      print('User registered: $userId');
      if(userCredential.user!=null){
        Navigator.pop(context);
        setState(() {
          loading= false;
        });
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        loading= false;
      });
      print('Error: $e');
    }
  }

  Future<void> addUserDetails(userId,username,email) async {
    try {
      await FirebaseFirestore.instance.collection('Patients Emails').doc(userId).set({
        'Name': username,
        'Email': email,
        'Uid': userId,
        // Add other user details as needed
      });
      print('User details added to Firestore');
    } catch (e) {
      print('Error adding user details: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            opacity: 0.3,
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 50,),
              Text(
                "Smart \nPatient Monitoring\nSystem".toUpperCase(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontFamily: 'Times New Roman',
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    wordSpacing: 2,
                    letterSpacing: 2,
                    color: Colors.blueAccent),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 10),
                child: Text(
                  "Create Your Account".toUpperCase(),textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontFamily: 'Times New Roman',
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      wordSpacing: 2,
                      letterSpacing: 2,
                      color: Colors.black54),
                ),
              ),
              Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Full Name",
                          style: TextStyle(
                              fontFamily: 'Times New Roman',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        TextFormField(
                          style: const TextStyle(fontSize: 24.0,fontFamily: 'Times New Roman',color: Colors.black),
                          keyboardType: TextInputType.emailAddress,
                          controller: nameController,
                          decoration: InputDecoration(
                              hintText: 'Nouman',
                              hintStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Times New Roman',
                                  color: Colors.grey,
                                  fontSize: 24),
                              prefixIcon:
                              const Icon(Icons.person),
                              prefixIconColor: Colors.blueAccent,
                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    width: 2.0, color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Set the border radius for focused state
                                borderSide: const BorderSide(
                                    width: 4.0, color: Colors.blue)
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Set the border radius for focused state
                                borderSide: const BorderSide(
                                    width: 3.0, color: Colors.blueGrey),
                              )),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'User name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Email",
                          style: TextStyle(
                              fontFamily: 'Times New Roman',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        TextFormField(
                          style: const TextStyle(fontSize: 24.0,fontFamily: 'Times New Roman',color: Colors.black),
                          keyboardType: TextInputType.emailAddress,
                          controller: emailController,
                          decoration: InputDecoration(
                              hintText: 'abc@gmail.com',
                              hintStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Times New Roman',
                                  color: Colors.grey,
                                  fontSize: 24),
                              prefixIcon:
                              const Icon(Icons.email_outlined),
                              prefixIconColor: Colors.blueAccent,
                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(10.0),
                                borderSide: const BorderSide(
                                    width: 2.0, color: Colors.black),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Set the border radius for focused state
                                borderSide: const BorderSide(
                                    width: 4.0, color: Colors.blueAccent),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Set the border radius for focused state
                                borderSide: const BorderSide(
                                    width: 3.0, color: Colors.blueGrey),
                              )),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Password",
                          style: TextStyle(
                              fontFamily: 'Times New Roman',
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 24),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        TextFormField(
                          style: const TextStyle(fontSize: 24.0,fontFamily: 'Times New Roman',color: Colors.black),
                          keyboardType: TextInputType.emailAddress,
                          controller: passwordController,
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                              suffixIcon: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                child: IconButton(
                                  iconSize: 35,
                                  color: Colors.redAccent,
                                  icon: Icon(
                                    _obscureText
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                ),
                              ),
                              hintText: 'Enter your Password...',
                              hintStyle: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                  fontSize: 20),
                              prefixIcon:
                              const Icon(Icons.password_sharp),
                              prefixIconColor: Colors.blueAccent,
                              border: OutlineInputBorder(
                                borderRadius:
                                BorderRadius.circular(10.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Set the border radius for focused state
                                borderSide: const BorderSide(
                                    width: 4.0, color: Colors.blueAccent)
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Set the border radius for focused state
                                borderSide: const BorderSide(
                                    width: 3.0, color: Colors.blueGrey),
                              )),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter password';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  )),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: RoundButton(
                  title: 'Sign Up',
                  loading: loading,
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      signUp();
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Signin()));
                  },
                  child: const Text(
                    "Already have an account !",
                    style: TextStyle(
                        fontFamily: 'Times New Roman',
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,letterSpacing: 1),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
