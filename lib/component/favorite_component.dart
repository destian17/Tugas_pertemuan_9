import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/favorite_provider.dart';
import 'package:provider/provider.dart';

class FavoriteComponent extends StatelessWidget {
  const FavoriteComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = context.watch<FavoriteProvider>();
    final count = favoriteProvider.favorites.length;
    return Stack(
      children: [
        const IconButton(onPressed: null, icon: Icon(Icons.favorite)),
        if (count > 0)
          Positioned(
            right: 6,
            top: 6,
            child: CircleAvatar(
              radius: 8,
              backgroundColor: Colors.red,
              child: Text(
                '$count',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),  
          )

      ],

    );
  }
}