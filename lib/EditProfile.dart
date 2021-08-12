import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController blgno = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController zone = TextEditingController();
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Text(
                'NAME',
                style: TextStyle(
                  letterSpacing: 4,
                  fontSize: 12
                ),
              ),
              TextFormField(
                controller: name,
                decoration: InputDecoration(
                    hintText: data['name'],
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    )
                ),
              ),
              SizedBox(height: 20,),
              Text(
                'EMAIL',
                style: TextStyle(
                    letterSpacing: 4,
                    fontSize: 12
                ),
              ),
              TextFormField(
                controller: email,
                decoration: InputDecoration(
                    hintText: data['email'],
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    )
                ),
              ),
              SizedBox(height: 20,),
              Text(
                'BUILDING',
                style: TextStyle(
                    letterSpacing: 4,
                    fontSize: 12
                ),
              ),
              TextFormField(
                controller: blgno,
                decoration: InputDecoration(
                    hintText: data['blgno'],
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    )
                ),
              ),
              SizedBox(height: 20,),
              Text(
                'STREET',
                style: TextStyle(
                    letterSpacing: 4,
                    fontSize: 12
                ),
              ),
              TextFormField(
                controller: street,
                decoration: InputDecoration(
                    hintText: data['street'],
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    )
                ),
              ),
              SizedBox(height: 20,),
              Text(
                'ZONE',
                style: TextStyle(
                    letterSpacing: 4,
                    fontSize: 12
                ),
              ),
              TextFormField(
                controller: zone,
                decoration: InputDecoration(
                    hintText: data['zone'],
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    )
                ),
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: (){
                        Navigator.pushReplacementNamed(context, '/HomePage',arguments: {
                          'picture' : 'p',
                          'price' : 'p',
                          'size' : 's',
                          'counter' : 'c',
                          'delete' : 'no',
                          'name' : name.text=='' ? data['name'] : name.text,
                          'email' : email.text=='' ? data['email'] : email.text,
                          'blgno': blgno.text=='' ? data['blgno'] : blgno.text,
                          'street' : street.text=='' ? data['street'] : street.text,
                          'zone' : zone.text=='' ? data['zone'] : zone.text,
                          'points' : data['points'],
                          'vouchers' : 'p'
                        });
                      },
                      child: Text('Update Info')
                  ),
                  ElevatedButton(
                      onPressed: (){
                        Navigator.pushReplacementNamed(context, '/HomePage',arguments: {
                          'picture' : 'p',
                          'price' : 'p',
                          'size' : 's',
                          'counter' : 'c',
                          'delete' : 'no',
                          'name' : data['name'],
                          'email' : data['email'],
                          'blgno': data['blgno'],
                          'street' : data['street'],
                          'zone' : data['zone'],
                          'points' : data['points'],
                          'vouchers' : 'p'
                        });
                        },
                      child: Text('Cancel')
                  ),
                ],
              )
            ],
          )
        )
      ),
    );
  }
}
