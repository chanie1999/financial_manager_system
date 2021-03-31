import 'package:cloud_firestore/cloud_firestore.dart';
import '../services/database.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name;
  String password;
  final users = Firestore.instance.collection('User');

  TextEditingController userNameTextEditingController = new TextEditingController();
  TextEditingController passwordTextEditingController = new TextEditingController();

  final _formKey = GlobalKey<FormState>();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildPageContent(),
    );
  }

  Widget _buildPageContent() {
    var appName = Text(
      "FinancialManager",
      style: TextStyle(fontSize: 13, color: Colors.blue), //字体颜色设置
      textScaleFactor: 3.2,
    );
    return Container(
      color: Colors.cyan.shade100, //背景色
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 100.0,
          ),
          Center(child: appName),
          SizedBox(
            height: 20.0,
          ),
          Column(
            children: [_loginForm()],
          )
          // _loginForm()
        ],
      ),
    );
  }

  Widget _loginForm() {
    return Container(
      width: 300,
      height: 400,
      padding: EdgeInsets.all(20.0),

      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(40.0)),
          color: Colors.white
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Form(key:_formKey,child: Column(children: [_userNameTextFormField(), SizedBox(height: 15.0), _passwardTextFormField()],)),
          SizedBox(height: 20.0),
          _loginButton(),
          SizedBox(height: 10.0),
          Text('没有账号？注册新账号')
        ],
      ),
    );
  }

  Widget _userNameTextFormField() {
    return TextFormField(
      validator: (val){
        // if (val.isNotEmpty) {
        //   name = val;
        // }
        return val.isEmpty || val.length < 3 ? "Please Provide UserName" : null;
      },
      controller: userNameTextEditingController,
      autofocus: false,
      style: TextStyle(color: Colors.black),
      keyboardType: TextInputType.name,
      cursorColor: Colors.blue,
      onChanged: (value) => name = value,
      decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: "用户名",
          labelStyle: new TextStyle(color: Colors.blue),
          hintText: "请输入用户名",
          prefixIcon: Icon(
            Icons.person,
            color: Colors.blue,
          ),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.blue))),
    );
  }

  Widget _passwardTextFormField() {
    return TextFormField(
      validator: (val){
        // if (val.isNotEmpty) {
        //   password = val;
        // }

        return val.isEmpty || val.length < 3 ? "Please Provide Passward" : null;
      },
      controller: passwordTextEditingController,
      autofocus: false,
      obscureText: true,
      keyboardType: TextInputType.number,
      onChanged: (value) => password = value,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.blue)),
          labelText: "密码",
          labelStyle: new TextStyle(color: Colors.blue),
          hintText: "请输入密码",
          prefixIcon: Icon(
            Icons.lock,
            color: Colors.blue,
          ),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.blue))),
    );
  }

  Widget _loginButton() {
    int count = 0;
    return Container(
        width: 420,
        height: 50,
        child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40.0)))),
          onPressed: () async {
            print("press it");
            // Firestore.instance
            //     .collection('User')
            //     .add({'name': "jojo", 'password': "456123"});
            if (_formKey.currentState.validate()){
              print("$name ---- $password");
              // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Processing Data')));
              await users
                  .getDocuments()
                  .then((QuerySnapshot querySnapshot) => {
                querySnapshot.documents.forEach((doc)  {
                  // count += 1;
                  // print(
                  //     "$count. ${doc.documentID}----${doc['name']}----${doc['password']}");

                  if (users.where("name",isEqualTo: name) != null) {
                    if (doc['name'] == name){
                      if (doc['password'] == password){
                        //补充进入主页
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login successful')));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Incorrect password, login failed')));
                      }
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('This account does not exist')));
                  }
                })
              });

            }

          },
          child:
              Text("登录", style: TextStyle(color: Colors.white, fontSize: 20)),
        ));
  }
}
