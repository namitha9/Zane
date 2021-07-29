import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;
    if(data['total']!=-1 && data['vouchers']!='v'){
      String total = data['total'];
      Total = int.parse(total);
      double pointS = Total/10;
      points = pointS.toInt();
      Total = (Total>300) ? Total : Total+10;
      //String address = data['address'];
      blgno = data['blgno'];
      street = data['street'];
      zone = data['zone'];
      vouchers = data['vouchers'];
    }
    if(data['total']==-1 && data['vouchers']!='v'){
      Total = Total-int.parse(data['vouchers']);
      vouchers = data['vouchers'];
    }
    if(data['total']!=-1 && data['vouchers']=='v'){
      String total = data['total'];
      Total = int.parse(total);
      double pointS = Total/10;
      points = pointS.toInt();
    }
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
                Text(' $Total' ,style: TextStyle(fontSize: 23)),
              ],
            ),
            Text('(with shipping costs)' ,style: TextStyle(fontSize: 12)),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: (){
                  print(data['vouchers']);
                  print(vouchers);
                  Navigator.pushReplacementNamed(context, '/Voucher', arguments: {
                    'count' : vouchers,
                    'points' : points.toString(),
                    'total' : Total.toString()
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
                      Navigator.pushReplacementNamed(context, '/Payment', arguments: {
                        'points' : points.toString(),
                        'email' : data['email']
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
