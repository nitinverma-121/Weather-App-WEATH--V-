import 'package:flutter/material.dart';
import 'package:news_app/Views/Home.dart';

class Splash extends StatefulWidget {
  const Splash({Key key}) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image(
              image: AssetImage("assets/road.jpg"),
              fit: BoxFit.fill,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Divider(
                thickness: 2.0,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "WEATH- V",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.wb_sunny),
                  Icon(Icons.cloud),
                  Icon(Icons.water),
                  Icon(Icons.umbrella),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Your ultimate 5 day weather checking application",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              InkWell(
                child: Container(
                  child: Text(
                    "Get Started",
                    textScaleFactor: 2,
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.black,
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Home()));
                },
              ),
              Divider(
                thickness: 2,
              )
            ],
          )
        ],
      ),
    );
  }
}
