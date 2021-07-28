import 'package:flutter/material.dart';
import 'package:zane_shop/Item.dart';
import 'Item.dart';

class CardDisplay extends StatefulWidget {

  final TotalItem item;
  final String points;
  const CardDisplay({Key? key, required this.item,required this.points}) : super(key: key);

  @override
  _CardDisplayState createState() => _CardDisplayState();
}

class _CardDisplayState extends State<CardDisplay> {
  @override
  Widget build(BuildContext context) {
    int price = widget.item.price;
    return Flexible(
      child: Container(
        //width: 200,
        //constraints: BoxConstraints(
          //maxHeight: double.minPositive,
         // maxWidth: double.maxFinite
        //),
        //height: 300,
        width: MediaQuery.of(context).size.width-100,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image(
                            image: NetworkImage(widget.item.picture),
                          height: 150,
                          width: 150,
                        ),
                        Column(
                          //crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text(
                              'QR $price',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 3.0,
                            ),
                            Text(
                              widget.item.description,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 8),
                            TextButton.icon(
                              onPressed: (){
                                Navigator.pushReplacementNamed(context, '/ProductDisplay', arguments: {
                                  'picture': widget.item.picture ,
                                  'price' : widget.item.price,
                                  'description' : widget.item.description,
                                  'points' : widget.points
                                });
                              },
                              label: Text('Check Product'),
                              icon: Icon(Icons.next_week_outlined),
                            ),
                          ],
                        ),
                      ],
                    ),
            SizedBox(height: 20,),
          ],
        )
            )
        );
  }
}
