import 'package:flutter/material.dart';

class ErrorBox extends StatelessWidget {
  ErrorBox(this.message);
  String message;
  //const ErrorBox({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (message == null) return Container();
    return Container(
        color: Colors.red,
        child: Row(
          children: [
            Icon(Icons.error_outline, color: Colors.white, size: 40),
            SizedBox(width: 16),
            Expanded(
                child: Text(
              "Oops! $message. Por Favor, tente novamente",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ))
          ],
        ));
  }
}
