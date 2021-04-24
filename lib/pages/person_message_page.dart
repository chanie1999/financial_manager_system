import 'package:flutter/material.dart';
class PersonsMessage extends StatefulWidget {
  @override
  _PersonsMessageState createState() => _PersonsMessageState();
}

class _PersonsMessageState extends State<PersonsMessage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('姓名:'),],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('群组:')],
          )
        ],
      ),
    );
  }
}
