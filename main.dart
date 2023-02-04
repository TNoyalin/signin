import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();
  bool test = true;
  check(String user, String pass) {
    if (user == "Noyalin" && pass == "1998") {
      return true;
    } else {
      return false;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.6,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: username,
                maxLength: 30,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.account_box),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 3,
                      color: Colors.greenAccent,
                    )
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: Colors.redAccent
                    )
                  ),
                  hintText: "username",
                ),
              ),
              TextField(
                controller: password,
                maxLength: 15,
                obscureText: true,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.no_encryption),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 3,
                          color: Colors.greenAccent,
                        )
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            width: 2,
                            color: Colors.redAccent
                        )
                    ),
                    hintText: "password"),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.6,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                  ),
                  onPressed: () {
                    setState(() {
                      test = check(username.text, password.text);
                      if ('$test' == "true") {
                        _onSuccesAlertPressed(context);
                      } else {
                        _onErrorAlertPressed(context);
                      }
                    });
                  },
                  child: Text('Login'),
                ),
              ), // Text('$test'),
            ],
          ),
        ),
      ),
    );
  }
}
_onSuccesAlertPressed(context) {
  Alert(
    buttons: [
      DialogButton(
        color: Colors.green,
        onPressed: () => Navigator.pop(context),
        child: Text(
          "Proceed",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      )
    ],
    context: context,
    type: AlertType.success,
    title: "LOGIN SUCCESS",
    desc: "Hey NOYALIN.Welcome Back",
  ).show();
}
_onErrorAlertPressed(context) {
  Alert(
    buttons: [
      DialogButton(
        color: Colors.red,
        onPressed: () => Navigator.pop(context),
        child: Text(
          "Try Again",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      )
    ],
    context: context,
    type: AlertType.error,
    title: "LOGIN FAILED",
    desc: "Wrong Username or Password.Enter Proper detail",
  ).show();
}
