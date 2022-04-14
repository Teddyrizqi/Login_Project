import 'package:flutter/material.dart';
import 'ForgotPassword.dart';
import 'SignUp.dart';

void main() {
  runApp(MaterialApp(
    home: const MyApp(),
    debugShowCheckedModeBanner: false,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login Page",
      home: Scaffold(
        body: const SignIn(),
      ),
    );
  }
}

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
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
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                child: Text(
                  "Sign In",
                  style: TextStyle(fontSize: 30, color: Colors.blue[300]),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
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
              TextButton(
                child: Text("Forgot Password", style: TextStyle(color: Colors.blue, fontSize: 15)),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return forgotPass();
                  }));
                },
              ),
              Container(
                height: 50,
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: ElevatedButton(
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {
                    if (_formkey.currentState!.validate())
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return Success();
                      }));
                  },
                ),
              ),
              Column(
                children: [
                  Padding(padding: EdgeInsets.all(20)),
                  Text("Does not have account ? "),
                  TextButton(
                    child: Text(
                      "Create",
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return SignUp();
                      }));
                    },
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Success extends StatelessWidget {
  const Success({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              height: 250,
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.all(10),
              child: Text(
                "Login Successfully",
                style: TextStyle(fontSize: 30, color: Colors.blue[300]),
              ),
            ),
            Column(
              children: [
                Icon(
                  Icons.check,
                  size: 80,
                  color: Colors.blue[300],
                ),
              ],
            ),
            Column(
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
