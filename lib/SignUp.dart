import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController blgno = TextEditingController();
  TextEditingController street = TextEditingController();
  TextEditingController zone = TextEditingController();

  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 70,),
                Image.asset(
                  'assets/images/zane.png',
                  height: 100,
                ),
                SizedBox(height: 20,),
                Text('SIGN UP', style: TextStyle(fontSize: 20, letterSpacing: 10),),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 30,),
                    Text('NAME', style: TextStyle(letterSpacing: 6, fontSize: 13),),
                    SizedBox(height: 4,),
                    TextFormField(
                      controller: name,
                      decoration: InputDecoration(
                          hintText: 'Name',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                          )
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text('EMAIL', style: TextStyle(letterSpacing: 6, fontSize: 13),),
                    SizedBox(height: 4,),
                    TextFormField(
                      controller: email,
                      decoration: InputDecoration(
                          hintText: 'Email',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                          )
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text('PASSWORD', style: TextStyle(letterSpacing: 6, fontSize: 13),),
                    SizedBox(height: 4,),
                    TextFormField(
                      controller: password,
                      obscureText: _isObscure,
                      decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                                _isObscure ? Icons.visibility_off : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                          )
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text('BUILDING NUMBER', style: TextStyle(letterSpacing: 6, fontSize: 13),),
                    SizedBox(height: 4,),
                    TextFormField(
                      controller: blgno,
                      decoration: InputDecoration(
                          hintText: '00',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                          )
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text('STREET', style: TextStyle(letterSpacing: 6, fontSize: 13),),
                    SizedBox(height: 4,),
                    TextFormField(
                      controller: street,
                      decoration: InputDecoration(
                          hintText: '000',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                          )
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text('ZONE', style: TextStyle(letterSpacing: 6, fontSize: 13),),
                    SizedBox(height: 4,),
                    TextFormField(
                      controller: zone,
                      decoration: InputDecoration(
                        hintText: '00',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(),
                          )
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: (){
                            Navigator.pushReplacementNamed(context, '/HomePage', arguments: {
                              'picture' : 'p',
                              'price' : 'p',
                              'size' : 's',
                              'counter' : 'c',
                              'delete' : 'no',
                              'name' : name.text=='' ? 'Name' : name.text,
                              'email' : email.text=='' ? 'Email' : email.text,
                              'blgno': blgno.text=='' ? '00' : blgno.text,
                              'street' : street.text=='' ? '000' : street.text,
                              'zone' : zone.text=='' ? '00' : zone.text,
                              'points' : '0',
                              'vouchers' : 'p'
                            });
                          },
                          child: Text('SIGN UP'),
                          style: ElevatedButton.styleFrom(primary: Colors.grey[500]),
                        ),
                        ElevatedButton(
                          onPressed: (){
                            Navigator.pushNamed(context, '/');
                          },
                          child: Text('CANCEL'),
                          style: ElevatedButton.styleFrom(primary: Colors.grey[500]),
                        ),
                      ],
                    )
                  ],
                ),
                TextButton(
                    onPressed: (){Navigator.pushNamed(context, '/Login');},
                    child: Text('Already Have an Account? Login')
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
