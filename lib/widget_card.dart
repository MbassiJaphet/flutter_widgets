import 'package:flutter/material.dart';
import 'widget_catalog.dart';
import 'dart:math';


final _random = new Random();
int id_generator(int min, int max) => min + _random.nextInt(max -min);

class WidgetCard extends StatelessWidget{

  final CatalogWidget catalog_widget;

  const WidgetCard.fromProduct(this.catalog_widget);

  @override
  Widget build(BuildContext context){
    int id = id_generator(0,36);
    final Image image_widget = Image.asset(catalog_widget.image,fit: BoxFit.contain);
    return Card(
      elevation: 0,
      clipBehavior: Clip.antiAlias,
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 17/16,
              child: InkWell(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      color: Color(0xFFE0E0E0).withOpacity(0.5),
                    ),
                    padding: EdgeInsets.all(20),
                    child: Opacity(
                      opacity: 0.9,
                        child:  image_widget,
                      ),
                    ),
                onTap: ()=>{},
              ),
            ),
            InkWell(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              child: Container(
                padding: EdgeInsets.only(top: 4,left: 3.0,bottom: 4.0),
                height: 75,
                alignment: Alignment.topLeft,
                child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:<Widget>[
                      SizedBox(height: 5),
                      Container (
                        width: 130,
                        child: Text(
                          catalog_widget.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style : TextStyle(fontSize: 16,fontWeight: FontWeight.w600,
                            color: Color(0xFF757575)
                            /*color: Color(0xFF1976d2)*/
                          )
                        ),
                      ),
                      Spacer(),
                      SizedBox (
                        width: 130,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //crossAxisAlignment: CrossAxisAlignment.,
                          children:<Widget>[
                            InkWell(child: Icon(Icons.favorite_border, color: Color(0xfff7bacf),) , onTap: ()=>{}),
                            InkWell(child: Icon(Icons.bookmark_border, color: Color(0xff757575),) , onTap: ()=>{}),
                          ]
                        )
                      )
                    ]
                  ),
                  Icon(Icons.more_vert, color: Color(0xff757575))
                  ],
                ),
              ),
              onTap: ()=>{},
             )
          ],
        )
    );
  }
}