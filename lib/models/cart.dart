import 'package:first_flutter_project/core/store.dart';
import 'package:first_flutter_project/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {

  //catalog field
  CatalogModel? _catalog;

  //Collection of IDs - store IDs of each item
  final List<int> _itemIds = [];

  CatalogModel? get catalog => _catalog;

  set catalog(CatalogModel? newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  // Get Item in the cart
  List<Item> get items => _itemIds.map((id) => _catalog!.getById(id)).toList();

  //Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  //remove Item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

class AddMutation extends VxMutation<MyStore>{
  final Item item;
  AddMutation(this.item);
  @override
  perform() {
    store!.cart!._itemIds.add(item.id);
  }

}