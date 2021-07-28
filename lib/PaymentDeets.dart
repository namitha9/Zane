import 'package:flutter/material.dart';

class PaymentDeets extends StatefulWidget {
  const PaymentDeets({Key? key}) : super(key: key);

  @override
  _PaymentDeetsState createState() => _PaymentDeetsState();
}

class _PaymentDeetsState extends State<PaymentDeets> {

  int selectindex = 0;
  Map data={};

  Widget differentpage() {
    if (selectindex == 1){
      return card();
    }
    else if (selectindex == 2){
      return money();
    }
    else {
      return empty();
    }
  }

  Widget card() {
    return Container(
      color: Colors.grey[300],
      height: 500,
      width: 300,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            Text('WE ACCEPT'),
            Image(image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSY3a9qnPk6dU0ZlB_ocPPPxQqvxrxOVLoI3T4Xiv4wPWoPjU5-AZ1mcc9OFTE5kPEIAw&usqp=CAU'),
            height: 50,
            width: 120,),
            SizedBox(height: 20,),
            Text('CARD NAME: '),
            SizedBox(height: 10,),
            TextFormField(
              decoration: InputDecoration(//how are you? not great
                  hintText: 'Card Name',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  )
              ),
            ),
            SizedBox(height: 25,),
            Text('CARD NUMBER: '),
            SizedBox(height: 10,),
            TextFormField(
              decoration: InputDecoration(//how are you? not great
                  hintText: 'Card Number',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  )
              ),
            ),
            SizedBox(height: 25,),
            Text('CVV: '),
            SizedBox(height: 10,),
            TextFormField(
              decoration: InputDecoration(//how are you? not great
                  hintText: 'CVV',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  )
              ),
            ),
            SizedBox(height: 30,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ElevatedButton(
                    onPressed: (){
                      print(data['points']);
                      Navigator.pushReplacementNamed(context, '/Placed', arguments: {
                        'points' : data['points'],
                        'email' : data['email']
                      });
                    },
                    child: Text('PAY'),
                    style: ElevatedButton.styleFrom(primary: Colors.grey[600])
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget money() {
    return Container(
      color: Colors.grey[300],
      height: 130,
      width: 300,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('TO BE PAID ON DELIVERY'),
            SizedBox(height: 30,),
            ElevatedButton(
              onPressed: (){
                print(data['points']);
                Navigator.pushReplacementNamed(context, '/Placed', arguments: {
                  'points' : data['points'],
                  'email' : data['email']
                });
                },
              child: Text('Place Order'),
              style: ElevatedButton.styleFrom(primary: Colors.grey[600]),
            )
          ],
        ),
      ),
    );
  }

  Widget empty() {
    return Container(

    );
  }

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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('PAYMENT TYPE'),
              SizedBox(height: 30,),
              ElevatedButton.icon(
                  onPressed: (){
                    setState(() {
                      selectindex = 1;
                  });
                  },
                  icon: Icon(Icons.credit_card),
                  label: Text('CREDIT/DEBIT CARD'),
                  style: ElevatedButton.styleFrom(primary: Colors.grey[700])
              ),
              SizedBox(height: 17,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      height: 1,
                      width: 150,
                      color: Colors.black,
                    ),
                  ),
                  Text('OR'),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      height: 1,
                      width: 150,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 17,),
              ElevatedButton.icon(
                  onPressed: (){
                    setState(() {
                      selectindex = 2;
                    });
                  },
                  icon: Icon(Icons.account_balance_wallet_outlined),
                  label: Text('PAYMENT ON DELIVERY'),
                style: ElevatedButton.styleFrom(primary: Colors.grey[700]),
              ),
              SizedBox(height: 17,),
              differentpage(),
            ],
          ),
        ),
      ),
    );
  }
}
