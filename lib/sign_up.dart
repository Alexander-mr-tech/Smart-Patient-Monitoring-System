import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_patient_monitoring_system/Utils/utils.dart';
import 'package:smart_patient_monitoring_system/sign_in_screen.dart';
import 'package:smart_patient_monitoring_system/widgets/Button/rounded_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  final userController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    super.dispose();
    userController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void signup() {
    setState(() {
      loading = true;
    });
    _auth
        .createUserWithEmailAndPassword(
            email: emailController.text.toString(),
            password: passwordController.text.toString())
        .then((value) {
      setState(() {
        loading = false;
      });
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
      Utils().toastMessage(error.toString());
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.deepPurpleAccent,
            Colors.cyan,
          ],
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 60,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/unilogo.png',
                    height: 140,
                    width: 175,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Smart Patient\nMonitoring System",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'Times New Roman',
                        fontWeight: FontWeight.bold,
                        fontSize: 36,
                        color: Colors.black),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Container(
                      width: 350,
                      height: 460,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.cyan,
                            Colors.deepPurpleAccent,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 10.0, left: 10),
                            child: Text(
                              "Create\nYour Account",
                              style: TextStyle(
                                  fontFamily: 'Times New Roman',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.black),
                            ),
                          ),
                          Form(
                              key: _formKey,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "Email",
                                      style: TextStyle(
                                          fontFamily: 'Times New Roman',
                                          color: Colors.black,
                                          fontSize: 24),
                                    ),
                                    TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      controller: emailController,
                                      decoration: InputDecoration(
                                          hintText: 'Enter your Email here...',
                                          hintStyle: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Times New Roman',
                                              color: Colors.black26,
                                              fontSize: 20),
                                          prefixIcon:
                                              const Icon(Icons.email_outlined),
                                          prefixIconColor: Colors.black,
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
                                                width: 2.0, color: Colors.white),
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
                                          fontSize: 24),
                                    ),
                                    TextFormField(
                                      keyboardType: TextInputType.text,
                                      controller: passwordController,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                          hintText: 'Enter your Password...',
                                          hintStyle: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black26,
                                              fontSize: 20),
                                          prefixIcon:
                                              const Icon(Icons.password_sharp),
                                          prefixIconColor: Colors.black,
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(
                                                10.0), // Set the border radius for focused state
                                            borderSide: const BorderSide(
                                                width: 2.0, color: Colors.white),
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
                            height: 10,
                          ),
                          Center(
                            child: RoundButton(
                              title: 'Sign Up',
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  signup();
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
                                        builder: (context) => const SignInScreen()));
                              },
                              child: const Text(
                                "Already have an account !",
                                style: TextStyle(
                                    fontFamily: 'Times New Roman',
                                    color: Colors.yellowAccent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
