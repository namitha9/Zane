import 'package:flutter/material.dart';
import 'package:zane_shop/PointList.dart';
import 'PointList.dart';

class VoucherApplyCard extends StatefulWidget {

  PointList pointlist;

  VoucherApplyCard({Key? key, required this.pointlist})
      : super(key: key);

  @override
  _VoucherApplyCardState createState() => _VoucherApplyCardState();
}


class _VoucherApplyCardState extends State<VoucherApplyCard> {

  @override
  Widget build(BuildContext context) {

    var indipoint = int.parse(widget.pointlist.point);

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
                    Navigator.pushReplacementNamed(context, '/Confirm',arguments: {
                      'total' : -1,
                      'name' : 'Name',
                      'email' : 'Email',
                      'blgno': '00',
                      'street' : '000',
                      'zone' : '00',
                      'vouchers' : widget.pointlist.point.toString()
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