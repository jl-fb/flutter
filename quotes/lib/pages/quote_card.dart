import 'package:quotes/models/quotes.dart';
import 'package:flutter/material.dart';

class QuoteCard extends StatelessWidget {
  // const QuoteCard({
  //   Key key,
  // }) : super(key: key);

  final Quote quote;
  final Function delete;
  QuoteCard({this.quote, this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              quote.text,
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 6.0),
            Text(
              'Author: ${quote.author}',
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 14.0,
              ),
            ),
            SizedBox(height: 8.0),
            FlatButton.icon(
              onPressed: delete,
              label: Text("Delete quote"),
              icon: Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
