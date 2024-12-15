// ignore: unused_import
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late Color myColor;
  late Size mediasize;
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool rememberUser = false;
  @override
  Widget build(BuildContext context) {
    myColor = Theme.of(context).primaryColor;
    mediasize = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
          color: myColor,
          image: DecorationImage(
              image: AssetImage("assets/images/Github.png"),
              fit: BoxFit.contain,
              colorFilter: ColorFilter.mode(
                  myColor.withOpacity(0.2), BlendMode.dstATop))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Positioned(
              top: 50,
              child: buildTop(),
            ),
            Positioned(bottom: 0, child: buildButtom()),
          ],
        ),
      ),
    );
  }

  Widget buildTop() {
    return SizedBox(
      width: mediasize.width,
      child: Column(
        children: [
          Icon(
            Icons.location_on_sharp,
            size: 100,
            color: Colors.white,
          ),
          Text(
            "GO MAP",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Colors.white,
                letterSpacing: 3),
          )
        ],
      ),
    );
  }

  Widget buildButtom() {
    return SizedBox(
        width: mediasize.width,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: buildForm(),
          ),
        ));
  }

  Widget buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Welcome",
          style: TextStyle(
              fontSize: 32, color: myColor, fontWeight: FontWeight.bold),
        ),
        buildgreyText("please login with your information"),
        SizedBox(
          height: 60,
        ),
        buildgreyText("Email Address"),
        buildInputField(emailcontroller),
        SizedBox(
          height: 40,
        ),
        buildgreyText("Password"),
        buildInputField(passwordcontroller),
        SizedBox(
          height: 20,
        ),
        buildRememberForget(),
        SizedBox(
          height: 20,
        ),
        buildLoginButton(),
        SizedBox(
          height: 20,
        ),
        buildOtherLogin(),
      ],
    );
  }

  Widget buildgreyText(String text) {
    return Text(
      text,
      style: TextStyle(color: Colors.grey),
    );
  }

  Widget buildInputField(TextEditingController controller,
      {ispassword = false}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          suffix: ispassword ? Icon(Icons.remove_red_eye) : Icon(Icons.done)),
      obscureText: ispassword,
    );
  }

  Widget buildRememberForget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
                value: rememberUser,
                onChanged: (value) {
                  setState(() {
                    rememberUser = value!;
                  });
                }),
            buildgreyText("Remember Me"),
          ],
        ),
        TextButton(
            onPressed: () {}, child: buildgreyText("I Forget My Password")),
      ],
    );
  }

  Widget buildLoginButton() {
    return ElevatedButton(
        onPressed: () {
          debugPrint("Email : ${emailcontroller.text} ");
          debugPrint("Passwprd : ${passwordcontroller.text}");
        },
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          elevation: 20,
          backgroundColor: myColor,
          shadowColor: myColor,
          minimumSize: const Size.fromHeight(60),
        ),
        child: Text(
          "LOGIN",
          style: TextStyle(color: Colors.white),
        ));
  }

  Widget buildOtherLogin() {
    return Center(
        child: Column(
      children: [
        Text("Or Login With",style: TextStyle(fontWeight: FontWeight.w400),),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Tab(
              icon: Image.asset("assets/images/facebook.png"),
            ),
            Tab(
              icon: Image.asset("assets/images/Github.png"),
            ),
            Tab(
              icon: Image.asset("assets/images/Twitter.png"),
            )
          ],
        )
      ],
    ));
  }
}
