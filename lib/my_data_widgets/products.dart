import 'package:flutter/material.dart';
import 'package:flutterapp/model/product.dart';
import 'package:flutterapp/my_data_widgets/ratings.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductBox extends StatelessWidget{

  ProductBox({Key key,this.item}) : super(key:key);

  final Product item;

  //my gesture function response
  void _showDialog(BuildContext context){
    //flutter derived function
    showDialog(
        context: context,
        builder: (BuildContext context){
          //return object of type dialog
          return AlertDialog(
            title: new Text("Registrater"),
            content: new Text("Registration in Progress"),
            actions: <Widget>[
              new FlatButton(onPressed: (){Navigator.of(context).pop();}, child: new Text("Later"))
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context){

    return Container(
      padding: EdgeInsets.all(2),
      height: 120,
      child:GestureDetector(
//        onTap: (){
//          _showDialog(context);
//        },
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset("assets/images/"+item.image),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: ScopedModel<Product>(
                    model: this.item,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(this.item.name,
                        style: TextStyle(fontWeight: FontWeight.bold),),
                        Text(this.item.description),
                        Text("Price: " +
                        this.item.price.toString()),
                        ScopedModelDescendant<Product>(
                          builder: (context,child,item){
                            return RatingBox(item: item);
                          },
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
