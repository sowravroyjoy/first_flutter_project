import 'package:first_flutter_project/models/catalog.dart';
import 'package:first_flutter_project/utils/routes.dart';
import 'package:first_flutter_project/widgets/drawer.dart';
import 'package:first_flutter_project/widgets/item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';
import 'package:first_flutter_project/widgets/themes.dart';

import 'package:first_flutter_project/widgets/home_widgets/catalog_header.dart';
import 'package:first_flutter_project/widgets/home_widgets/catalog_list.dart';

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
      backgroundColor: context.cardColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
        backgroundColor: context.theme.buttonColor,
          child: Icon(CupertinoIcons.cart, color: Colors.white,),
        ),
        body: Container(
          child: SafeArea(
            child: Padding(
              padding: Vx.m32,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CatalogHeader(),
                    if(CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
                      CatalogList().py16().expand()
                    else
                      CircularProgressIndicator().centered().expand(),
                  ],
                ),
              ),
            ),
        ),
    );
  }
}




