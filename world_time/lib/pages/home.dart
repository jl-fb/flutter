import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map dataTimeFromLoading = {};

  @override
  Widget build(BuildContext context) {
    dataTimeFromLoading = dataTimeFromLoading.isNotEmpty
        ? dataTimeFromLoading
        : ModalRoute.of(context).settings.arguments;

    String bgImage = dataTimeFromLoading['isDaytime'] ? 'day.png' : 'night.png';
    Color color =
        dataTimeFromLoading['isDaytime'] ? Colors.grey[800] : Colors.white70;
    Color bgColor =
        dataTimeFromLoading['isDaytime'] ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 130.0, 0.0, 0.0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');
                    print(result);
                    setState(() {
                      dataTimeFromLoading = {
                        'time': result['time'],
                        'location': result['location'],
                        'flag': result['flag'],
                        'isDaytime': result['isDaytime']
                      };
                    });
                  },
                  icon: Icon(
                    Icons.add_location,
                    color: color,
                  ),
                  label: Text(
                    "Edit Location",
                    style: TextStyle(color: color),
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(dataTimeFromLoading['location'],
                        style: TextStyle(
                            fontSize: 28.0, letterSpacing: 2.0, color: color))
                  ],
                ),
                SizedBox(height: 20.0),
                Text(dataTimeFromLoading['time'],
                    style: TextStyle(fontSize: 80.0, color: color))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
