import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Lo extends StatefulWidget {
  @override
  _LoState createState() => _LoState();
}

class _LoState extends State<Lo> {
  @override
  Widget build(BuildContext context) {
    String email;
    String pass;
    bool mp = false;
    var auth = FirebaseAuth.instance;
    return Scaffold(
      appBar: AppBar(
        title: Text("login  page"),
      ),
      body: ModalProgressHUD(
        inAsyncCall: mp,
        child: Center(
          child: Container(
            height: 400,
            width: 200,
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                      hintText: "Enter your email",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onChanged: (value) {
                    email = value;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Enter your Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onChanged: (value) {
                    pass = value;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                RaisedButton(
                  onPressed: () async {
                    // print(email);
                    // print(pass);
                    setState(() {
                      mp = true;
                    });
                    try {
                      var user = await auth.signInWithEmailAndPassword(
                          email: email, password: pass);

                      print(user);

                      if (user != null) {
                        Navigator.pushNamed(context, "final");
                        setState(() {
                          mp = false;
                        });
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Text("click here"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
