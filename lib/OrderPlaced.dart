import 'package:flutter/material.dart';
import 'Users.dart';

class OrderPlaced extends StatefulWidget {
  const OrderPlaced({Key? key}) : super(key: key);

  @override
  _OrderPlacedState createState() => _OrderPlacedState();
}

class _OrderPlacedState extends State<OrderPlaced> {

  Map data={};
  String poInts = '';
  static int total = 0 ;
  List <UserProfile> users = [];

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;
    poInts = data['points'];
    //poInts = poInts.toString();
    var Points = int.parse(poInts);
    print(total);
    //total += Points;
    //print(total);
    Points = 0;
    //print(data['vouchers']);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        actions: [
          TextButton(
              onPressed: (){
                Navigator.pushReplacementNamed(context,'/HomePage', arguments: {
                'picture' : 'p',
                'price' : 'p',
                'size' : 's',
                'counter' : 'c',
                  'delete' : 'yes',
                  'name' : 'Name',
                  'email' : 'Email',
                  'blgno': '00',
                  'street' : '000',
                  'zone' : '00',
                  'points' : poInts.toString(),
                  'vouchers' : data['vouchers'],
                  'users' : users
                });
              },
              child: Text('Back to Home',style: TextStyle(color: Colors.white),)
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: NetworkImage('https://nicefuntours.com/wp-content/uploads/2019/12/ShyCautiousAfricanpiedkingfisher-max-1mb.gif'),
                height: 200,
              ),
              SizedBox(height: 25,),
              Text('Your order has', style: TextStyle(fontSize: 30),),
              Text('been placed!', style: TextStyle(fontSize: 30),),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Order Receipt has been sent to : '),
                  Text(data['email']),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
