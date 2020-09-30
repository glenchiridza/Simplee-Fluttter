
import 'package:flutter/material.dart';

void main() =>runApp(MyApp());

class MyApp extends StatefulWidget{
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin{
  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(milliseconds: 10000),
    vsync: this
    );
    animation = Tween<double>(begin: 0, end: 1.0).animate(controller);
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    controller.forward();
    return MaterialApp(
      title: 'Using Animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: "This is the home of aanimations"
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

}

class MyHomePage extends StatelessWidget{
  MyHomePage({Key key,this.title, this.animation}) : super(key:key);

  final String title;
  final Animation<double> animation;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text("Product Listing")),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
        children: <Widget>[
          FadeTransition(child: ProductBox(
            name: "Goods",
            description: "Goods are good",
            price: 1000,
            image: "1.png",
          ),
          opacity: animation,),
          MyAnimatedWidget(child: ProductBox(
              name: "Pixel",
              description: "Pixel is the most featureful phone ever",
              price: 800,
              image: "pixel.png"),
              animation: animation),
          ProductBox(
              name: "Laptop",
              description: "Laptop is most productive development tool",
              price: 2000,
              image: "2.png"),
          ProductBox(
              name: "Tablet",
              description: "Tablet is the most useful device ever for",
              price: 1500,
              image: "3.png"),
          ProductBox(
              name: "Pendrive",
              description: "Pendrive is useful storage medium",
              price: 100,
              image: "4.png"),
          ProductBox(
              name: "Floppy Drive",
              description: "Floppy drive is useful rescue storagemedium",
              price: 20,
              image: "1.png"),
        ],
      ),
    );
  }
}

class MyAnimatedWidget extends StatelessWidget {
  MyAnimatedWidget({this.child, this.animation});

  final Widget child;
  final Animation<double> animation;
  @override
  Widget build(BuildContext context) => Center(
    child: AnimatedBuilder(
      animation: animation,
      builder: (context,child) => Container(
        child: Opacity(opacity: animation.value, child: child,),
      ),
      child: child,
    ),
  );
}


class ProductBox extends StatelessWidget{
  ProductBox({Key key, this.name, this.description, this.price,
    this.image}): super(key: key);

  final String name;
  final String description;
  final int price;
  final String image;
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        height: 140,
        child: Card(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Image.asset("assets/images/" + image),
                  Expanded(
                      child: Container(
                          padding: EdgeInsets.all(5),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(this.name,
                                  style: TextStyle(fontWeight:
                                  FontWeight.bold)),
                              Text(this.description),
                              Text("Price: " + this.price.toString()),
                            ],
                          )))
                ])));
  }
}











































//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:flutterapp/my_data_widgets//ratings.dart';
//import 'package:flutterapp/model/product.dart';
//import 'package:flutterapp/my_data_widgets/products.dart';
//
//void main() => runApp(MyApp());
//
//class MyApp extends StatelessWidget {
//  // This widget is the root of your application.
//  @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      debugShowCheckedModeBanner: false,
//      title: 'NoteKeeper',
//      theme: ThemeData(
//
//        primarySwatch: Colors.blue,
//      ),
//      home: MyHomePage(title: 'Notes'),
//    );
//  }
//}
//
//class MyHomePage extends StatelessWidget {
//  MyHomePage({Key key, this.title}) : super(key: key);
//
//  final String title;
//  final items = Product.getProducts();
//
//  @override
//  Widget build(BuildContext context) {
//
//
//    return Scaffold(
//
//      appBar: AppBar(
//
//        title: Text("Product Nvigation"),
//      ),
//      body: ListView.builder(
//
//        padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
//        itemCount: items.length,
//        itemBuilder: (context,index){
//          return GestureDetector(
//          child: ProductBox(item: items[index]),
//            onTap: () {
//            Navigator.push(context, MaterialPageRoute(
//                builder: (context) => ProductPage(item: items[index]),),);
//            },
//          );
//        },
//      )
//    );
//  }
//}
//
//class ProductPage extends StatelessWidget {
//  ProductPage({Key key, this.item}) : super (key : key);
//
//  final Product item;
//
//  @override
//  Widget build(BuildContext context) {
//
//    return Scaffold(
//        appBar: AppBar(
//          title: Text(this.item.name),
//        ),
//      body: Center(
//        child: Container(
//          padding: EdgeInsets.all(10),
//          child: Column(
//            mainAxisAlignment: MainAxisAlignment.start,
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children: <Widget>[
//              Image.asset("assets/images/" + this.item.image),
//              Expanded(
//                child: Container(
//                  padding: EdgeInsets.all(5),
//                  child: Column(
//                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                    children: <Widget>[
//                      Text(this.item.name, style : TextStyle(fontWeight: FontWeight.bold),
//                ),
//                      Text(this.item.description),
//                      Text("Price: " +this.item.price.toString()),
////                      RatingBox(),
//                  ],
//              ),
//                ),
//              )
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//
//}
