import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;


class ProfileLogin extends StatefulWidget {
  final String user;
  const ProfileLogin({Key? key, required this.user})
      : super(key: key);
  @override
  State<ProfileLogin> createState() => _ProfileLoginState();
}

  
 

class _ProfileLoginState extends State<ProfileLogin> {
  @override
  void initState() {
    String user = widget.user;
    getUsers(user);
    super.initState();
  }
  int check = 0;
  List<dynamic> users = [];
  Future<void> getUsers(String user) async {
    String urlstr = 'http://172.21.242.214/addressbook/select_user.php';

    final url = Uri.parse(urlstr);
    final response = await http.post(
      url,
      body: {
        'username': user,
      },
    );
   // print(user);
    print(response.statusCode);
    if (response.statusCode == 200) {
      //Successful
      final json = response.body;
      final data = jsonDecode(json);
      debugPrint('Data: $data');
      if (data == 'Completed') {
        setState(() {
           check = 1; //Login Completed
         //  users = data[0];
         });
        print('Result: $users["fullname"]');
        // ignore: use_build_context_synchronously
        // Navigator.pushNamed(context, '/home', arguments: {
        //   'user': user.text,
        // });
      } else {
        Fluttertoast.showToast(
            msg: "Please check username or password",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.purple,
            textColor: Colors.white,
            fontSize: 16.0);
        print('Result: $data');
      }
    }
  }
  @override
  Widget build(BuildContext context) {
   // final fullname = users[0]["fullname"] ;
   // final username = users[0]["username"];
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.home),
      ),
      body:
      Column(
        children: [
          Text("บัญชีผู้ใช้"),
              ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.edit, size: 30,),
                ),
                title: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("test"),
                      Text("Peter Parker The spider"),
                    ],
                  ),
                ),
              )
            
          
        ],
      )
    );
  }
}