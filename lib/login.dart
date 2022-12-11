import 'package:flutter/material.dart';

class login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _login();
  }
}

class _login extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: Container(alignment: Alignment.center,child: Text("login"),)
    );
  }
}
