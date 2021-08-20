import 'package:flutter/material.dart';
import 'package:social_media_ui/screen/home_screen.dart';
import 'package:social_media_ui/widgets/curve_cliver.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              ClipPath(
                clipper: CurveClipper(),
                child: Image(
                  height: MediaQuery.of(context).size.height / 2.5,
                  image: AssetImage('assets/images/login_background.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              Text(
                "FRENZY",
                style: TextStyle(
                    fontSize: 34,
                    letterSpacing: 10,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 20.0),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Username",
                      prefixIcon: Icon(
                        Icons.account_box,
                        size: 30.0,
                      )),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: TextField(
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 20.0),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Password",
                      prefixIcon: Icon(
                        Icons.lock,
                        size: 30.0,
                      )),
                  obscureText: true,
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
               onTap: (){
                Navigator.pushReplacement(context,MaterialPageRoute(builder:(_)=>HomeScreen(),),);
               },
                child: Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 60.0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: GestureDetector(
                    onTap: (){
                      print("click SignUP");
                    },
                    child: Container(
                      height: 80.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(
                        "Don't have an account?SingUp",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
