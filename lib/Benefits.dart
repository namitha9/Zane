import 'package:flutter/material.dart';
import 'PointList.dart';
import 'Users.dart';

class Benefits extends StatefulWidget {
  const Benefits({Key? key}) : super(key: key);

  @override
  _BenefitsState createState() => _BenefitsState();
}

class _BenefitsState extends State<Benefits> {

  Map data = {};
  int i=0;
  var poinT;

  List <PointList> pointlist = [
    PointList(point: '100', description: '5% off on Purchases above QR 200', i: '0'),
    PointList(point: '250', description: 'QR 25 off on Purchases above QR 200', i: '0') ,
    PointList(point: '300', description: 'Free Zane Limited Edition Bag', i: '0'),
    PointList(point: '500', description: 'QR 100 Voucher', i: '0'),
    PointList(point: '500', description: '25% CashBack on Purchases above QR 250', i: '0'),
    PointList(point: '750', description: '35% Off on your Next Purchase', i: '0'),
    PointList(point: '1000', description: 'Free Zane Goodie Box Worth QR 300 or more', i: '0')
  ];

  List <UserProfile> users = [];

  String count = '';

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;
    if (i==0){
      poinT = int.parse(data['points']);
      i=1;
    }

    void onPress(int point) {
      //pointS = points;
      //var result;
      if (poinT>=point) {
        showDialog(
            context: context,
            builder: (BuildContext context) =>
                AlertDialog(
                  title: Text('Claim'),
                  content: Text(
                      'Confirm to Claim $point points'),
                  actions: [
                    TextButton(
                        onPressed: () {
                          setState(() {
                            poinT = poinT-point;
                            count += point.toString()+',';
                            print(count);
                            //print(poinT);
                            //print(point);
                            Navigator.pop(context);
                          });
                        },
                        child: Text('Confirm')),
                    TextButton(onPressed: () {
                      Navigator.pop(context);
                    },
                        child: Text('Cancel')),
                  ],
                )
        );
      }
      else{
        showDialog(
            context: context,
            builder: (BuildContext context) =>
                AlertDialog(
                  title: Text('Claim Points'),
                  content: Text(
                      'You do not have enough points to claim this'),
                  actions: [
                    TextButton(onPressed: () {Navigator.pop(context);},
                        child: Text('Back')),
                  ],
                )
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
          actions: [
            TextButton(
                onPressed: (){
                  Navigator.pushReplacementNamed(context,'/HomePage',arguments: {
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
                    'points' : poinT.toString(),
                    'vouchers' : count,
                    'users' : users
                  });
                },
                child: Text('Back to Home', style: TextStyle(color: Colors.white),)
            )
          ]
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Points Earned :', style: TextStyle(fontSize: 17),),
                      Text('$poinT' , style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
                Card(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 10,),
                        Text('100 POINTS', style: TextStyle(letterSpacing: 5, fontSize: 11),),
                        SizedBox(height: 5,),
                        Text('5% off on Purchases above QR 200', style: TextStyle( fontSize: 18),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: (){onPress(100);},
                                child: Text('Claim >'),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 10,),
                        Text('250 POINTS', style: TextStyle(letterSpacing: 5, fontSize: 11),),
                        SizedBox(height: 5,),
                        Text('QR 25 off on Purchases above QR 200', style: TextStyle( fontSize: 18),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: (){onPress(250);} ,
                                child: Text('Claim >')
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 10,),
                        Text('300 POINTS', style: TextStyle(letterSpacing: 5, fontSize: 11),),
                        SizedBox(height: 5,),
                        Text('Free Zane Limited Edition Bag', style: TextStyle( fontSize: 18),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(onPressed: (){onPress(300);}, child: Text('Claim >')),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 10,),
                        Text('500 POINTS', style: TextStyle(letterSpacing: 5, fontSize: 11),),
                        SizedBox(height: 5,),
                        Text('QR 100 Voucher', style: TextStyle( fontSize: 18),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(onPressed: (){onPress(500);}, child: Text('Claim >')),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 10,),
                        Text('500 POINTS', style: TextStyle(letterSpacing: 5, fontSize: 11),),
                        SizedBox(height: 5,),
                        Text('25% CashBack on Purchases above QR 250', style: TextStyle( fontSize: 18),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(onPressed: (){onPress(500);}, child: Text('Claim >')),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 10,),
                        Text('750 POINTS', style: TextStyle(letterSpacing: 5, fontSize: 11),),
                        SizedBox(height: 5,),
                        Text('35% Off on your next Purchase', style: TextStyle( fontSize: 18),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(onPressed: (){onPress(750);}, child: Text('Claim >')),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Card(
                  margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 10,),
                        Text('1000 POINTS', style: TextStyle(letterSpacing: 5, fontSize: 11),),
                        SizedBox(height: 5,),
                        Text('Free Zane Goodie Box Worth QR 300 or More', style: TextStyle( fontSize: 18),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(onPressed: (){onPress(1000);}, child: Text('Claim >')),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
