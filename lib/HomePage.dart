import 'package:flutter/material.dart';
import 'package:blinking_text/blinking_text.dart';

import 'HomeScreen.dart';
import 'SearchScreen.dart';
import 'AccountScreen.dart';
import 'Item.dart';
import 'Users.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  int selectindex = 0;
  Map data = {};
  static List <Map> items = [];
  String price = 'p';
  String picture = 'p';
  String size = 's';
  String counter = 'c';
  String delete = 'no';
  String points = '0';
  static int Total = 0;
  int catindex = 0;
  static int counteritem = 0;
   List <TotalItem> totalitems = [
    TotalItem(picture: 'https://www.rankandstyle.com/media/lists/m/mens-linen-shirts_biGmbQi.jpg', price: 45, description: 'Simple Lined Shirt', categories: ['blue', 'shirt', 'half-sleeve','lined']),
     TotalItem(picture: 'https://assets.ajio.com/medias/sys_master/root/hd9/h52/13493043658782/-473Wx593H-441000453-olive-MODEL.jpg', price: 35, description: 'Cameo T-Shirt', categories: ['green', 't-shirt', 'half-sleeve']),
     TotalItem(picture: 'https://static.toiimg.com/photo/imgsize-1103331,msid-81792399/81792399.jpg', price: 100, description: 'Print Set', categories: ['blue', 'printed', 'set']),
     TotalItem(picture: 'https://i.pinimg.com/736x/63/ab/40/63ab40223409a6a1358edc4dca160c88.jpg', price: 55, description: 'Blue Silk Lungi', categories: ['blue', 'silk', 'indian','lungi']),
     TotalItem(picture: 'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/gettyimages-936671466-1612470158.jpg?crop=0.816xw:0.551xh;0,0.426xh&resize=640:*' , price: 250, description: 'Jordans', categories: ['shoes', 'nike', 'red','limited']),
     TotalItem(picture: 'https://img.joomcdn.net/60a3831bf7ea47472e3b9e30569b0f74ab392f26_original.jpeg', price: 40, description: 'Lined Cropped Shirt', categories: ['half-sleeve', 'cropped', 'cute']),
     TotalItem(picture: 'https://assets.ajio.com/medias/sys_master/root/20210404/B90A/606b546bf997dd7b64928f04/-473Wx593H-462253872-black-MODEL.jpg', price: 45, description: 'Black Fitted Top', categories: ['black', 'full-sleeve', 'buttons']),
     TotalItem(picture: 'https://cdn.shopify.com/s/files/1/1816/6561/products/Resize3_5701a1bf-8322-4c99-b1dd-1e1704e66474_large.jpg?v=1596720286', price: 50, description: 'Off-Shoulder Pink Top', categories: ['off-shoulder', 'pink', 'full-sleeve'],),
     TotalItem(picture: 'https://ii.ghbass.com/fcgi-bin/iipsrv.fcgi?FIF=/images/ghbass/source/P0EATFXY-_p0eatfxyc947.tif&qlt=90&wid=650&cvt=jpeg', price: 40, description: 'Stylish Lined Shirt', categories: ['white','sexy','sleeveless']),
     TotalItem(picture: 'https://media.missguided.com/i/missguided/DD928718_01', price: 75, description: 'Leather Coat Dress', categories: ['dress','short','brown','leather']),
  ];
   static String name = 'Name';
  static String email = 'Email';
  static String blgno = '00';
  static String street = '000';
  static String zone = '00';
  static int now = 0;
  List <UserProfile> users = [];

  String count = '';
  String vouchers = '';

   void detailschange(){
     if (data['name'] != 'Name'){
       name = data['name'];
     }
     if (data['email'] != 'Email'){
       email = data['email'];
     }
     if (data['blgno'] != '00'){
       blgno = data['blgno'];
     }
     if (data['street'] != '000'){
       street = data['street'];
     }
     if (data['zone'] != '00'){
       zone = data['zone'];
     }

   }


  void _onItemTapped(int index){
    setState(() {
      selectindex = index;
    });
  }

  Widget openpage() {
    if (selectindex == 0) {
      return HomeScreen(menswear: menswear(), womenswear:womenswear());
    }
    else if (selectindex == 1){
      return SearchScreen(totalitems: totalitems , points : points);
    }
    else {
      detailschange();
      print(count);
      return AccountScreen( total :points, name: name, email : email, blgno : blgno, street: street, zone : zone, count : count, users : users);
    }
  }

  Widget display(catindex){
    TotalItem instance = totalitems[catindex];
    String price = instance.price.toString();
    return TextButton(
      onPressed: (){
        Navigator.pushReplacementNamed(context, '/ProductDisplay',arguments: {
          'picture': instance.picture ,
          'price' : instance.price,
          'description' : instance.description,
          'points' : points,
          'vouchers' : count
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: NetworkImage(instance.picture),
            height: 200,
            width: 200,
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
    );
  }

  void isnull() {
    var priCe = int.parse(price);
    var couNter = int.parse(counter);
    priCe = priCe*couNter;
    Total += priCe;
    print(items);
    if (counteritem>0 && items.elementAt(counteritem-1)['picture']!=picture){
      items.add({'price': priCe.toString(), 'picture': picture, 'size': size, 'counter' : counter});
      picture = 'p';
      price = 'p';
      size = 's';
      counter = 'c';
      delete = 'no';
      counteritem++;
    }
    if (counteritem==0){
      items.add({'price': priCe.toString(), 'picture': picture, 'size': size, 'counter' : counter});
      picture = 'p';
      price = 'p';
      size = 's';
      counter = 'c';
      delete = 'no';
      counteritem++;
    }
  }

  void initState(){
    super.initState();
    print('open');
  }

  Widget menswear(){
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    TextButton(
                      onPressed: (){},
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(2),
                            margin: EdgeInsets.all(5),
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(

                                    image: NetworkImage('https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/white-tee-1623337322.jpg?crop=0.502xw:1.00xh;0.250xw,0&resize=640:*'),
                                    fit: BoxFit.fill
                                )
                            ),
                          ),
                          Text('T-Shirts',
                            style: TextStyle(color: Colors.black),)
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: (){},
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.all(5),
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage('https://cf.shopee.ph/file/266805fb1dd9786bdf1b2baae9d6958f'),
                                    fit: BoxFit.fill
                                )
                            ),
                          ),
                          Text('Shorts',
                            style: TextStyle(color: Colors.black),)
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: (){},
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.all(5),
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage('https://manofmany.com/wp-content/uploads/2020/12/Best-slides-and-sandals-for-men.jpg'),
                                    fit: BoxFit.fill
                                )
                            ),
                          ),
                          Text('Slides',
                            style: TextStyle(color: Colors.black),)
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: (){},
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.all(5),
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage('https://brandfuge.com/wp-content/uploads/2019/05/1.jpg'),
                                    fit: BoxFit.fill
                                )
                            ),
                          ),
                          Text('Watches',
                            style: TextStyle(color: Colors.black),)
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: (){},
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.all(5),
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage('https://images.squarespace-cdn.com/content/v1/5a15ad16b7411ccec818471e/1569115277114-VRSA106ZA8LYYFJ7AF6W/Kolor+Magazine+Best+Fanny+Pack+Brands+for+Men+Nike+.jpeg'),
                                    fit: BoxFit.fill
                                )
                            ),
                          ),
                          Text('Fanny Bags',
                            style: TextStyle(color: Colors.black),)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              BlinkText(
                'FREE SHIPPING OVER QR 300!',
                style: TextStyle(fontSize: 23),
                beginColor: Colors.black,
                endColor: Colors.indigo,
                times: 100,
                duration: Duration(milliseconds: 500),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Most Loved Styles'),
                  TextButton(
                      onPressed: (){
                        Navigator.pushReplacementNamed(context, '/List',arguments: {
                          'totalitems' : totalitems,
                          'points' : points,
                          'vouchers' : count
                        });
                      },
                      child: Text('More >',
                        style: TextStyle(
                        ),)
                  )
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    display(0),
                    display(1),
                    display(2),
                    display(3),
                    display(4),
                  ],
                ),
              ),
              SizedBox(height: 15,),
              Stack(
                  children: [
                    Image(
                      image: NetworkImage('https://onpointfresh.com/wp-content/uploads/2016/08/tumblr_o2hadekN0v1uceufyo1_500.jpg'),
                      height: 550,
                      width: 550,
                    ),
                    Positioned(
                        right: 8,
                        top: 350,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('Jacket: QR60',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                            Text('Pant: QR 75',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),
                            Text('Sunglasses: QR 25',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),
                            Text('Shoes: QR 85',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold))
                          ],
                        ))
                  ]
              ),
              TextButton(
                onPressed: (){},
                child: Text('NEW COLLECTION',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget womenswear(){
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    TextButton(
                      onPressed: (){},
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(2),
                            margin: EdgeInsets.all(5),
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(

                                    image: NetworkImage('https://img.joomcdn.net/60a3831bf7ea47472e3b9e30569b0f74ab392f26_original.jpeg'),
                                    fit: BoxFit.fill
                                )
                            ),
                          ),
                          Text('T-Shirts',
                            style: TextStyle(color: Colors.black),)
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: (){},
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.all(5),
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage('https://i.pinimg.com/736x/c0/2a/0b/c02a0bbd3e318a3d10b8c1269fc8be62.jpg'),
                                    fit: BoxFit.fill
                                )
                            ),
                          ),
                          Text('Dresses',
                            style: TextStyle(color: Colors.black),)
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: (){},
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.all(5),
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage('https://media-tommy.6thstreet.com/media/catalog/product/cache/39577128e0f4a8d894765c561e0bf147/d/w/dw0dw098821ab-1.jpg'),
                                    fit: BoxFit.fill
                                )
                            ),
                          ),
                          Text('Denim',
                            style: TextStyle(color: Colors.black),)
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: (){},
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.all(5),
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage('https://media1.popsugar-assets.com/files/thumbor/lmeeKS9QWXMNtr66RtGvmGADW4A/fit-in/2048xorig/filters:format_auto-!!-:strip_icc-!!-/2019/07/05/612/n/45961726/950f6bab93d3fd47_GettyImages-955745918/i/Classic-255-Chanel-Bag.jpg'),
                                    fit: BoxFit.fill
                                )
                            ),
                          ),
                          Text('Bags',
                            style: TextStyle(color: Colors.black),)
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: (){},
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.all(5),
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: NetworkImage('https://ae01.alicdn.com/kf/H627cead1e76c45658b188ec6bf4813eei/Artilady-2pcs-set-clip-on-earrings-ear-cuffs-for-women-gold-color-snake-CA-stone-accessorries.jpg_Q90.jpg_.webp'),
                                    fit: BoxFit.fill
                                )
                            ),
                          ),
                          Text('Earrings',
                            style: TextStyle(color: Colors.black),)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Stack(
                  children: [
                    Image(
                      image: NetworkImage('https://www.outfit-styles.com/wp-content/uploads/2020/08/Casual-Summer-Outfit-for-Women.jpg'),
                      height: 550,
                      width: 550,
                    ),
                    Positioned(
                        left: 28,
                        top: 425,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Top: QR35',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            Text('Shorts: QR 60',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                            Text('Bag: QR 25',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                            Text('Sunglasses: QR 15',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                            Text('Watch: QR 50',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold))
                          ],
                        ))
                  ]
              ),
              TextButton(
                onPressed: (){},
                child: Text('NEW COLLECTION',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black
                  ),
                ),
              ),
              SizedBox(height: 20,),
              BlinkText(
                'FREE SHIPPING OVER QR 300!',
                style: TextStyle(fontSize: 23),
                beginColor: Colors.black,
                endColor: Colors.indigo,
                times: 100,
                duration: Duration(milliseconds: 500),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Most Loved Styles'),
                  TextButton(
                      onPressed: (){Navigator.pushReplacementNamed(context, '/List',arguments: {'totalitems' : totalitems,'points': points, 'vouchers' : count});},
                      child: Text('More >')
                  )
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    display(5),
                    display(6),
                    display(7),
                    display(8),
                    display(9)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context)!.settings.arguments as Map;
    price = data['price'];
    picture = data['picture'];
    size = data['size'];
    counter  = data['counter'];
    points = data['points'];
    if (picture!='p') {
      isnull();
    }
    if (data['delete']=='yes' && now==0) {
      items.clear();
      price = data['price'];
      picture = 'p';
      size = 's';
      counter = 'c';
      delete = 'no';
      Total = 0;
      now = 0;
      counteritem = 0;
    }
    //if (data['counter']!='c'){
      //count = data['counter'];
    //}
    if (data['vouchers']!='p'){
      count = data['vouchers'];
      print(count);
    }
    if(data['users']!=[]){
      users = List.from(data['users']);
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[850],
        actions: [
          IconButton(
              onPressed: (){
                print(points);
                Navigator.pushReplacementNamed(context, '/CartScreen',arguments: {
                  'items' : items,
                  'total' : Total.toString(),
                  'name' : name,
                  'email' : email,
                  'blgno': blgno,
                  'street' : street,
                  'zone' : zone,
                  'points' : points.toString(),
                  'vouchers' : count
                });
              },
              icon: Icon(Icons.shopping_cart_outlined)
          )
        ],
      ),
      body: openpage(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[850],
        type: BottomNavigationBarType.fixed,
        currentIndex: selectindex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey[600],
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Account',
          ),
        ],
      ),
    );
  }
}


