import 'package:first_flutter_project/models/catalog.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:first_flutter_project/widgets/themes.dart';


class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({Key? key, required this.catalog}) : assert(catalog != null), super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    context.theme.buttonColor,
                  ),
                  shape: MaterialStateProperty.all(StadiumBorder())),
              child: "Add to cart".text.make(),
            ).wh(120, 50)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
           children: [
             Hero(tag: Key(catalog.id.toString()),
             child: Image.network(catalog.image),
             ).h32(context),
             Expanded(
                 child: VxArc(
                   height: 30.0,
                   arcType: VxArcType.CONVEY,
                   edge: VxEdge.TOP,
                   child: Container(
               color: context.cardColor,
                     width: context.screenWidth,
                     child: Column(
                       children: [
                         catalog.name.text.xl4.color(context.accentColor).bold.make(),
                         catalog.desc.text.caption(context).xl.make(),
                         10.heightBox,
                         "Stet labore labore et lorem dolor erat sit sea, takimata vero labore vero sea ipsum et takimata lorem. Sanctus vero tempor clita amet takimata dolor dolor duo, consetetur invidunt et sit no justo et voluptua consetetur dolor. Rebum et invidunt magna et lorem accusam voluptua, lorem amet sed dolor lorem."
                         .text.caption(context).make().p12()
                       ],
                     ).py64(),
             ),
                 )
             )
           ],
        ),
      ),
    );
  }
}
