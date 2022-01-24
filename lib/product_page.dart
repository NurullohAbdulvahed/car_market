import 'package:flutter/material.dart';
import 'package:market_ui/models/product_model.dart';
import 'package:market_ui/pages/market_ui.dart';


class FavoritePage extends StatefulWidget {
  // const FavoritePage({Key? key}) : super(key: key);
  final List<Product> productList;
  const FavoritePage({required this.productList});
  static final String id ="";

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
int counter=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.pop(context, widget.productList);
          },
        ),
        title: Text("Selected Cars"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: Product.likedProduct.length,
                shrinkWrap: true,
                itemBuilder: (context,index){
                  return itemOfcategory(index);
                },
              ),
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
            image: AssetImage(Product.likedProduct[index].image),
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
                      Product.likedProduct[index].name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      Product.likedProduct[index].type,
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
                          widget.productList[widget.productList.indexOf(Product.likedProduct[index])].isLiked = false;
                          Product.likedProduct.remove(Product.likedProduct[index]);
                          // Product.likedProduct[index].isLiked? Product.likedProduct.remove(Product.likedProduct[index]): SizedBox.shrink();
                        });
                      },
                      icon: Icon(Icons.favorite,color: Colors.white,),
                  ),
                )
              ],
            ),
            Text(Product.likedProduct[index].cost + "\$",
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
}
