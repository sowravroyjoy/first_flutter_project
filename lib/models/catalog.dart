class CatalogModel {
  static final items = [
    Item(
        id: 0,
        name: "iphone 12 pro",
        description: "Apple iphone 12th generation",
        price: 999,
        color: "#33505a",
        image: "assets/images/welcome.png"
    )
  ];
}

class Item{
  final int id;
  final String name;
  final String description;
  final num price;
  final String color;
  final String image;

  Item({required this.id, required this.name, required this.description, required this.price, required this.color, required this.image});
}
