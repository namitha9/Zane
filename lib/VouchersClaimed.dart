import 'package:flutter/material.dart';
import 'VoucherCard.dart';
import 'PointList.dart';
import 'Users.dart';

class VoucherClaimed extends StatefulWidget {
  const VoucherClaimed({Key? key}) : super(key: key);

  @override
  _VoucherClaimedState createState() => _VoucherClaimedState();
}

class _VoucherClaimedState extends State<VoucherClaimed> {

  Map data = {};
  static List <PointList> pointlist =  [
    PointList(point: '100', description: '5% off on Purchases above QR 200', i: '0'),
    PointList(point: '250', description: 'QR 25 off on Purchases above QR 200', i: '0') ,
    PointList(point: '300', description: 'Free Zane Limited Edition Bag', i: '0'),
    PointList(point: '500', description: 'QR 100 Voucher', i: '0'),
    PointList(point: '500', description: '25% CashBack on Purchases above QR 250', i: '0'),
    PointList(point: '750', description: '35% Off on your Next Purchase', i: '0'),
    PointList(point: '1000', description: 'Free Zane Goodie Box Worth QR 300 or More', i: '0'),
  ];
  List <UserProfile> users =[UserProfile(id: '00', username: 'Name', email: 'Email', password: 'Password', blgno: '00', street: '000', zone: '00', points: '0', voucher: 'p')];
  static String count = '';
  int i =0;
  var point;
  //int cat = 0;
  int b = 0;
  List <int> counter = [];
  String current = '';
  int dog = 0;

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;
    List <PointList> pointList = [];
    count = data['count'];
    if (i==0){
      //poinT = int.parse(data['points']);
      //pointlist = List.from(data['pointlist']);
      dog = count.length;

      for (int k=0;k<dog;k++){
        String m = count[k];
        //print (m);
        if(m!=','){
          current += m;
        }
        else {
          var curint = int.parse(current);
          counter.add(curint);
          current = '';
          //print(curint);
        }
      }
      i=1;
    }

    counter.sort();
    //print(counter);

    for (int t in counter){
      //print(t);
      for (PointList instance in pointlist){
        point = int.parse(instance.point);
        //print(point);
        if(t==point){
          pointList.add(PointList(point : instance.point , description : instance.description, i : instance.i ));
          break;
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.grey[850],
          leading: Container(),
          actions: [
            TextButton(
                onPressed: (){
                  print(count);
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
                    'points' : data['points'],
                    'vouchers' : count,
                    'users' : users,
                    'id' : '00'
                  });
                },
                child: Text('Back to Home', style: TextStyle(color: Colors.white),)
            )
          ]
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Your Vouchers', style: TextStyle(fontSize: 25),),
                SizedBox(height: 10,),
                Text('the vouchers you have claimed and can apply these vouchers to the next purchase', style: TextStyle(fontSize: 13),),
                Column(
                  children: pointList.map((e) => VoucherCard(
                    pointlist: e,
                  )).toList(),
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}
