import 'package:first_flutter_project/core/store.dart';
import 'package:first_flutter_project/models/cart.dart';
import 'package:first_flutter_project/models/catalog.dart';
import 'package:first_flutter_project/utils/routes.dart';
import 'package:first_flutter_project/widgets/drawer.dart';
import 'package:first_flutter_project/widgets/item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;
import 'package:first_flutter_project/widgets/themes.dart';

import 'package:first_flutter_project/widgets/home_widgets/catalog_header.dart';
import 'package:first_flutter_project/widgets/home_widgets/catalog_list.dart';

class HomePage extends StatefulWidget {


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";
  @override
  void initState() {
    super.initState();
    loadData();
  }
  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    //final catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    final response = await http.get(Uri.parse(url));
    final catalogJson = response.body;
    final decodedData = jsonDecode(catalogJson);
    var productData = decodedData["products"];
    CatalogModel.items = List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
     setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
      backgroundColor: context.cardColor,
        floatingActionButton: VxBuilder(
          mutations: {AddMutation, RemoveMutation},
          builder: (context, mutations,_) => FloatingActionButton(
            onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          backgroundColor: context.theme.buttonColor,
            child: Icon(
              CupertinoIcons.cart,
              color: Colors.white,
            ),
          ).badge(color: Vx.red500, size: 22, count: _cart!.items.length, textStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,

          )),

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




