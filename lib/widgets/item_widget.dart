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
      child: ListTile(
        onTap: (){
          print("${item.name} pressed");
        },
        leading: Image.asset(item.image),
        title: Text(item.name),
        subtitle: Text(item.description),
        trailing: Text("\$${item.price.toString()}",
        textScaleFactor: 1.5,
        style: TextStyle(
          color: Colors.deepPurple,
          fontWeight: FontWeight.bold,
        ),
        ),
      ),
    );
  }
}
