import 'package:flutter/material.dart';
import 'ResetPass.dart';

import 'main.dart';

class forgotPass extends StatefulWidget {
  const forgotPass({Key? key}) : super(key: key);

  @override
  _forgotPassState createState() => _forgotPassState();
}

class _forgotPassState extends State<forgotPass> {
  final _formkey = GlobalKey<FormState>();
  bool passenable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: _formkey,
          child: Container(
            child: Column(
              children: [
                Container(
                  height: 250,
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Forgot Password ?",
                    style: TextStyle(fontSize: 30, color: Colors.blue[300]),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Email",
                      icon: Icon(Icons.email_outlined, size: 35),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please Input Your Email';
                      } else if (!value.contains("@")) {
                        return "Input your Correct Email";
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  height: 50,
                  width: 200,
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: ElevatedButton(
                    child: Text(
                      "Send Reset Link",
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return CheckEmail();
                      }));
                    },
                  ),
                ),
                Row(
                  children: [
                    Padding(padding: EdgeInsets.all(20)),
                    Text(
                      "Back to",
                      style: TextStyle(fontSize: 20),
                    ),
                    TextButton(
                      child: Text(
                        "Sign In",
                        style: TextStyle(fontSize: 20),
                      ),
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return SignIn();
                        }));
                      },
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.center,
                )
              ],
            ),
          )),
    );
  }
}

class CheckEmail extends StatelessWidget {
  const CheckEmail({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: <Widget>[
          Container(
            child: IconButton(
              icon: Icon(
                Icons.close,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SignIn();
                }));
              },
            ),
          ),
        ],
      ),
      body: Container(
          child: Column(
        children: <Widget>[
          Container(
            height: 250,
            alignment: Alignment.center,
            padding: EdgeInsets.all(10),
            child: Text(
              'Check Your Email',
              style: TextStyle(fontSize: 30),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
                "The password was sent to the email"
                "\nsprecified during regristration",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[750],
                ),
                textAlign: TextAlign.center),
          ),
          Column(
            children: [
              Icon(
                Icons.check,
                size: 80,
              ),
            ],
          ),
          Column(
            children: [
              Padding(padding: EdgeInsets.all(20)),
              Text('Redirection to', style: TextStyle(fontSize: 20)),
              TextButton(
                child: Text(
                  "Sign In",
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SignIn();
                  }));
                },
              ),
            ],
          ),
          Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 10)),
              Text('or', style: TextStyle(fontSize: 20)),
              TextButton(
                child: Text(
                  "Change a New Password",
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ResetPass();
                  }));
                },
              ),
            ],
          ),
        ],
      )),
    );
  }
}
