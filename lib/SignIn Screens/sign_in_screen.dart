import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_patient_monitoring_system/Utils/utils.dart';
import 'package:smart_patient_monitoring_system/home_screen.dart';
import 'package:smart_patient_monitoring_system/SignIn%20Screens/sign_up.dart';
import 'package:smart_patient_monitoring_system/widgets/Button/rounded_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool loading = false;
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void login() {
    setState(() {
      loading = true;
    });
    _auth
        .signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((value) {
      Utils().toastMessage(value.user!.email.toString());
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
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
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(top: 20.0),
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                  fontFamily: 'Times New Roman',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 36,
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
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20
                                      ),
                                      decoration: InputDecoration(
                                          hintText: 'Enter your Email here...',
                                          hintStyle: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'Times New Roman',
                                              color: Colors.black26,
                                              fontSize: 24),
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
                                      obscureText: _obscureText,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20
                                      ),
                                      decoration: InputDecoration(
                                          suffixIcon: IconButton(
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
                          RoundButton(
                            loading: loading,
                            title: 'Sign In',
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                login();
                              }
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          RoundButton(
                            title: 'Sign Up',
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SignUp()));
                            },
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
