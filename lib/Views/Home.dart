import 'package:flutter/material.dart';
import 'package:news_app/Weather%20forecast/model/weather_forecast_model.dart';
import 'package:news_app/Weather%20forecast/network/Network.dart';


import 'midview.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _cityname = "Mumbai";

  Future<WeatheForecastModel> forecastedData;

  TextEditingController _mycontroller = new TextEditingController();

  @override
  void initState() {
    super.initState();
    forecastedData = Network().getData(cityname: _cityname);
    forecastedData.then((value) => print(value.list[0].dtTxt));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      appBar: AppBar(
        title: Text(
          "WEATH- V",
          style: TextStyle(color: Colors.black, fontSize: 27),
        ),
        actions: [
          InkWell(
            child: Icon(
              Icons.person,
              color: Colors.black,
              size: 25,
            ),
            onTap: () {
              final _mysnackbar = SnackBar(
                  duration: Duration(milliseconds: 1500),
                  backgroundColor: Colors.amber[200],
                  content: Text(
                    "Developed by Nitin Verma                                 Powered by OPEN WEATHER API",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ));
              ScaffoldMessenger.of(context).showSnackBar(_mysnackbar);
            },
          ),
        ],
        backgroundColor: Colors.amber[300],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Icon(
                    Icons.wb_cloudy,
                    size: 60,
                    color: Colors.blue,
                  ),
                  Icon(
                    Icons.water,
                    size: 120,
                    color: Colors.redAccent,
                  ),
                ],
              ),
              Divider(
                thickness: 4,
              ),
              Container(
                alignment: Alignment.center,
                width: 340,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "Weather prediction for the next 5 days detailed with every 3 hour time stamp.",
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                    Text(
                        "Now with extra features like humidity, wind speed, ground level and more...",
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.blueGrey,
                            fontSize: 13)),
                  ],
                ),
              ),
              Divider(
                thickness: 2,
              ),
              Card(
                elevation: 30,
                shadowColor: Colors.black,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Image(
                        image: NetworkImage(
                          "https://images.unsplash.com/photo-1615463531504-af9d9b4e1681?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=327&q=80",
                        ),
                        height: 150,
                        width: 400,
                        fit: BoxFit.cover),
                    FutureBuilder(
                      future: forecastedData,
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.data == null)
                          return CircularProgressIndicator(
                            color: Colors.black,
                          );
                        else {
                          return Column(
                            children: [
                              Text(
                                "${snapshot.data.city.name}, ${snapshot.data.city.country}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30),
                              ),
                              Text(
                                "A place populated with ${snapshot.data.city.population} people",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 10),
                              ),
                            ],
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
              Divider(
                thickness: 4,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: _mycontroller,
                  onSubmitted: (value) {
                    setState(() {
                      //IMPORTANT
                      _cityname = value;

                      //this step was done to update the forecasted data too
                      forecastedData =
                          new Network().getData(cityname: _cityname);
                    });
                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.location_city_sharp,
                        size: 30,
                        color: Colors.black,
                      ),
                      suffixIcon: Icon(
                        Icons.search,
                        size: 30,
                        color: Colors.black,
                      ),
                      label: Text("Enter City Name"),
                      border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 4.0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.black, width: 4.0))),
                  keyboardType: TextInputType.text,
                ),
              ),
              SizedBox(
                height: 5,
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
              Divider(
                thickness: 2,
                color: Colors.amber,
              ),
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: "P",
                    style: TextStyle(
                        color: Colors.purple,
                        fontSize: 35,
                        fontWeight: FontWeight.bold)),
                TextSpan(
                    text: "R",
                    style: TextStyle(color: Colors.pinkAccent, fontSize: 33)),
                TextSpan(
                    text: "E",
                    style: TextStyle(
                        color: Colors.purple,
                        fontSize: 31,
                        fontWeight: FontWeight.bold)),
                TextSpan(
                    text: "D",
                    style: TextStyle(color: Colors.pinkAccent, fontSize: 29)),
                TextSpan(
                    text: "I",
                    style: TextStyle(
                        color: Colors.purple,
                        fontSize: 27,
                        fontWeight: FontWeight.bold)),
                TextSpan(
                    text: "C",
                    style: TextStyle(color: Colors.pinkAccent, fontSize: 25)),
                TextSpan(
                    text: "T",
                    style: TextStyle(
                        color: Colors.purple,
                        fontSize: 27,
                        fontWeight: FontWeight.bold)),
                TextSpan(
                    text: "I",
                    style: TextStyle(
                      color: Colors.pinkAccent,
                      fontSize: 29,
                    )),
                TextSpan(
                    text: "O",
                    style: TextStyle(
                        color: Colors.purple,
                        fontSize: 31,
                        fontWeight: FontWeight.bold)),
                TextSpan(
                    text: "N",
                    style: TextStyle(
                      color: Colors.pinkAccent,
                      fontSize: 33,
                    )),
                TextSpan(
                    text: "S",
                    style: TextStyle(
                        color: Colors.purple,
                        fontSize: 35,
                        fontWeight: FontWeight.bold)),
              ])),
              Divider(
                thickness: 2,
                color: Colors.amber,
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: FutureBuilder(
                            future: forecastedData,
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
                              if (snapshot.hasData) {
                                return midview(snapshot);
                              } else {
                                return CircularProgressIndicator(
                                  color: Colors.black,
                                );
                              }
                            },
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}