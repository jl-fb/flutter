import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:worldtime/services/world_time.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setUpTime() async {
    WorldTime time = WorldTime(
        url: 'America/Sao_Paulo', location: 'Brasil', flag: 'brasil.jpg');
    await time.getTime();

    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': time.location,
      'flag': time.flag,
      'time': time.time,
      'isDaytime': time.isDaytime
    });
  }

  @override
  void initState() {
    super.initState();
    setUpTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SpinKitCircle(
        color: Colors.green,
        size: 90.0,
      ),
    ));
  }
}
