
//rating state maintenance widget
import 'package:flutter/material.dart';
import 'package:flutterapp/model/product.dart';

class RatingBox extends StatelessWidget {
  RatingBox({Key key,this.item}): super(key:key);

  final Product item;

  @override
  Widget build(BuildContext context) {
    double _size = 20;
    print(item.rating);

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end ,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (item.rating >=1 ? Icon(Icons.star,size:_size,) :
            Icon(Icons.star_border,size: _size,)),
            color: Colors.red[500],
            onPressed: ()=>this.item.updateRating(1),
            iconSize: _size,
          ),
        ),
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (item.rating>=2 ? Icon(Icons.star,size: _size,):
            Icon(Icons.star_border,size: _size,)),
            color: Colors.red[500],
            onPressed: ()=>this.item.updateRating(2),
            iconSize: _size,
          ),
        ),
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
            icon: (item.rating>=3 ? Icon(Icons.star,size: _size,) :
            Icon(Icons.star_border,size: _size,)),
            color: Colors.red[400],
            onPressed: ()=>this.item.updateRating(3),
            iconSize: _size,
          ),
        ),
      ],
    );


  }

}
