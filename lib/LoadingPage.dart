import 'package:flutter/material.dart';

class loading extends StatefulWidget {
  const loading({Key? key}) : super(key: key);

  @override
  _loadingState createState() => _loadingState();
}

class _loadingState extends State<loading> {

  void loadin() async{
    await Future.delayed(Duration(seconds: 2),(){
      return Navigator.pushNamed(context, '/Login');
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
              Navigator.pushNamed(context, '/Login');
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
