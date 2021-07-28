import 'package:flutter/material.dart';

class ConfirmDeets extends StatefulWidget {
  const ConfirmDeets({Key? key}) : super(key: key);

  @override
  _ConfirmDeetsState createState() => _ConfirmDeetsState();
}

class _ConfirmDeetsState extends State<ConfirmDeets> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;
    String total = data['total'];
    var Total = int.parse(total);
    double pointS = Total/10;
    int points = pointS.toInt();
    Total = (Total>300) ? Total : Total+10;
    //String address = data['address'];
    String blgno = data['blgno'];
    String street = data['street'];
    String zone = data['zone'];
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
