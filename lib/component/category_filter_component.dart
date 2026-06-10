import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/product_provider.dart';
import 'package:provider/provider.dart';

class CategoryFilterComponent extends StatelessWidget {
  const CategoryFilterComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final productProvider = context.watch<ProductProvider>();
    return SizedBox(
      height: 52,
      child: ListView.builder(
        scrollDirection: Axis.horizontal ,
        padding: .symmetric(horizontal: 12, vertical: 8),
        itemCount: productProvider.categories.length,
        itemBuilder: (context, index) {
          final category = productProvider.categories[index];
          final isSelected = productProvider.selectedCategory == category['key'];

          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: FilterChip(
              label: Text(category['label']!),
              selected: isSelected,
              onSelected: (_) {
                context.read<ProductProvider>().fetchProducts(category['key']!);
              },
            ),
          );
        },
      ),
    );
  }
}