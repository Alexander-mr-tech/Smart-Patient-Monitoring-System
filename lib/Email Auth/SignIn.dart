import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_patient_monitoring_system/Email%20Auth/Sign%20Up.dart';
import 'package:smart_patient_monitoring_system/Utils/utils.dart';
import '../Home Screen/home_screen.dart';
import '../widgets/Button/rounded_button.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  bool loading = false;
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();

  void login()async{
    setState(() {
      loading= true;
    });
    String Email = emailcontroller.text.trim();
    String Password =  passwordcontroller.text.trim();
    if(Email==""||Password==""){
      print("fill all fields");
    }
    else {
      try{
        UserCredential userCredential=await _auth.signInWithEmailAndPassword(email: Email, password: Password);
        if(userCredential.user !=null){
          // Utils();
          Navigator.popUntil(context,(route)=>route.isFirst);
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const HomeScreen()));
          setState(() {
            loading= false;
          });
        }
      } on FirebaseAuthException catch(ex){
        setState(() {
          loading= false;
        });
        print(ex.code.toString());
        if(ex.code=="INVALID_LOGIN_CREDENTIALS"){
          print("Invalid User");
        }
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
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
                  vertical: 25,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/unilogo.png',
                        height: 130,
                        width: 175,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Smart Patient\nMonitoring System",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Times New Roman',
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                            color: Colors.white),
                      ),
                      Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(top: 10.0),
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
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          "Email",
                                          style: TextStyle(
                                              fontFamily: 'Times New Roman',
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 24),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        TextFormField(
                                          style: const TextStyle(fontSize: 24.0,fontFamily: 'Times New Roman',color: Colors.white),
                                          keyboardType: TextInputType.emailAddress,
                                          controller: emailcontroller,
                                          decoration: InputDecoration(
                                              hintText: 'Enter your Email here...',
                                              hintStyle: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'Times New Roman',
                                                  color: Colors.black26,
                                                  fontSize: 24),
                                              prefixIcon:
                                              const Icon(Icons.email_outlined),
                                              prefixIconColor: Colors.white,
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
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 24),
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        TextFormField(
                                          style: const TextStyle(fontSize: 24.0,fontFamily: 'Times New Roman',color: Colors.white),
                                          keyboardType: TextInputType.text,
                                          controller: passwordcontroller,
                                          obscureText: _obscureText,
                                          decoration: InputDecoration(
                                              suffixIcon: Padding(
                                                padding: const EdgeInsets.symmetric(horizontal: 10),
                                                child: IconButton(
                                                  iconSize: 35,
                                                  color: Colors.white,
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
                                                  color: Colors.black26,
                                                  fontSize: 24),
                                              prefixIcon:
                                              const Icon(Icons.password_sharp),
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
                                height: 15,
                              ),
                              RoundButton(
                                title: 'Sign Up',
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Signup()));
                                },
                              ),
                            ],
                          ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
