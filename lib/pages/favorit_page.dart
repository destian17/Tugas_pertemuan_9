import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_application_1/providers/favorite_provider.dart';
import 'detail_page.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Memantau list produk favorit
    final favProvider = context.watch<FavoriteProvider>();
    final favItems = favProvider.favorites;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favorites'),
      ),
      body: favItems.isEmpty
          ? const Center(
              child: Text(
                'Belum ada produk favorit.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: favItems.length,
              itemBuilder: (context, index) {
                final product = favItems[index];
                return ListTile(
                  leading: Image.network(product.imageUrl, width: 50, fit: BoxFit.cover),
                  title: Text(product.title),
                  subtitle: Text('\$${product.price}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      // Menghapus langsung dari daftar favorit
                      favProvider.toggleFavorite(product);
                    },
                  ),
                  onTap: () {
                    // Tetap bisa masuk ke detail page dari sini
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(product: product),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}