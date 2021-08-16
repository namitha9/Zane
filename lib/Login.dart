import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  void passcheck() {
    //do later
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 70,),
              Image.asset(
                'assets/images/zane.png',
                height: 100,
              ),
              SizedBox(height: 20,),
              Text('LOGIN', style: TextStyle(fontSize: 20, letterSpacing: 10),),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30,),
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
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        )
                    ),
                  ),
                  TextButton(
                      onPressed: (){},
                      child: Text('Forgot Password?', style: TextStyle(fontSize: 13),)
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
                              'name' : 'Name',
                              'email' : 'Email',
                              'blgno': '00',
                              'street' : '000',
                              'zone' : '00',
                              'points' : '0',
                              'vouchers' : 'p'
                            });
                          },
                          child: Text('LOGIN'),
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
                  onPressed: (){Navigator.pushNamed(context, '/SignUp');},
                  child: Text('Dont Have an Account? Sign Up')
              )
            ],
          ),
        )
      ),
    );
  }
}
