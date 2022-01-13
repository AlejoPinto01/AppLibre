import 'package:flutter/material.dart';

class CuponsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(21, (index) {
          return Center(
            child: Card(
              elevation: 4,
              child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  debugPrint('Card tapped.');
                },
                child: const SizedBox(
                  width: 160,
                  height: 190,
                  child: Text('A card that can be tapped'),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
