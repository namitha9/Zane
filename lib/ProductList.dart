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

enum vals {Red, Black, Blue, Pink, Green}

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
  List <Items> filterby = [
    const Items('Color', Icon(Icons.color_lens_outlined), '02'),
    const Items('Price Range', Icon(Icons.price_change_outlined), '03')
  ];
  List <Items> colorby = [
    const Items('Red', Icon(Icons.colorize_rounded), '04'),
    const Items('Black', Icon(Icons.colorize_rounded), '05'),
    const Items('Blue', Icon(Icons.colorize_rounded), '06'),
    const Items('Pink', Icon(Icons.colorize_rounded), '07'),
    const Items('Green', Icon(Icons.colorize_rounded), '08'),
  ];
  int pop=0;
  int y = 0;
  String colorchoice = '';
  vals? choice = vals.Black;

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

  void filter(String id) {
    indexOrder.clear();
    
  }

  Widget displayInPage(List <PandI>indexOrder){
    print('display');
    print(indexOrder.elementAt(0).index);
    return Padding(
      padding: EdgeInsets.all(0),
      child:
          Wrap(
            direction: Axis.horizontal,
            alignment: WrapAlignment.center,
            children:
              indexOrder.map((e) => display(e.index)).toList()
          ),
      );
  }

  Widget colorSub() {
    return Container(
      child: Column(
        children: colorby.map((Items e){
          return ListTile(
            title: Text(e.name),
            leading: Radio<vals>(
              value: vals.Black,
              groupValue: choice,
              onChanged: (vals? value){
                setState(() {
                  choice = value;
                });
              },
              activeColor: Colors.grey[800],
            ),
          );
        }).toList(),
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
                    PopupMenuButton<String>(
                        onSelected: select,
                        icon: Icon(Icons.filter_alt_outlined),
                        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                          PopupMenuItem<String>(
                            value: filterby.elementAt(0).id,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      filterby.elementAt(0).icon,
                                      SizedBox(width: 2,),
                                      Text(filterby.elementAt(0).name)
                                    ],
                                  ),
                                  colorSub()
                                ],
                              )
                          ),
                          PopupMenuItem<String>(
                              value: filterby.elementAt(0).id,
                              child: Row(
                                children: [
                                  filterby.elementAt(1).icon,
                                  SizedBox(width: 2,),
                                  Text(filterby.elementAt(1).name)
                                ],
                              )
                          ),
                        ]
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
