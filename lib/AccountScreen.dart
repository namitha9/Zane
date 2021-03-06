import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'PointList.dart';
import 'Users.dart';

class AccountScreen extends StatefulWidget {
  final String total;
  final String name;
  final String email;
  final String blgno;
  final String street;
  final String zone;
  final String count;
  final String id;
  final List <UserProfile> users;
  const AccountScreen({Key? key, required this.total, required this.name, required this.email, required this.blgno, required this.street, required this.zone, required this.count, required this.users, required this.id}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {

  List <PointList> pointlist = [
    PointList(point: '100', description: '5% off on Purchases above QR 200', i: '0'),
    PointList(point: '250', description: 'QR 25 off on Purchases above QR 200', i: '0') ,
    PointList(point: '300', description: 'Free Zane Limited Edition Bag', i: '0'),
    PointList(point: '500', description: 'QR 100 Voucher', i: '0'),
    PointList(point: '500', description: '25% CashBack on Purchases above QR 250', i: '0'),
    PointList(point: '750', description: '35% Off on your Next Purchase', i: '0'),
    PointList(point: '1000', description: 'Free Zane Goodie Box Worth QR 300 or More', i: '0'),
  ];
  //List <UserProfile> usersc = [];
  List <UserProfile> users = [];

  @override
  Widget build(BuildContext context) {
    String points = widget.total;
    String blgno1 = widget.blgno;
    String street1 = widget.street;
    String zone1 = widget.zone;
    String count = widget.count;
    int h = 0;

    void changeDeets() {
      users = List.from(widget.users);
      for (UserProfile instance in users){
        if(instance.id==widget.id){
          users.elementAt(h).username = widget.name;
          users.elementAt(h).email = widget.email;
          users.elementAt(h).blgno = widget.blgno;
          users.elementAt(h).street = widget.street;
          users.elementAt(h).zone = widget.zone;
          users.elementAt(h).points = points;
          users.elementAt(h).voucher = count;
        }
        h++;
      }
    }

    return Scaffold(
      body: Container(
        color: Colors.grey[300],
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(5),
                          margin: EdgeInsets.all(5),
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage('https://image.shutterstock.com/image-vector/account-icon-vector-design-template-260nw-1627077943.jpg'),
                                  fit: BoxFit.cover
                              )
                          ),
                        ),
                        Text('Name',
                          style: TextStyle(color: Colors.black,fontSize: 20),),
                        TextButton(
                            onPressed: (){
                              Navigator.pushReplacementNamed(context, '/Edit', arguments: {
                                'name' : widget.name,
                                'email' : widget.email,
                                'blgno' : widget.blgno,
                                'street' : widget.street,
                                'zone' : widget.zone,
                                'points' : points.toString()
                              });
                            },
                            child: Text('EDIT PROFILE',style: TextStyle(letterSpacing: 4),),
                        ),
                        SizedBox(height: 40,),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 60, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Name ',style: TextStyle(color: Colors.black,fontSize: 15),),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                child: Text(widget.name ,style: TextStyle(color: Colors.black,fontSize: 23),),
                              ),
                              SizedBox(height: 20,),
                              Text('Email ',style: TextStyle(color: Colors.black,fontSize: 15)),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                child: Text(widget.email ,style: TextStyle(color: Colors.black,fontSize: 23)),
                              ),
                              SizedBox(height: 20,),
                              Text('Address', style: TextStyle(color: Colors.black,fontSize: 15),),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Building $blgno1,', style: TextStyle(color: Colors.black,fontSize: 23),),
                                    Text('Street $street1,', style: TextStyle(color: Colors.black,fontSize: 23),),
                                    Text('Zone $zone1', style: TextStyle(color: Colors.black,fontSize: 23),)
                                  ],
                                ),
                              ),
                              SizedBox(height: 30,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Zane Points ',style: TextStyle(color: Colors.black,fontSize: 15)),
                                  TextButton(
                                      onPressed: (){
                                        print('$points');
                                        Navigator.pushReplacementNamed(context, '/Benefits', arguments: {
                                          'points' : points,
                                          'pointlist' : pointlist,
                                          'count' : count
                                        });
                                      },
                                      child: Text('Check Benefits >')
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                                child: Text('$points',style: TextStyle(color: Colors.black,fontSize: 23)),
                              ),
                              SizedBox(height: 20,),
                              TextButton(
                                  onPressed: (){
                                    Navigator.pushReplacementNamed(context, '/VoucherDisplay',arguments: {
                                      'count' : count,
                                      'points' : points.toString()
                                    });
                                  },
                                  child: Text('Vouchers Claimed >')
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                            onPressed: (){
                              changeDeets();
                              print(users);
                              print(users.elementAt(0).username);
                              Navigator.pushReplacementNamed(context, '/Login', arguments: {
                            'name' : 'Name',
                            'email' : 'Email',
                            'password' : 'Password',
                            'blgno': '00',
                            'street' : '000',
                            'zone' : '00',
                            'vouchers' : 'p',
                                'points' : '0',
                                'users' : users
                          });
                          },
                            child: Text('Sign Out'))
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
