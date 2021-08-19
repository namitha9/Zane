import 'package:flutter/material.dart';
import 'package:zane_shop/CardDisplay.dart';
import 'package:zane_shop/Item.dart';

class SearchScreen extends StatefulWidget {
  final List totalitems;
  final String points;
  const SearchScreen({Key? key, required this.totalitems, required this.points}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  TextEditingController searchitem = TextEditingController();
  List <TotalItem> totalitemS = [];
  List <TotalItem> totalItems = [];
  List <String> cat = [];
  String search = 'no';
  int index = 0;

  void additems() {
    if (search == 'yes') {
      for (TotalItem instance in totalitemS) {
        //print(instance);
        cat = List.from(instance.categories);
        //print(cat);
        for (String f in cat) {
          //print(f);
          if (f == searchitem.text) {
            print('yes');
            totalItems.add(TotalItem(picture: instance.picture,
                price: instance.price,
                description: instance.description,
                categories: instance.categories));
            //print(totalItems[index].price);
            index += 1;
            break;
          }
        }
      }
    }
  }

    Widget itemsearch() {
      //additems;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: totalItems.map((item) =>
            CardDisplay(
                item: item,
              points : widget.points
            )).toList(),
      );
    }
    //search = 'no';
    //totalItems.clear();

    @override
    Widget build(BuildContext context) {
      totalitemS = List.from(widget.totalitems);
      return Scaffold(
        backgroundColor: Colors.grey[300],
        body: Container(
          height: 750,
          width: 430,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: TextFormField(
                            controller: searchitem,
                            decoration: InputDecoration(
                                hintText: 'Search',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(),
                                )
                            ),
                          ),
                        ),
                        TextButton.icon(
                            onPressed: () {
                              setState(() {
                                search = 'yes';
                                //totalItems.clear();
                              });
                              totalItems.clear();
                              additems();
                            },
                            icon: Icon(Icons.search),
                            label: Text('')),
                      ],
                    ),
                    SizedBox(
                        height: 20
                    ),
                    itemsearch(),
                  ]
              ),
            ),
          ),
        ),
      );
    }
  }