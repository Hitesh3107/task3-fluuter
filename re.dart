import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Re extends StatefulWidget {
  @override
  _ReState createState() => _ReState();
}

class _ReState extends State<Re> {
  @override
  Widget build(BuildContext context) {
    String email;
    String pass;
    bool mp = false;
    File imagepath;
    var imgurl;
    var gurl;

    var fsc = FirebaseFirestore.instance;
    clickphoto() async {
      print("hii");

      var picker = ImagePicker();
      var image = await picker.getImage(source: ImageSource.camera);
      setState(() {
        imagepath = File(image.path);
      });

      var fbs =
          FirebaseStorage.instance.ref().child("myimagere").child("my.jpg");
      fbs.putFile(imagepath);
      // imagepath = image.path;
      print(imagepath);

      imgurl = await fbs.getDownloadURL();

      await fsc
          .collection("imgurl")
          .add({"proflieurl": imgurl == null ? "waiting" : imgurl});

      setState(() {
        gurl = imgurl;
      });
    }

    var auth = FirebaseAuth.instance;
    return Scaffold(
      appBar: AppBar(
        title: Text("registration page"),
      ),
      body: ModalProgressHUD(
        inAsyncCall: mp,
        child: Center(
          child: Container(
            height: 400,
            width: 200,
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  radius: 60.0,
                  backgroundImage: gurl != null ? NetworkImage(gurl) : null,
                ),
                RaisedButton(
                  onPressed: () {
                    clickphoto();
                  },
                  child: Text("click here"),
                ),
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
                      hintText: "Enter your password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20))),
                  onChanged: (value) {
                    pass = value;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                Material(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(10),
                  elevation: 10,
                  child: MaterialButton(
                    minWidth: 150,
                    height: 40,
                    onPressed: () async {
                      // print(email);
                      //print(pass);
                      setState(() {
                        mp = true;
                      });
                      try {
                        var user = await auth.createUserWithEmailAndPassword(
                            email: email, password: pass);

                        print(user);

                        if (user.additionalUserInfo.isNewUser == true) {
                          Navigator.pushNamed(context, "chat");
                          setState(() {
                            mp = false;
                          });
                        }
                      } catch (e) {
                        print(e);
                      }
                    },
                    child: Text("click here"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
