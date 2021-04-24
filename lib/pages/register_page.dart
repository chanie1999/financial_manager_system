import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String name;
  String password;
  String currentPassword;

  TextEditingController userNameTextEditingController = new TextEditingController();
  TextEditingController passwordTextEditingController = new TextEditingController();
  TextEditingController currentPasswordTextEditingController = new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.cyan.shade100,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Financial Manager System",style: TextStyle(color: Colors.blue,fontSize: 25)),
              SizedBox(height: 20),
              Center(
                child: Form(
                    key: _formKey,
                    child: Container(
                      width: 300,
                      padding: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(40.0)),
                          color: Colors.white
                      ),
                      child: Column(children: [
                        TextFormField(
                            controller: userNameTextEditingController,
                            validator: (val){
                              if (val.isEmpty) {
                                return "Please provide account";
                              }
                              return val.length < 3 ? "Account's length must longer than 3" : null; },
                            autofocus: false,
                            style: TextStyle(color: Colors.black),
                            keyboardType: TextInputType.name,
                            cursorColor: Colors.blue,
                            onChanged: (value) => name = value,
                            decoration: InputDecoration(
                                border: UnderlineInputBorder(),
                                labelText: "用户名",
                                labelStyle: new TextStyle(color: Colors.blue),
                                hintText: "请输入用户名",
                                prefixIcon: Icon(Icons.person, color: Colors.blue),
                                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue)))),
                        TextFormField(
                            controller: passwordTextEditingController,
                            validator: (val){
                              if (val.isEmpty) {
                                return "Please provide password";
                              }
                              return val.length < 5 ? "The password does not meet the requirements" : null; },
                            autofocus: false,
                            obscureText: true,
                            style: TextStyle(color: Colors.black),
                            keyboardType: TextInputType.number,
                            cursorColor: Colors.blue,
                            onChanged: (value) => password = value,
                            decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: "密码",
                            labelStyle: new TextStyle(color: Colors.blue),
                            hintText: "请输入密码",
                            prefixIcon: Icon(Icons.lock, color: Colors.blue),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue)))),
                        TextFormField(
                            controller: currentPasswordTextEditingController,
                            validator: (val){
                              if (val.isEmpty){
                                return "Please provide password";
                              }
                              return val != password ? "The passwords are different" : null;
                              },
                            autofocus: false,
                            obscureText: true,
                            style: TextStyle(color: Colors.black),
                            keyboardType: TextInputType.number,
                            cursorColor: Colors.blue,
                            onChanged: (value) => currentPassword = value,
                            decoration: InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: "密码",
                            labelStyle: new TextStyle(color: Colors.blue),
                            hintText: "再次输入密码",
                            prefixIcon: Icon(Icons.lock, color: Colors.blue),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue)))),
                        SizedBox(height: 20),
                        Container(
                          width: 420,
                          height: 50,
                          child: ElevatedButton(
                              style: ButtonStyle(shape: MaterialStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0)))),
                              onPressed: () async {
                                if(_formKey.currentState.validate()){
                                  await Firestore.instance.collection('User').where("name",isEqualTo: name).getDocuments().then((QuerySnapshot querySnapshot) =>
                                  {
                                    if(querySnapshot.documents.isEmpty){
                                      print("不存在"),
                                      Firestore.instance.collection('User').add({'name':name,'password': password}),
                                      Fluttertoast.showToast(msg: "This account is successfully registered", backgroundColor: Colors.white, textColor: Colors.green, gravity: ToastGravity.CENTER),
                                      Navigator.pop(context)

                                    }
                                    else {
                                      print("存在"),
                                      Fluttertoast.showToast(msg: "This account has been registered", backgroundColor: Colors.white, textColor: Colors.red, gravity: ToastGravity.CENTER),
                                      Navigator.pop(context)
                                    }
                                  });
                                }


                                // Firestore.instance.collection('User').where("name",isEqualTo: name).getDocuments().then((QuerySnapshot querySnapshot) => querySnapshot.documents.forEach((doc) => {
                                //   if(!doc.exists){
                                //     print("不存在")
                                //   } else {
                                //     print("存在")
                                // }
                                // }));
                                // Firestore.instance.collection('User').getDocuments().then((QuerySnapshot querySnapshot) => querySnapshot.documents.forEach((doc) => {
                                //   if(doc['name'] == name){
                                //     Fluttertoast.showToast(msg: "This account has been registered", backgroundColor: Colors.white, textColor: Colors.red, gravity: ToastGravity.CENTER)
                                //
                                //   } else {
                                //     Firestore.instance.collection('User').add({'name':name,'password':password}),
                                //     Fluttertoast.showToast(msg: "This account is successfully registered", backgroundColor: Colors.white, textColor: Colors.green, gravity: ToastGravity.CENTER)
                                //   }
                                // }));


                                // if (Firestore.instance.collection('User').where("name",isEqualTo: name).getDocuments() != null){
                                //   // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('This account has been registered')));
                                //   Fluttertoast.showToast(msg: "This account has been registered", backgroundColor: Colors.white, textColor: Colors.red, gravity: ToastGravity.CENTER);
                                // } else {
                                //   Firestore.instance.collection('User').add({'name':name,'password':password});
                                //   // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('This account is successfully registered')));
                                //   Fluttertoast.showToast(msg: "This account is successfully registered", backgroundColor: Colors.white, textColor: Colors.green, gravity: ToastGravity.CENTER);
                                // }
                                },
                              child: Text("Sign In")),
                        )
                      ],),)),
              )
            ],
          ),
        ),
      ),
    );
  }

}
