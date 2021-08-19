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
      print('not name');
      int k = users.length;
      k++;
      String f = k.toString();
      users.add(UserProfile(id: f, username: data['name'],email: data['email'], password: data['password'], blgno: data['blgno'], street: data['street'], zone: data['zone'], points: data['points'], voucher: data['vouchers']));
    }
    print(data['points']);

    void passcheck() {
      print('2');
      for (UserProfile instance in users){
        print('3');
        print(instance);
        if(email.text==instance.email && password.text==instance.password){
          print('4');
          print(instance.username);
          print(instance.points);
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
            'points' : instance.points,
            'vouchers' : instance.voucher,
            'users' : users,
            'id' : instance.id
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

    print('copying list');
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
          child: SingleChildScrollView(
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
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
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
                      textInputAction: TextInputAction.go,
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
          ),
        )
      ),
    );
  }
}
