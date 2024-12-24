import 'package:flutter/material.dart';
import '../screen/page/home.dart';
class WellcomePage extends StatefulWidget {
  const WellcomePage({super.key});

  @override
  State<WellcomePage> createState() => _WellcomePageState();
}

class _WellcomePageState extends State<WellcomePage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              colors: [
            Color.fromARGB(195, 0, 39, 71),
            Color.fromARGB(212, 9, 94, 164),
          ])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _page(),
      ),
    );
  }

  Widget _page() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _icon(),
            const SizedBox(height: 20),
            _inputTextfiled('User Name  ', username),
            const SizedBox(height: 20),
            _inputTextfiled('User Password ', password, isPassword: true),
            const SizedBox(height: 20),
            _loginButton()
          ],
        ),
      ),
    );
  }

  Widget _icon() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2),
        shape: BoxShape.circle,
      ),
      // child: Image.asset('assets/image/money.jpg'),
      child: const Icon(
        Icons.person,
        color: Colors.white,
        size: 140,
      ),
    );
  }

  Widget _inputTextfiled(String hintText, TextEditingController text,
      {isPassword = false}) {
    var border = const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(18)),
        borderSide: BorderSide(color: Colors.white));
    return TextField(
      style: const TextStyle(
        color: Colors.white,
        fontSize: 15,
      ),
      controller: text,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
        enabledBorder: border,
        focusedBorder: border,
      ),
      obscureText: isPassword,
      //
    );
  }

  Widget _loginButton() {
    return ElevatedButton(
      onPressed: () {
        if (password.text == '123' && username.text == 'sreypov') {
          Navigator.push(
              context, MaterialPageRoute(builder: (ctx) => HomePage()));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(" Inavalid UserNamd and Password ")));
        }
      },
      child: const SizedBox(
        width: double.infinity,
        child: Text(
          "Sign in  ",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 18),
        ),
      ),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 17),
      ),
    );
  }
}
