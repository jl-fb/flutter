import 'package:flutter/material.dart';
import 'package:worldtime/services/world_time.dart';
import 'package:progress_dialog/progress_dialog.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  ProgressDialog progressDialog;

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: 'America/Sao_Paulo', location: 'Brasil', flag: 'brasil.png'),
  ];

  void updateTime(int index) async {
    progressDialog.style(message: "Loading");
    progressDialog.show();
    WorldTime instance = locations[index];
    progressDialog.hide().whenComplete(() {});
    await instance.getTime();
    progressDialog.hide();
    Navigator.pop(
      context,
      {
        'location': instance.location,
        'flag': instance.flag,
        'time': instance.time,
        'isDaytime': instance.isDaytime
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    progressDialog = new ProgressDialog(context);
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose the Location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          final location = locations[index];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4.0),
            child: Card(
              child: ListTile(
                onTap: () async {
                  updateTime(index);
                },
                title: Text(
                  location.location,
                  style: TextStyle(fontSize: 20.0),
                ),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${location.flag}'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
