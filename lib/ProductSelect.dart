import 'package:flutter/material.dart';

class ProductSelect extends StatefulWidget {
  const ProductSelect({Key? key}) : super(key: key);

  @override
  _ProductSelectState createState() => _ProductSelectState();
}

class _ProductSelectState extends State<ProductSelect> {
  Map data={};
  static int total = 0;
  String price = 'p';
  String picture = 'p';
  String size = 's';
  String counter = 'c';

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;
    price = data['price'];
    picture = data['picture'];
    size = data['size'];
    counter  = data['counter'];
    var points = int.parse(data['points']);
    var priCe = int.parse(price);
    var couNter = int.parse(counter);
    total = priCe*couNter;
    print(data);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        actions: [

        ],
      ),
      body: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Product :',style: TextStyle(color: Colors.black,fontSize: 20),),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Image(image: NetworkImage(data['picture']),height: 200,),
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Size: ',style: TextStyle(color: Colors.black,fontSize: 18)),
                  Text('$size',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('No of Pieces: ',style: TextStyle(color: Colors.black,fontSize: 18)),
                  Text('$counter',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Price per Piece: ',style: TextStyle(color: Colors.black,fontSize: 18)),
                  Text('QR $price',style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: 40,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total Amount: ', style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),
                  Text('QR $total', style: TextStyle(color: Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),
                ],
              ),
              SizedBox(height: 50,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                      onPressed: (){
                        Navigator.pushReplacementNamed(context,'/HomePage',arguments: {
                          'picture' : data['picture'],
                          'price' : data['price'],
                          'size' : data['size'],
                          'counter' : data['counter'],
                          'delete' : 'd',
                          'name' : 'Name',
                          'email' : 'Email',
                          'blgno': '00',
                          'street' : '000',
                          'zone' : '00',
                          'points' : points.toString()
                        });
                      },
                      child: Text('Confirm Item', style: TextStyle(color: Colors.white),),
                    style: ElevatedButton.styleFrom(primary: Colors.grey[600]),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushReplacementNamed(context,'/HomePage', arguments:{
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
                        'points' : points.toString()
                      });
                    },
                    child: Text('Change Item', style: TextStyle(color: Colors.white),),
                    style: ElevatedButton.styleFrom(primary: Colors.grey[600]),
                  ),
                ],
              )
            ],
          ),
        ),
      );
  }
}
