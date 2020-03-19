import 'dart:convert';

import 'package:convert/convert.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location;
  String time;
  String flag;
  String url;
  bool isDaytime;

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get("https://worldtimeapi.org/api/timezone/$url");
      Map data = jsonDecode(response.body);
      print(data);

      //get properties from data
      String dateTime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      //print(dateTime);
      //print(offset);
      //create dateTime object
      DateTime dateNow = DateTime.parse(dateTime);
      dateNow = data['utc_offset'][0] == '-'
          ? dateNow.subtract(Duration(hours: int.parse(offset)))
          : dateNow.add(Duration(hours: int.parse(offset)));

      isDaytime = dateNow.hour > 6 && dateNow.hour < 20 ? true : false;

      //set time property
      time = DateFormat.jm().format(dateNow);
    } catch (e) {
      time = 'nao pegou';
    }
  }
}
