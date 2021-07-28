import 'package:flutter/material.dart';
import 'VoucherCard.dart';
import 'PointList.dart';

class VoucherClaimed extends StatefulWidget {
  const VoucherClaimed({Key? key}) : super(key: key);

  @override
  _VoucherClaimedState createState() => _VoucherClaimedState();
}

class _VoucherClaimedState extends State<VoucherClaimed> {

  Map data = {};
  static List <PointList> pointlist = [];
  static String count = '';
  int i =0;
  var point;
  int cat = 0;
  int b = 0;
  List <int> counter = [];
  String current = '';
  int dog = 0;

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;
    if (i==0){
      //poinT = int.parse(data['points']);
      pointlist = List.from(data['pointlist']);
      count = data['count'];
      dog = count.length;

      for (int k=0;k<dog;k++){
        String m = count[k];
        print (m);
        if(m!=','){
          current += m;
        }
        else {
          var curint = int.parse(current);
          counter.add(curint);
          current = '';
          print(curint);
        }
      }
      i=1;
    }

    print(counter);

    for (PointList instance in pointlist){
      point = int.parse(instance.point);
      print(point);
      for (int t in counter){
        print(t);
        if(t!=point){
          pointlist.removeAt(cat);
        }
        else{
          break;
        }
      }
      cat++;
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
                    'points' : '1000'
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
                  children: pointlist.map((e) => VoucherCard(
                    pointlist: e,
                  )).toList(),
                ),
                ElevatedButton(onPressed: (){print(pointlist[0].i);}, child: Text('list data')),
              ],
            ),
          )
        ),
      ),
    );
  }
}
