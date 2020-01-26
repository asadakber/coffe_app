import 'package:flutter/material.dart';
import 'package:flutter_app/modals/user.dart';
import 'package:flutter_app/screens/home/authenticate/authenticate.dart';
import 'package:flutter_app/screens/home/authenticate/home.dart';
import 'package:provider/provider.dart';
//import 'package:flutter_app/screens/home/authenticate/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);

    if(user == null) {
      return Authenticate();
    } else {
      return Home();
    }

    return Authenticate();
  }
}
