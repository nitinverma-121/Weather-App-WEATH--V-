import 'package:flutter/material.dart';
import 'package:news_app/Views/midview.dart';

// ignore: must_be_immutable
class Details extends StatelessWidget {
  List arr;
  int index;

  Details({Key key, this.arr, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
        title: Text(
          "WEATH- V",
          style: TextStyle(color: Colors.black, fontSize: 27),
        ),
        backgroundColor: Colors.amber[300],
        centerTitle: true,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Image(
              height: 1000,
              image: NetworkImage(
                  "https://images.unsplash.com/photo-1632466685279-b316b4f25e15?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1887&q=80")),
          Container(
              height: 300,
              color: Colors.black,
              padding: EdgeInsets.all(4),
              child: Column(children: [
                Divider(
                  thickness: 2,
                  color: Colors.white,
                ),
                Text(
                  "                                                                                                                                                           The weather on ${arr[index].dtTxt} will have a  ${arr[index].weather[0].description}. The wind speed during this time is around ${arr[index].wind.speed}, with deg, gust and visibility as ${arr[index].wind.deg}, ${arr[index].wind.gust} and ${arr[index].visibility} respectively. Other important statistics of that time stamp are present below. ",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Temp ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                kelvin_to_celcius(arr[index].main.temp),
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Feels like ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                kelvin_to_celcius(arr[index].main.feelsLike),
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Min temp ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                kelvin_to_celcius(arr[index].main.tempMin),
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Max temp ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                kelvin_to_celcius(arr[index].main.tempMax),
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Sea level ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                arr[index].main.seaLevel.toString(),
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Ground level ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                arr[index].main.grndLevel.toString(),
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "Humidity ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                arr[index].main.humidity.toString(),
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.wb_sunny,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.cloud,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.water,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.umbrella,
                      color: Colors.white,
                    ),
                  ],
                ),
                Divider(
                  thickness: 2,
                  height: 10,
                  color: Colors.white,
                ),
              ])),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.arrow_back,
          color: Colors.black,
          size: 30,
        ),
        backgroundColor: Colors.amber[300],
        mini: true,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
