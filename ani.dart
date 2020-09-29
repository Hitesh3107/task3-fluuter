import 'package:flutter/material.dart';

class Anim extends StatefulWidget {
  @override
  _AnimState createState() => _AnimState();
}

class _AnimState extends State<Anim> with SingleTickerProviderStateMixin {
  var myanicon;
  var animation;

  @override
  void initState() {
    super.initState();
    myanicon = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );

    print(myanicon);

    animation = CurvedAnimation(parent: myanicon, curve: Curves.easeOut)
      ..addListener(() {
        setState(() {
          print(animation.value);
        });
      });

    print(animation);

    myanicon.forward();
    print(myanicon);
  }

  @override
  void dispose() {
    super.dispose();
    myanicon.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    var v = animation.value;
    int n = (v * 10).round();
    var cont1 = Container(
      color: Color.fromARGB(20 * n, 20 * n, 10 * n, 1),
      child: Center(
        child: Container(
          height: h * 0.884,
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  (' !!Wellcome!!'.substring(0, n + 1)) + ((v == 1) ? '.' : ''),
                  style: TextStyle(
                    fontSize: h * v * 0.06,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(
                        25 * (10 - n), 25 * (10 - n), 25 * (10 - n), 1),
                  ),
                ),
                Container(
                  height: (v < 1) ? (h * 0.07 * v) : 0,
                  width: w * 0.05 * v,
                  color: (n % 2 == 0) ? Colors.white : Colors.black45,
                )
              ],
            ),
          ),
        ),
      ),
    );
    var cont2 = Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "images/firebase.png",
              ),
              fit: BoxFit.fill)),
      child: Center(
        child: Container(
          height: h * 0.884,
          child: Center(
            child: Card(
              child: Text(
                'lets gooo',
                style: TextStyle(
                  fontSize: h * 0.065,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ),
            ),
          ),
        ),
      ),
    );
    return Center(
      child: Container(
        child: GestureDetector(
          onTap: () {
            // myanicon.forward(from: 0.0);
            print("bendu");
            Navigator.pushNamed(context, "home");
          },
          child: (v < 1) ? cont1 : cont2,
        ),
      ),
    );
  }
}
