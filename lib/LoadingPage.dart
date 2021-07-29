import 'package:flutter/material.dart';

class loading extends StatefulWidget {
  const loading({Key? key}) : super(key: key);

  @override
  _loadingState createState() => _loadingState();
}

class _loadingState extends State<loading> {

  void loadin() async{
    await Future.delayed(Duration(seconds: 2),(){
      return Navigator.pushReplacementNamed(context, '/HomePage',arguments: {
        'picture' : 'p',
        'price' : 'p',
        'size' : 's',
        'counter' : 'c',
        'delete' : 'no',
        'name' : 'Name',
        'email' : 'Email',
        'blgno': '00',
        'street' : '000',
        'zone' : '00',
        'points' : '0',
        'vouchers' : 'p'
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
              Navigator.pushNamed(context, '/HomePage',arguments: {
                'picture' : 'p',
                'price' : 'p',
                'size' : 's',
                'counter' : 'c',
                'delete' : 'no',
                'name' : 'Name',
                'email' : 'Email',
                'blgno': '00',
                'street' : '000',
                'zone' : '00',
                'points' : '0',
                'vouchers' : 'p'
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
