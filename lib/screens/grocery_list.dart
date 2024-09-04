import 'package:flutter/material.dart';
import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/widgets/grocery_item_row.dart';

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
            return GroceryItemRow(groceryItem: groceryItems[index]);
          });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
      ),
      body: content,
    );
  }
}
