import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/product.dart';

class ProductCardComponent extends StatelessWidget {
  final Product product;
  const ProductCardComponent(String title, {super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        clipBehavior: .antiAlias,
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Expanded(
              child: Image.network(
                product.thumbnail,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => const Icon(Icons.broken_image, size: 48, color: Colors.grey)
              )
            ),
            Padding(
              padding: .all(8),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(product.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text("Rp.${product.price}", style: const TextStyle(fontWeight: FontWeight.w500, color: Colors.green)),
                ],
              ),
            )

          ],

        )

      ),

    );
  }
}