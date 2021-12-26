// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/Views/details.dart';
//import 'package:news_app/Weather forecast/model/weather_forecast_model.dart';

Widget midview(AsyncSnapshot snapshot) {
  List arr = snapshot.data.list;
  // return Column(
  //   children: [
  //     Text(
  //       "${snapshot.data.city.name}, ${snapshot.data.city.country} ",
  //       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
  //     ),
  //   ],
  // );
  return Expanded(
    child: SizedBox(
      height: 350,
      child: ListView.separated(
        itemCount: arr.length,
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            thickness: 4,
            color: Colors.white,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.pink[100],
              Colors.indigo[100],
            ])),
            child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => Details(
                                arr: arr,
                                index: index,
                              )));
                },
                title: Text(
                  arr[index].weather[0].description.toUpperCase(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Row(
                  children: [
                    Text(
                      "Max  ${kelvin_to_celcius(arr[index].main.tempMax)}",
                      style: TextStyle(fontSize: 12),
                    ),
                    Icon(
                      Icons.arrow_upward,
                      size: 15,
                    ),
                    Text(" "),
                    Text(
                      "Min  ${kelvin_to_celcius(arr[index].main.tempMin)}",
                      style: TextStyle(fontSize: 12),
                    ),
                    Icon(
                      Icons.arrow_downward,
                      size: 15,
                    ),
                  ],
                ),
                trailing: Image(
                  // height: 50,
                  // width: 50,
                  image: NetworkImage(
                      getimage(snapshot, arr[index].weather[0].icon)),
                ),
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(getformatteddate(arr[index].dt),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blueGrey)),
                    Text(gettimestamp(arr[index].dtTxt)),
                  ],
                )),
          );
        },
      ),
    ),
  );
}

Text number(int index) {
  index++;
  return Text("$index");
}

String getimage(AsyncSnapshot asyncSnapshot, String t) {
  String imgurl = "https://openweathermap.org/img/wn/" + t + "@2x.png";
  return imgurl;
}

String kelvin_to_celcius(double k) {
  double c = k - 273.15;
  return c.toStringAsFixed(2);
}

//Convert unix type date to normal formatted date

String getformatteddate(int unixnumber) {
  //step-1 convert the unix number into a date time object
  DateTime dateTime =
      new DateTime.fromMillisecondsSinceEpoch(unixnumber * 1000);
  //step-2 format the date using date formatter
  return new DateFormat(
    "EEE, MMM d",
  ).format(dateTime);
}

String gettimestamp(String t) {
  int a = t.length;
  String f = "";
  for (int i = 0; i < 8; i++) {
    f = t[a - i - 1] + f;
  }
  return f;
}
