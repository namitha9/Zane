import 'package:flutter/material.dart';
import 'Users.dart';

class loading extends StatefulWidget {
  const loading({Key? key}) : super(key: key);

  @override
  _loadingState createState() => _loadingState();
}

class _loadingState extends State<loading> {

  List <UserProfile> users =[UserProfile(id: '00', username: 'Name', email: 'Email', password: 'Password', blgno: '00', street: '000', zone: '00', points: '0', voucher: 'p')];

  void loadin() async{
    await Future.delayed(Duration(seconds: 2),(){
      return Navigator.pushReplacementNamed(context, '/Login', arguments: {
        'name' : 'Name',
        'email' : 'Email',
        'password' : 'Password',
        'blgno': '00',
        'street' : '000',
        'zone' : '00',
        'vouchers' : 'p',
        'points' : '0',
        'users' : users
      });
    });
  }

  @override
  void initState(){
    super.initState();
    loadin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 100, 20, 0),
          child: TextButton(
            onPressed: (){
              Navigator.pushReplacementNamed(context, '/Login',arguments: {
                'name' : 'Name',
                'email' : 'Email',
                'password' : 'Password',
                'blgno': '00',
                'street' : '000',
                'zone' : '00',
                'vouchers' : 'p',
                'points' : '0',
                'users' : users
              });
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                 'assets/images/zane.png',
                  height: 200,
                ),
              ],
            ),
          ),
        ),
      ),

    );
  }
}
