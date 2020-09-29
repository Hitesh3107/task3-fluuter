import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myfire/screen/ani.dart';
import 'package:myfire/screen/ch.dart';
import 'package:myfire/screen/home.dart';
import 'package:myfire/screen/linux.dart';
import 'package:myfire/screen/lo.dart';
import 'package:myfire/screen/mainln.dart';
import 'package:myfire/screen/myimage.dart';
import 'package:myfire/screen/re.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    initialRoute: "ani",
    routes: {
      "home": (context) => Myhome(),
      "login": (context) => Lo(),
      "reg": (context) => Re(),
      "chat": (context) => Ch(),
      "img": (context) => MyIm(),
      "ani": (context) => Anim(),
      "linux": (context) => Lw(),
      "final": (context) => Bendu(),
    },
  ));
}

/*class MyApp extends StatelessWidget {
  @override
  var fsc = FirebaseFirestore.instance;

  myget() async {
    var d = await fsc.collection("students").get();
    for (var i in d.docs) {
      print(i.data());
    }
  }

  Widget build(BuildContext context) {
    //Firebase.initializeApp();
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("fire basedfd"),
        ),
        body: Column(
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                fsc.collection("students").add({
                  'name': 'bendffj',
                  'title': 'ggg',
                  'email': 'bbbbbendu@23'
                });
                print("send data");
              },
              child: Text("send data"),
            ),
            RaisedButton(
              onPressed: () {
                myget();
                print("get data");
              },
              child: Text("get data"),
            ),
          ],
        ),
      ),
    );
  }
}
*/
