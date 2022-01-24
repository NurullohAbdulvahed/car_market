import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:market_ui/models/product_model.dart';

import '../product_page.dart';

class MarketUIPage extends StatefulWidget {
  static final String id = '';

  const MarketUIPage({Key? key}) : super(key: key);

  @override
  _MarketUIPageState createState() => _MarketUIPageState();
}

class _MarketUIPageState extends State<MarketUIPage> {
  List<String> categories = ["All", "Red", "Blue", "Green", "Black", "White"];
  int _selectedIndex = 0;
  int counter = 0;
  List<Product> myList = [];
  List<Product> products = [
    Product(
      name: "Gentra",
      cost: "100",
      type: "Electric",
      image: "assets/images/im_car0.jpg",
      catergory: 'Red',
      isLiked: false,
    ),
    Product(
      name: "Mers",
      cost: "100",
      type: "Electric",
      image: "assets/images/im_car1.jpg",
      catergory: 'Blue',
      isLiked: false,
    ),
    Product(
      name: "BMW",
      cost: "100",
      type: "Electric",
      image: "assets/images/im_car2.jpg",
      catergory: 'Green',
      isLiked: false,
    ),
    Product(
      name: "Audi",
      cost: "100",
      type: "Electric",
      image: "assets/images/im_car3.png",
      catergory: 'White',
      isLiked: false,
    ),
    Product(
      name: "Lamborghini",
      cost: "100",
      type: "Electric",
      image: "assets/images/im_car4.jpg",
      catergory: 'Black',
      isLiked: false,
    ),
  ];

  Future<void> _nextPage() async{
    List<Product> newList = await Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => FavoritePage(productList: products)));
    if(newList != null){
      setState(() {
        products = newList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Cars",
          style: TextStyle(color: Colors.black, fontSize: 25),
        ),
        centerTitle: false,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: Icon(
              Icons.notifications_none,
              color: Colors.black,
            ),
          ),
          Container(
            child: Badge(
              position: BadgePosition.topEnd(top: 10, end: 10),
              badgeContent: Text("${Product.likedProduct.length}"),
              child: IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.black,
                ),
                onPressed: () {
                  _nextPage();
                },
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///Category
            Container(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return _itemOfCategory(index);
                },
              ),
            ),

            /// Products
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: products.length,
              itemBuilder: (context, index) {
                return itemOfcategory(index);
              },
            )
          ],
        ),
      ),
    );
  }

  Card itemOfcategory(int index) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
        height: 240,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: AssetImage(products[index].image),
              fit: BoxFit.cover,
            )),
        child: Container(
          padding: EdgeInsets.only(left: 20, bottom: 20, top: 15, right: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
                Colors.black.withOpacity(0.9),
                Colors.black.withOpacity(0.6),
                Colors.black.withOpacity(0.3),
                Colors.black.withOpacity(0.1),
              ])),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        products[index].name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        products[index].type,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Container(
                    child: IconButton(
                        onPressed: (){
                          setState(() {
                            products[index].isLiked=!products[index].isLiked;
                            products[index].isLiked?counter+=1:counter-=1;
                           // products[index].isLiked? myList.add(products[index]):myList.remove(products[index]);
                            products[index].isLiked? Product.likedProduct.add(products[index]):Product.likedProduct.remove(products[index]);


                          });
                        },
                        icon: Icon(products[index].isLiked?Icons.favorite:Icons.favorite_outline,color: Colors.white,)
                    ),
                  )
                ],
              ),
              Text(products[index].cost + "\$",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold))
            ],
          ),
        ),
      ),
    );
  }

  Container _itemOfCategory(int index) {
    return Container(
      padding: (index != categories.length - 1)
          ? EdgeInsets.only(left: 5)
          : EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: MaterialButton(
        padding: EdgeInsets.zero,
        elevation: 0,
        color: _selectedIndex != index ? Colors.white : Colors.grey.shade300,
        shape: StadiumBorder(),
        onPressed: () {
          setState(() {
            _selectedIndex = index;
          });
        },
        child: Text(
          categories[index],
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}

