import 'package:first_flutter_project/models/catalog.dart';
import 'package:first_flutter_project/widgets/drawer.dart';
import 'package:first_flutter_project/widgets/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class HomePage extends StatefulWidget {


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }
  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productData = decodedData["products"];
    CatalogModel.items = List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
     setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Catalog App",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)? ListView.builder(
          itemCount: CatalogModel.items!.length,
          itemBuilder: (context, index) =>
            ItemWidget(item: CatalogModel.items![index],
            ),
        ): Center(
             child: CircularProgressIndicator(), 
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
