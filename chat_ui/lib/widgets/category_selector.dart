import 'package:flutter/material.dart';

class CategorySelector extends StatefulWidget {
  @override
  _CategorySelectorState createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  List<String> categories = ['Messages', 'Online', 'Groups', 'Requests'];
  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      color: Theme.of(context).primaryColor,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (BuildContext ctx, int index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedCategory = index;
                });
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 30.0),
                child: Text(
                  categories[index],
                  style: TextStyle(
                    color: index == selectedCategory ? Colors.white : Colors.white60,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2
                  ),
                ),
              ),
            );
          }),
    );
  }
}
