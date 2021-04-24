import 'package:flutter/material.dart';
class GroupPage extends StatefulWidget {
  @override
  _GroupPageState createState() => _GroupPageState();

}

class _GroupPageState extends State<GroupPage> {
  bool isGroupExisted = false;
  String groupName = "";


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: groupPageContent()
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(title: Text(groupName),backgroundColor: Colors.blue,),
    //   body: Container(
    //     child: groupPageContent()
    //   ),
    // );
  }
  Widget groupPageContent(){
    var content;
    if (isGroupExisted == false){
      content = new Container(child: Text('未加入群组'));
    } else {
      content = new Container(child: Text('群组收支情况'));
    }
    return content;
  }

}
