class Item{
  final String id;
  final String name;
  final String description;
  final num price;
  final String color;
  final String image;

  Item({this.id, this.name, this.description, this.price, this.color, this.image});
}
final products = [
  Item(
    id: "Codepur001",
    name: "iphone 12 pro",
    description: "Apple iphone 12th generation",
    price: 999,
    color: "#33505a",
    image: "assets/images/welcome.png"
  )
];