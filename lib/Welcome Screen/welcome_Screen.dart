import 'package:flutter/material.dart';
import '../Email Auth/SignIn.dart';
import '../Item List/itemlist.dart';
class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  List<Widget> slides = items
      .map((item) => Container(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        children: <Widget>[
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child:
            Image.asset(
              item['image'],
              fit: BoxFit.fitWidth,
              width: 220.0,
              alignment: Alignment.bottomCenter,
            ),
          ),
          Flexible(
            flex: 1,
            fit: FlexFit.tight,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 20,),
                  Text(item['header'],textAlign:TextAlign.center,
                      style: const TextStyle(
                          fontSize: 45.0,
                          fontWeight: FontWeight.w300,
                          color: Color(0XFF3F3D56),
                          height: 1.0),
                      ),
                  const SizedBox(height: 30,),
                  Text(
                    item['description'],
                    style: const TextStyle(
                        color: Colors.grey,
                        letterSpacing: 1.2,
                        fontSize: 20.0,
                        height: 1.3),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          )
        ],

      )))
      .toList();

  List<Widget> indicator() => List<Widget>.generate(
      slides.length,
          (index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 3.0),
        height: 10.0,
        width: 10.0,
        decoration: BoxDecoration(
            color: currentPage.round() == index
                ? const Color(0XFF256075)
                : const Color(0XFF256075).withOpacity(0.2),
            borderRadius: BorderRadius.circular(10.0)),
      ));

  double currentPage = 0.1;
  final _pageViewController = PageController();

  @override
  void initState() {
    super.initState();
    _pageViewController.addListener(() {
      setState(() {
        currentPage = _pageViewController.page!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            controller: _pageViewController,
            itemCount: slides.length,
            itemBuilder: (BuildContext context, int index) {
              return slides[index];
            },
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(top: 70.0),
                padding: const EdgeInsets.symmetric(vertical: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: indicator(),
                ),
              )
            //  ),
          )
          // )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateToLogin(context);
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.arrow_circle_right_rounded),
      ),
    );
  }
}

void _navigateToLogin(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Signin()));
}