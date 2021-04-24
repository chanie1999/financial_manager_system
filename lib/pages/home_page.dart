import 'package:financial_manager_system/pages/group_page.dart';
import 'package:financial_manager_system/pages/manager_page.dart';
import 'package:financial_manager_system/pages/personal_page.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> _pageViewList = [ManagerPage(),GroupPage(),PersonalPage()];
  int _currentIndex = 0;

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: _pageViewList[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home,color: Colors.blue,),label: "首页"),
            BottomNavigationBarItem(icon: Icon(Icons.group,color: Colors.blue,),label: "群组"),
            BottomNavigationBarItem(icon: Icon(Icons.person,color: Colors.blue,),label: "个人"),
          ],
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          //设置点击响应
          onTap: (int index){
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
