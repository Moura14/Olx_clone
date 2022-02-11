import 'package:flutter/material.dart';

class EmptyCard extends StatelessWidget {
  //const EmptyCard({Key key}) : super(key: key);

  EmptyCard(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 8,
      margin: const EdgeInsets.all(32),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(children: [
          Expanded(
            flex: 4,
            child: Icon(
              Icons.border_clear,
              size: 200,
              color: Colors.purple,
            ),
          ),
          Divider(),
          Expanded(
            flex: 1,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Hmmm...",
                    style: TextStyle(
                        color: Colors.orange,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(text,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center),
                ]),
          )
        ]),
      ),
    );
  }
}
