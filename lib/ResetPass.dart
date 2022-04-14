import 'package:flutter/material.dart';

import 'main.dart';

class ResetPass extends StatefulWidget {
  const ResetPass({Key? key}) : super(key: key);

  @override
  _ResetPassState createState() => _ResetPassState();
}

class _ResetPassState extends State<ResetPass> {
  final _formkey = GlobalKey<FormState>();
  bool passenable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: _formkey,
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  height: 150,
                  alignment: Alignment.bottomCenter,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Reset Password",
                    style: TextStyle(fontSize: 30, color: Colors.blue[300]),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    obscureText: passenable,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "New Password",
                      suffix: IconButton(
                        onPressed: () {
                          setState(() {
                            if (passenable) {
                              passenable = false;
                            } else {
                              passenable = true;
                            }
                          });
                        },
                        icon: Icon(passenable == true ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                      ),
                      icon: Icon(Icons.lock_outlined, size: 35),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please Input Your Password';
                      } else if (value.length < 8) {
                        return 'Password less than 8 Characters';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  child: TextFormField(
                    obscureText: passenable,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "Confirm Password",
                      suffix: IconButton(
                        onPressed: () {
                          setState(() {
                            if (passenable) {
                              passenable = false;
                            } else {
                              passenable = true;
                            }
                          });
                        },
                        icon: Icon(passenable == true ? Icons.visibility_outlined : Icons.visibility_off_outlined),
                      ),
                      icon: Icon(Icons.lock_outlined, size: 35),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please Input Your Password';
                      } else if (value.length < 8) {
                        return 'Password less than 8 Characters';
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
                      "Update Password",
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      if (_formkey.currentState!.validate())
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return UpdatePass();
                        }));
                    },
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

class UpdatePass extends StatelessWidget {
  const UpdatePass({Key? key}) : super(key: key);

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
          children: [
            Container(
              height: 150,
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.all(10),
              child: Text(
                "Reset Password",
                style: TextStyle(fontSize: 30, color: Colors.blue[300]),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                  "Your password has been reset"
                  "\nsuccesfully",
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
            Container(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: ElevatedButton(
                child: Text(
                  "Continue Shopping",
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return SignIn();
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
                    "Home",
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
      ),
    );
  }
}
