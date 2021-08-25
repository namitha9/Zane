import 'package:flutter/material.dart';
import 'Item.dart';
import 'Users.dart';

class Items{
  const Items(this.name, this.icon, this.id);
  final String name;
  final Icon icon;
  final String id;
}

class PandI{
  const PandI(this.price, this.index);
  final int price;
  final int index;
}

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {


  Map data ={};
  int catindex = 0;
  List <TotalItem> totalItems = [];
  String points = '';
  List <UserProfile> users =[UserProfile(id: '00', username: 'Name', email: 'Email', password: 'Password', blgno: '00', street: '000', zone: '00', points: '0', voucher: 'p')];
  List <int> prices = [];
  List <PandI> dupe = [];
  static List <PandI> indexOrder = [];
  //static List <int> indexOrder = [];
  List <Items> sortby = [
    const Items('Price Low to High', Icon(Icons.arrow_downward), '00'),
    const Items('Price High to Low', Icon(Icons.arrow_upward), '01')
  ];
  int pop=0;
  int y = 0;

  Widget display(catindex){
    TotalItem instance = totalItems[catindex];
    String price = instance.price.toString();
    print(price);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton(
        onPressed: (){
          Navigator.pushReplacementNamed(context, '/ProductDisplay',arguments: {
            'picture': instance.picture ,
            'price' : instance.price,
            'description' : instance.description,
            'points' : points,
            'vouchers' : data['vouchers']
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: NetworkImage(instance.picture),
              height: 175,
              width: 175,
            ),
            SizedBox(
                height: 10
            ),
            Text('QR $price',
              style: TextStyle(color: Colors.black),),
            Text(instance.description,
              style: TextStyle(color: Colors.black),)
          ],
        ),
      ),
    );
  }

  void findIndex(){
    indexOrder = [];
    for (int l in prices){
      pop = 0;
      for (TotalItem instance in totalItems){
        if(l==instance.price){
          //indexOrder.add(pop);
          break;
        }
        pop++;
      }
    }
    print(indexOrder);
  }

  void select(String id) {
    indexOrder.clear();
    int p = 0;
    for (TotalItem instance in totalItems){
      setState(() {
        indexOrder.add(PandI(instance.price, p));
        p++;
      });
    }
    if(id == '00'){
      setState(() {
        indexOrder.sort((a,b) => a.price.compareTo(b.price));
      });
    }
    if(id == '01'){
      setState(() {
        indexOrder.sort((a,b) => a.price.compareTo(b.price));
        dupe = List.from(indexOrder);
        indexOrder = [];
        indexOrder = List.from(dupe.reversed);
      });
    }
    for(PandI instance in indexOrder){
      print(instance.index);
    }
    //findIndex();
  }

  Widget displayInPage(List <PandI>indexOrder){
    print('display');
    print(indexOrder.elementAt(0).index);
    return Padding(
      padding: EdgeInsets.all(0),
      child: Column(
        children: [
          Row(
            children: [
              display(indexOrder.elementAt(0).index),
              display(indexOrder.elementAt(1).index),
            ],
          ),
          Row(
            children: [
              display(indexOrder.elementAt(2).index),
              display(indexOrder.elementAt(3).index),
            ],
          ),
          Row(
            children: [
              display(indexOrder.elementAt(4).index),
              display(indexOrder.elementAt(5).index),
            ],
          ),
          Row(
            children: [
              display(indexOrder.elementAt(6).index),
              display(indexOrder.elementAt(7).index),
            ],
          ),
          Row(
            children: [
              display(indexOrder.elementAt(8).index),
              display(indexOrder.elementAt(9).index),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;
    totalItems = List.from(data['totalitems']);
    points = data['points'];

    if(y==0){
      select('10');
      y=1;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        leading: Container(),
        actions: [
          TextButton(
              onPressed: (){
                Navigator.pushReplacementNamed(context,'/HomePage',arguments: {
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
                  'points' : data['points'],
                  'vouchers' : 'p',
                  'users' : users,
                  'id' : '00'
                });
              },
              child: Text('Back to Home', style: TextStyle(color: Colors.white),)
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Text('FILTER'),
                    PopupMenuButton(
                        onSelected: select,
                        icon: Icon(Icons.filter_alt_outlined),
                        itemBuilder: (BuildContext context){
                          return sortby.map((Items e){
                            return PopupMenuItem<String>(
                                value: e.id,
                                child: Row(
                                  children: [
                                    e.icon,
                                    SizedBox(width: 2,),
                                    Text(e.name)
                                  ],
                                )
                            );
                          }).toList();
                        }
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text('SORT BY'),
                    PopupMenuButton(
                        onSelected: select,
                        icon: Icon(Icons.sort),
                        itemBuilder: (BuildContext context){
                          return sortby.map((Items e){
                            return PopupMenuItem<String>(
                                value: e.id,
                                child: Row(
                                  children: [
                                    e.icon,
                                    SizedBox(width: 2,),
                                    Text(e.name)
                                  ],
                                )
                            );
                          }).toList();
                        }
                    ),
                  ],
                ),
              ]
            ),
            displayInPage(indexOrder),
          ],
        ),
      ),
    );
  }
}
