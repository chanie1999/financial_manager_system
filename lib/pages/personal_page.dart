import 'package:financial_manager_system/pages/person_message_page.dart';
import 'package:flutter/material.dart';

class PersonalPage extends StatefulWidget {
  @override
  _PersonalPageState createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: PersonsMessage(),
      ),
    );
  }
}
