import 'package:flutter/material.dart';
import 'Users.dart';

class ProductDisplay extends StatefulWidget {
  const ProductDisplay({Key? key}) : super(key: key);

  @override
  _ProductDisplayState createState() => _ProductDisplayState();
}

class _ProductDisplayState extends State<ProductDisplay> {

  Map data = {};
  int size = 6;
  String? dropdownvalue = '6';
  var loc = ['6','8','10','12','14','16'];

  int index = 5;
  int value =3;
  int counter =1;

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;
    int price = data['price'];
    var points = int.parse(data['points']);
    List <UserProfile> users =[UserProfile(id: '00', username: 'Name', email: 'Email', password: 'Password', blgno: '00', street: '000', zone: '00', points: '0', voucher: 'p')];
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.grey[850],
        title: Text('Product'),
        leading: Container(),
        actions: [
          TextButton(
              onPressed: (){
                print(points);
                print(data['vouchers']);
                Navigator.pushNamed(context,'/HomePage',arguments: {
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
                  'vouchers' : data['vouchers'],
                  'users' : users,
                  'id' : '00'
                });
              },
              child: Text('Back to Home',style: TextStyle(color: Colors.white),)
          )
        ],
      ),
      body:  Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image(
                  image: NetworkImage(data['picture']),
                height: 500,
                width: 500,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('QR $price',style: TextStyle(fontSize: 30),),
                      Text(data['description'],style: TextStyle(fontSize: 24),),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 20,),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(5,
                                  (index) {return Icon(index < value ? Icons.star : Icons.star_border);}
                                  ),
                      ),
                      SizedBox(width: 20,),
                      Text('Size :', style: TextStyle(fontSize: 17),),
                      SizedBox(width: 20,),
                      DropdownButton(
                        value: dropdownvalue,
                        items: loc.map((String loc){
                          return DropdownMenuItem(
                            value: loc,
                            child: Text('$loc'),
                          );
                        }
                        ).toList(),
                        onChanged: (String? newValue){
                          setState(() {
                            dropdownvalue = newValue;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Text('No :', style: TextStyle(fontSize: 17),),
                  SizedBox(width: 20,),
                  Card(
                    child: SizedBox(
                      width: 30,
                        height: 30,
                        child: Center(child: Text('$counter')),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: TextButton(onPressed: (){setState(() {
                      counter+=1;
                    });}, child: Text('+')),
                  ),
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: TextButton(onPressed: (){setState(() {
                      counter -= 1;
                    });}, child: Text('-')),
                  ),
                ],
              ),
              SizedBox(height: 30,),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey[500]
                ),
                  onPressed: (){
                  Navigator.pushReplacementNamed(context, '/Select', arguments: {
                    'picture' : data['picture'],
                    'price' : data['price'].toString(),
                    'size' : dropdownvalue,
                    'counter' : counter.toString(),
                    'description' : data['description'],
                    'points' : points.toString(),
                    'vouchers' : data['vouchers'] == null ? 'p' : data['vouchers']
                  });
                  },
                label: Text('Add to Cart',style: TextStyle(color: Colors.black),),
                icon: Icon(Icons.shopping_bag_outlined, color: Colors.black,),
              )
            ],
          ),
        ),
    );
  }
}
