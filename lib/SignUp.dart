import 'package:flutter/material.dart';
import 'main.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formkey = GlobalKey<FormState>();
  bool passenable = true;
  bool nilaiCheck = false;

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
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                child: Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 30, color: Colors.blue[300]),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Name',
                    icon: Icon(Icons.account_circle_outlined, size: 35),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Please Input Your Name';
                    }
                    return null;
                  },
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
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  obscureText: passenable,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: "Password",
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
                child: Column(
                  children: [
                    Padding(padding: EdgeInsets.only(top: 20)),
                    CheckboxListTile(
                      title: Text("You accept Termly's Cookie & Policy"),
                      subtitle: Text("Checklist this CheckBox if you accept it"),
                      value: nilaiCheck,
                      activeColor: Colors.blue[800],
                      onChanged: (value) {
                        setState(() {
                          nilaiCheck = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
              Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: ElevatedButton(
                  child: Text(
                    "Create Account",
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    if (_formkey.currentState!.validate())
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return Regreting();
                      }));
                  },
                ),
              ),
              Column(
                children: [
                  Padding(padding: EdgeInsets.all(10)),
                  Text(
                    'Back To',
                    style: TextStyle(fontSize: 15),
                  ),
                  TextButton(
                    child: Text("Sign In", style: TextStyle(color: Colors.blue, fontSize: 15)),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return SignIn();
                      }));
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Regreting extends StatelessWidget {
  const Regreting({Key? key}) : super(key: key);

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
              height: 200,
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.all(10),
              child: Text(
                'Thank you for Registering',
                style: TextStyle(fontSize: 35),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                  "Lorem ipsum dolor sit amet, "
                  "\nconsectetur adipiscing elit.",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[750],
                  ),
                  textAlign: TextAlign.center),
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
            Column(
              children: [
                Padding(padding: EdgeInsets.all(20)),
                Text('Back to', style: TextStyle(fontSize: 20)),
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
            ),
          ],
        ),
      ),
    );
  }
}
