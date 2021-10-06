import 'package:first_flutter_project/models/catalog.dart';
import 'package:flutter/material.dart';

class ItemWidget extends StatelessWidget {
  final Item item;

  const ItemWidget({ Key? key, required this.item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: GridTile(
        /*onTap: (){
          print("${item.name} pressed");
        },
        leading: Image.network(item.image, width: 60, fit: BoxFit.fill,),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text("\$${item.price.toString()}",
        textScaleFactor: 1.5,
        style: TextStyle(
          color: Colors.deepPurple,
          fontWeight: FontWeight.bold,
        ),
        ),*/
        header: Container(
            child: Text(item.name, style: TextStyle(
              color: Colors.white,
            ),
            ),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.deepPurple,

          ),
        ),
        child: Image.network(item.image, fit: BoxFit.fill, ),
        footer: Container(
          child: Text(item.price.toString(), style: TextStyle(
            color: Colors.white,
          ),
          ),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.black,

          ),
        ),
      ),
    );
  }
}
