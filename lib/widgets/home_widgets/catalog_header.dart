import 'package:flutter/cupertino.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:first_flutter_project/widgets/themes.dart';


class CatalogHeader extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(MyTheme.darkBluishColor).make(),   //Text("Catalog App")
        "Trending products".text.xl2.make(),
      ],
    );
  }
}