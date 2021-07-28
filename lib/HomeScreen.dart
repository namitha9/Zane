import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final Widget menswear;
  final Widget womenswear;
  const HomeScreen({Key? key,required this.menswear,required this.womenswear}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int selectindex = 0;
  String itemName = '';
  String itemPrice= '';

  Widget differentpage() {
    if (selectindex == 0){
        return widget.menswear;
    }
    else {
      return widget.womenswear;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[300],
        child: Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: SingleChildScrollView(
              child: Column(
                children: [

                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          onPressed: (){
                            setState(() {
                              selectindex = 0;
                            });
                          },
                          child: Text('Men',
                          style: TextStyle(
                            color: Colors.black
                          ),),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey[500],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: (){
                          setState(() {
                            selectindex = 1;
                          });
                        },
                        child: Text('Women',
                          style: TextStyle(
                              color: Colors.black
                          ),),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                  differentpage()
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}

