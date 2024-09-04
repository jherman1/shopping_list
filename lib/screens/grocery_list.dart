import 'package:flutter/material.dart';
import 'package:shopping_list/models/grocery_item.dart';
// import 'package:shopping_list/widgets/grocery_item_row.dart';

class GroceryListScreen extends StatelessWidget {
  const GroceryListScreen({super.key, required this.groceryItems});

  final List<GroceryItem> groceryItems;

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

    if (groceryItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: groceryItems.length,
        itemBuilder: (ctx, index) {
          // return GroceryItemRow(groceryItem: groceryItems[index]);
          return ListTile(
            title: Text(groceryItems[index].name),
            leading: Container(
              width: 24,
              height: 24,
              color: groceryItems[index].category.color,
            ),
            trailing: Text(groceryItems[index].quantity.toString()),
          ); //List tile is a built in widget that basically does what my custom widget GroceryItemRow does
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
      ),
      body: content,
    );
  }
}
