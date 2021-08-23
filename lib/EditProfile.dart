import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Users.dart';

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
  List <UserProfile> users =[UserProfile(id: '00', username: 'Name', email: 'Email', password: 'Password', blgno: '00', street: '000', zone: '00', points: '0', voucher: 'p')];

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        leading: Container(),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
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
                  keyboardType: TextInputType.name,
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
                  keyboardType: TextInputType.emailAddress,
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
                  keyboardType: TextInputType.number,
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
                  keyboardType: TextInputType.number,
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
                  keyboardType: TextInputType.number,
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
                            'vouchers' : 'p',
                            'users' : users,
                            'id' : '00'
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
                            'vouchers' : 'p',
                            'users' : users,
                            'id' : '00'
                          });
                          },
                        child: Text('Cancel')
                    ),
                  ],
                )
              ],
            ),
          )
        )
      ),
    );
  }
}
