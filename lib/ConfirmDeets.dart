import 'package:flutter/material.dart';
import 'PointList.dart';

class ConfirmDeets extends StatefulWidget {
  const ConfirmDeets({Key? key}) : super(key: key);

  @override
  _ConfirmDeetsState createState() => _ConfirmDeetsState();
}

class _ConfirmDeetsState extends State<ConfirmDeets> {
  Map data = {};
  String blgno = '00';
  String street = '000';
  String zone = '00';
  var Total;
  int points = 0;
  String vouchers = '';
  String offerno = '';
  String op = '';
  String restric = '';
  String extra = 'None';
  int y=0;
  double tot=0;
  int totalpoints = 0;
  int totalp = 0;

  static List <PointList> pointlist =  [
    PointList(point: '100', description: '5% off on Purchases above QR 200', i: '5%200'),
    PointList(point: '250', description: 'QR 25 off on Purchases above QR 200', i: '25-200') ,
    PointList(point: '300', description: 'Free Zane Limited Edition Bag', i: '0,0'),
    PointList(point: '500', description: 'QR 100 Voucher', i: '100v0'),
    PointList(point: '500', description: '25% CashBack on Purchases above QR 250', i: '25%250'),
    PointList(point: '750', description: '35% Off on your Next Purchase', i: '35%0'),
    PointList(point: '1000', description: 'Free Zane Goodie Box Worth QR 300 or More', i: '0,0'),
  ];

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;
    print('n');

    bool isNumeric(String s){
      if(s==null){
        return false;
      }
      return int.tryParse(s) != null;
    }

    if(data['total']!='-1' && data['vouchers']!='v'){
      print('first');
      String total = data['total'];
      Total = double.parse(total);
      double pointS = Total/10;
      points = pointS.toInt();
      //Total = (Total>300) ? Total : Total+10;
      //String address = data['address'];
      blgno = data['blgno'];
      street = data['street'];
      zone = data['zone'];
      vouchers = data['vouchers'];
      totalpoints = data['points'];
      totalp = totalpoints+points;
      tot = double.parse(Total.toStringAsFixed(2));
      if(tot<300){
        tot+=10;
      }
    }

    if(data['total']=='-1' && data['vouchers']!='v'){
      print('second');
      String total = data['name'];
      print(total);
      Total = double.parse(total);
      double pointS = Total/10;
      points = pointS.toInt();
      Total = (Total>300) ? Total : Total+10;
      vouchers = data['vouchers']=='p' ? '' : data['vouchers'];
      totalpoints = data['points'];
      totalp = totalpoints+points;
      if(y==0) {
        for (PointList instance in pointlist) {
          if (instance.point == data['zone']) {
            int x = 1;
            for (int t = 0; t < x; t++) {
              if (isNumeric(instance.i[t])) {
                offerno += instance.i[t];
                x++;
              }
              else {
                op = instance.i[t];
                restric = instance.i.substring(t + 1, instance.i.length);
              }
            }
            print(offerno);
            print(op);
            print(restric);
          }
        }
        y=1;
      }

      if(int.parse(restric)<=Total){
        if(op == '%'){
          var pri = int.parse(offerno)*(Total/100);
          print(pri);
          print(Total);
          Total -= pri;
          print(Total);
        }
        if(op == '-'){
          Total = Total - int.parse(offerno);
        }
        if(op == ','){
          extra = 'Free Stuff';
        }
        if(op == 'v'){
          extra = 'QR 100 Voucher to be delivered';
        }
      }
      tot = double.parse(Total.toStringAsFixed(2));
    }

    if(data['total']!='-1' && data['vouchers']=='v'){
      print('third');
      String total = data['total'];
      Total = double.parse(total);
      double pointS = Total/10;
      points = pointS.toInt();
      vouchers = data['vouchers'];
      totalpoints = data['points'];
      totalp = totalpoints+points;
      tot = double.parse(Total.toStringAsFixed(2));
    }
    print(data['vouchers']);



    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('PLEASE CONFIRM YOUR ORDER : ',style: TextStyle(fontSize: 20),),
            SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total Amount to be Paid: ' ,style: TextStyle(fontSize: 17)),
                Text(' $tot' ,style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold)),
              ],
            ),
            Text('(with shipping costs)' ,style: TextStyle(fontSize: 12)),
            SizedBox(height: 20,),
            Text('Extra :  $extra' ,style: TextStyle(fontSize: 15)),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: (){
                  print(data['vouchers']);
                  print(vouchers);
                  Navigator.pushReplacementNamed(context, '/Voucher', arguments: {
                    'count' : vouchers,
                    //'points' : points.toString(),
                    'total' : Total.toString(),
                    'totalpoints' : totalpoints,
                    'name' : data['name'],
                    'email' : data['email'],
                    'blgno' : blgno,
                    'street' : street,
                    'zone' : zone
                  });
                },
                child: Text('Apply Voucher >')),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Shipping Address:' ,style: TextStyle(fontSize: 17)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('Building $blgno' ,style: TextStyle(fontSize: 18)),
                    Text('Street $street' ,style: TextStyle(fontSize: 18)),
                    Text('Zone $zone' ,style: TextStyle(fontSize: 18)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 40,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                    onPressed: (){
                      print(points);
                      print(vouchers);
                      Navigator.pushReplacementNamed(context, '/Payment', arguments: {
                        'points' : totalp.toString(),
                        'email' : data['email'],
                        'vouchers' : vouchers
                      });
                      },
                    child: Text('CONFIRM'),
                    style: ElevatedButton.styleFrom(primary: Colors.grey[600])
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
