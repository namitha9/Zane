import 'package:flutter/material.dart';
import 'package:zane_shop/PointList.dart';
import 'PointList.dart';

class VoucherCard extends StatefulWidget {

  PointList pointlist;

  VoucherCard({Key? key, required this.pointlist})
      : super(key: key);

  @override
  _VoucherCardState createState() => _VoucherCardState();
}


class _VoucherCardState extends State<VoucherCard> {

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
            SizedBox(height: 10,)
          ],
        ),
      ),
    );
}
}