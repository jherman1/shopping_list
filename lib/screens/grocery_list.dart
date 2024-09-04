import 'package:flutter/material.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/screens/new_item.dart';
// import 'package:shopping_list/widgets/grocery_item_row.dart';

class GroceryListScreen extends StatefulWidget {
  const GroceryListScreen({super.key, required this.groceryItems});

  final List<GroceryItem> groceryItems;

  @override
  State<GroceryListScreen> createState() => _GroceryListScreenState();
}

class _GroceryListScreenState extends State<GroceryListScreen> {
  void _addItem() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => const NewItemScreen()));
  }

  @override
  Widget build(BuildContext context) {
    Widget content = Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Uh Oh ... nothing here!',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
        ],
      ),
    );

    if (widget.groceryItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: widget.groceryItems.length,
        itemBuilder: (ctx, index) {
          // return GroceryItemRow(groceryItem: groceryItems[index]);
          return ListTile(
            title: Text(widget.groceryItems[index].name),
            leading: Container(
              width: 24,
              height: 24,
              color: widget.groceryItems[index].category.color,
            ),
            trailing: Text(widget.groceryItems[index].quantity.toString()),
          ); //List tile is a built in widget that basically does what my custom widget GroceryItemRow does
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: content,
    );
  }
}
