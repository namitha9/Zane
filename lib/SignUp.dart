import 'package:flutter/material.dart';
import 'Users.dart';

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
  int i = 0;
  String passcheck = '';

  void validatePassword(String password){
    String pattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}$';
    RegExp exp = new RegExp(pattern);
    if(password.isEmpty){
      setState(() {
        passcheck = 'Enter password';
      });
    }
    else if(!exp.hasMatch(password)){
      setState(() {
        passcheck = 'Enter valid password';
      });
    }
    else{
      setState(() {
        i = 1;
        passcheck = ' ';
      });
    }
  }


  List <UserProfile> users =[UserProfile(id: '00', username: 'Name', email: 'Email', password: 'Password', blgno: '00', street: '000', zone: '00', points: '0', voucher: 'p')];
  //UserProfile user = UserProfile(username: '', password: '', blgno: '', street: '', zone: '', voucher: '');

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
                SizedBox(height: 30,),
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
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
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
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        errorText: passcheck,
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
                    //Text(passcheck, style: TextStyle(fontSize: 13),),
                    SizedBox(height: 20,),
                    Text('BUILDING NUMBER', style: TextStyle(letterSpacing: 6, fontSize: 13),),
                    SizedBox(height: 4,),
                    TextFormField(
                      controller: blgno,
                      keyboardType: TextInputType.number,
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
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
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
                      keyboardType: TextInputType.number,
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
                            setState(() {
                              validatePassword(password.text);
                            });
                            //validatePassword(password.text);
                            if(i==1){
                              Navigator.pushReplacementNamed(context, '/Login', arguments: {
                                'name' : name.text,
                                'email' : email.text,
                                'password' : password.text,
                                'blgno': blgno.text,
                                'street' : street.text,
                                'zone' : zone.text,
                                'vouchers' : 'p',
                                'points' : '0',
                                'users' : users
                              });
                            }
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
