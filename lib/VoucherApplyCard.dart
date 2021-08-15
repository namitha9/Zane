import 'package:flutter/material.dart';
import 'package:zane_shop/PointList.dart';
import 'PointList.dart';

class VoucherApplyCard extends StatefulWidget {

  PointList pointlist;
  String total;
  String count;
  int totalpoints;

  VoucherApplyCard({Key? key, required this.pointlist, required this.total, required this.count, required this.totalpoints})
      : super(key: key);

  @override
  _VoucherApplyCardState createState() => _VoucherApplyCardState();
}


class _VoucherApplyCardState extends State<VoucherApplyCard> {

  @override
  Widget build(BuildContext context) {

    var indipoint = int.parse(widget.pointlist.point);
    var Total = double.parse(widget.total);
    String newvouch = '';

    return Card(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 10,),
            Text(widget.pointlist.description, style: TextStyle( fontSize: 18),),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: (){
                    setState(() {
                      String current = '';
                      for (int i=0;i<widget.count.length;i++){
                        String m = widget.count[i];
                        if(m!=','){
                          current+=m;
                        }
                        else{
                          if(int.parse(current)!=indipoint){
                            newvouch += current+',';
                          }
                        }
                      }
                      if (newvouch == ''){
                        newvouch = 'p';
                      }
                    });
                    //print(widget.pointlist.point);
                    print(newvouch);
                    //print(Total);
                    Navigator.pushReplacementNamed(context, '/Confirm',arguments: {
                      'total' : '-1',
                      'name' : Total.toString(),
                      'email' : 'Email',
                      'blgno': '00',
                      'street' : '000',
                      'zone' : widget.pointlist.point,
                      'vouchers' : newvouch,
                      'points' : widget.totalpoints
                  });
                    },
                  child: Text('Apply >'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}