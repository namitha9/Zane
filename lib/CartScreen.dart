import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  Map data ={};
  static List <Map> items = [];
  static int total = 0;
  String price = 'p';
  String picture = 'p';
  String size = 's';
  String counter = 'c';
  String delete = 'no';

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;
    //print(data);
    print(data['items']);
    print(data['vouchers']);
    if (data['items'] != null){
      items = List.from(data['items']);
    }
    //print(items);
    var Total = int.parse(data['total']);
    var points = int.parse(data['points']);
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
                  'points' : points.toString(),
                  'vouchers' : data['vouchers']
                });
              },
              child: Text('Back to Home', style: TextStyle(color: Colors.white),)
            )
          ]
      ),
      body: Container(
        color: Colors.grey[300],
        child: Center(
          child:Padding(
              padding: EdgeInsets.fromLTRB(20, 40, 20, 0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text('Cart',style: TextStyle(fontSize: 25),),
                        DataTable(
                          columns : [
                            DataColumn(label: Text('Item')),
                            DataColumn(label: Text('Size')),
                            DataColumn(label: Text('No.')),
                            DataColumn(label: Text('Amount'))
                          ],
                          //rows: [
                            //DataRow(
                               // cells: [
                                //  DataCell(Text('Shirt')),
                                 // DataCell(Text('QR 45'))
                               // ]
                           // )
                        //  ],
                          rows:
                            items
                                .map(
                              ((e) => DataRow(
                              cells: <DataCell>[
                                DataCell((items.isEmpty) ? Text(' '): Image(image: NetworkImage(e['picture']),height: 40,width: 40,)),
                                DataCell((items.isEmpty) ? Text(' '): Text(e['size'])),
                                DataCell((items.isEmpty) ? Text(' '): Text(e['counter'])),
                                DataCell((items.isEmpty) ? Text(' '): Text(e['price'])),
                             ],
                            )),
                        ).toList(),
                        ),
                        ]
              ),
                        SizedBox(height: 30,),
                        Column(
                          children: [
                            Text('Total = QR $Total',
                              style: TextStyle(
                                fontSize: 20
                              ),
                            ),
                            ElevatedButton(
                              onPressed: (){
                                print(data['vouchers']);
                                Navigator.pushReplacementNamed(context, '/Confirm', arguments:{
                                  'total' : Total.toString() ,
                                  'name' : data['name'],
                                  'email' : data['email'],
                                  'blgno': data['blgno'],
                                  'street' : data['street'],
                                  'zone' : data['zone'],
                                  'vouchers' : data['vouchers']
                                });
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.grey[600]
                              ),
                              child: Text('Check Out ->'),
                            ),
                          ],
                        ),

                  ],
                ),
              ),
            ),
          ),
        ),
      );
  }
}
