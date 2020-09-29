import 'package:flutter/material.dart';

class Myhome extends StatefulWidget {
  @override
  _MyhomeState createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("home page"),
      ),
      body: Center(
        child: Container(
          height: 200,
          width: 200,
          child: Column(
            children: <Widget>[
              Material(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(10),
                elevation: 10,
                child: MaterialButton(
                  minWidth: 200,
                  height: 40,
                  onPressed: () {
                    print("done");
                    Navigator.pushNamed(context, "reg");
                  },
                  child: Text("for registered"),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Material(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(10),
                elevation: 10,
                child: MaterialButton(
                  minWidth: 200,
                  height: 40,
                  onPressed: () {
                    print("done");
                    Navigator.pushNamed(context, "login");
                  },
                  child: Text("login here"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
