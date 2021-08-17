import 'package:flutter/material.dart';
import 'Users.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  Map data = {};

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  List <UserProfile> users = [];
  List <UserProfile> usersc = [];

  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {

    data = ModalRoute.of(context)!.settings.arguments as Map;

    if(data['name']!='Name'){
      users.add(UserProfile(username: data['name'],email: data['email'], password: data['password'], blgno: data['blgno'], street: data['street'], zone: data['zone'], voucher: 'p'));
    }

    void passcheck() {
      print('2');
      for (UserProfile instance in users){
        print('3');
        print(instance);
        if(email.text==instance.email && password.text==instance.password){
          print('4');
          Navigator.pushReplacementNamed(context, '/HomePage', arguments: {
            'picture' : 'p',
            'price' : 'p',
            'size' : 's',
            'counter' : 'c',
            'delete' : 'no',
            'name' : instance.username,
            'email' : instance.email,
            'blgno': instance.blgno,
            'street' : instance.street,
            'zone' : instance.zone,
            'points' : '0',
            'vouchers' : 'p',
            'users' : users
          });
        }
        else{
          showDialog(
              context: context,
              builder: (BuildContext context) =>
                  AlertDialog(
                    title: Text('Incorrect Information'),
                    content: Text(
                        'You have entered the wrong email or password.'),
                    actions: [
                      TextButton(onPressed: () {Navigator.pop(context);},
                          child: Text('Back')),
                    ],
                  )
          );
        }
      }
    }

    usersc = List.from(data['users']);
    if(usersc.elementAt(0).username!='Name'){
      users = List.from(usersc);
    }

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
                            print('1');
                            passcheck();
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
