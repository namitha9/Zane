import 'package:flutter/material.dart';
import 'Item.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {

  Map data ={};
  int catindex = 0;
  List <TotalItem> totalItems = [];
  String points = '';

  Widget display(catindex){
    TotalItem instance = totalItems[catindex];
    String price = instance.price.toString();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        onPressed: (){
          Navigator.pushReplacementNamed(context, '/ProductDisplay',arguments: {
            'picture': instance.picture ,
            'price' : instance.price,
            'description' : instance.description,
            'points' : points,
            'vouchers' : data['vouchers']
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: NetworkImage(instance.picture),
              height: 180,
              width: 180,
            ),
            SizedBox(
                height: 10
            ),
            Text('QR $price',
              style: TextStyle(color: Colors.black),),
            Text(instance.description,
              style: TextStyle(color: Colors.black),)
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;
    totalItems = List.from(data['totalitems']);
    points = data['points'];
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
                  'points' : data['points'],
                  'vouchers' : 'p'
                });
              },
              child: Text('Back to Home', style: TextStyle(color: Colors.white),)
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton.icon(
                    onPressed: (){},
                    icon: Icon(Icons.filter_alt_outlined),
                  label: Text('FILTER',style: TextStyle(
                      color: Colors.black
                  ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[500],
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: (){},
                  icon: Icon(Icons.sort),
                  label: Text('SORT BY',style: TextStyle(
                      color: Colors.black
                  ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey[500],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                display(0),
                display(1),
              ],
            ),
          Row(
              children: [
                display(2),
                display(3),
              ],
          ),
            Row(
              children: [
              display(4),
                display(5),
              ],
    ),
            Row(
              children: [
                display(6),
                display(7),
              ],
            ),
            Row(
              children: [
                display(8),
                display(9),
              ],
            )
          ],
        ),
      ),
    );
  }
}
