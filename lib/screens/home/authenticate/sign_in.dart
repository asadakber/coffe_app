import 'package:flutter/material.dart';
import 'package:flutter_app/services/auth.dart';
import 'package:flutter_app/shared/constant.dart';
import 'package:flutter_app/shared/loading.dart';

class SignIn extends StatefulWidget {

  final Function toggleView;
  SignIn({ this.toggleView });

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  // text field state

  String email = "";
  String password = "";
  String error = "";


  @override
  Widget build(BuildContext context) {
    return loading ? Loading() : Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign in to Brew Crew'),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: (){
                widget.toggleView();
              },
              icon: Icon(Icons.person),
              label: Text('Register'),
          ),

        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/coffee_bg.png'),
            fit: BoxFit.cover
          )
        ),
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'Email'),
                  validator: (val) => val.isEmpty ? 'Enter a Email': null,
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  decoration: textInputDecoration.copyWith(hintText: 'password'),
                  obscureText: true,
                  validator: (val) => val.length < 6 ?  'Enter a password 6 + chars long': null,
                  onChanged: (val) {
                    setState(() => password = val);
                  },
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                    color: Colors.brown,
                    child: Text(
                      'Sign in',
                      style: TextStyle(
                          color:  Colors.white,
                      ),
                    ),
                  onPressed: () async {
                    if(_formKey.currentState.validate()) {
                      setState(() => loading = true);
                        dynamic result = await _auth.signInWithEmailAndPassword(email, password);
//                      print('valid');
                      if(result == null) {
                        setState(() {
                          error = 'COULD NOT SIGN IN WITH THOSE CREDENTIALS';
                          loading = false;
                        });
                      }
//                      print(email);
//                      print(password);
                    }
                  },
                ),
                SizedBox(height: 12.0,),
                Text(
                  error,
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 14.0
                  ),
                )
              ],

            ),
          ),
//        child: RaisedButton(
//          child: Text('Sign in anon'),
//          onPressed: () async {
//              dynamic result = await _auth.signInAnom();
//              if(result == null) {
//                print('error signin in');
//              } else {
//                print('signin in');
//                print(result.uid);
//              }
//          },
//        ),
      ),
    );
  }
}
