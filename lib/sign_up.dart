import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_patient_monitoring_system/Utils/utils.dart';
import 'package:smart_patient_monitoring_system/home_screen.dart';
import 'package:smart_patient_monitoring_system/sign_in_screen.dart';
import 'package:smart_patient_monitoring_system/widgets/rounded_button.dart';


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

  void signup(){
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
      onWillPop: ()async{
        SystemNavigator.pop();
        return true;
      },
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover)),
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
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: Image.asset(
                      "assets/images/unilogo.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    "SMART PATIENT\nMONITORING SYSTEM",textAlign:TextAlign.center,
                    style: TextStyle(fontWeight:FontWeight.bold,fontSize: 34,color: Colors.black26),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: userController,
                            decoration: InputDecoration(
                                hintText: 'User Name',
                                prefixIcon: const Icon(Icons.person),
                                prefixIconColor: Colors.blueAccent,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                )),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Your Name';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            decoration: InputDecoration(
                                hintText: 'Email',
                                prefixIcon: const Icon(Icons.email_outlined),
                                prefixIconColor: Colors.blueAccent,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                )),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter email';
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            controller: passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                                hintText: 'Password',
                                prefixIcon: const Icon(Icons.password_sharp),
                                prefixIconColor: Colors.blueAccent,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                )),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter password';
                              }
                              return null;
                            },
                          ),
                        ],
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  RoundButton(
                    loading: loading,
                    title: 'Sign Up',
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        signup();
                      }
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  RoundButton(
                    title: 'Already have an Account',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignInScreen()));
                    },
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