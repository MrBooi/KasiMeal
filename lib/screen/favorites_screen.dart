import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  FavoritesScreen({this.favoriteMeals});
  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('You have no Favorites yet - Start adding some meals!'),
      );
    }
    return ListView.builder(
      itemBuilder: (ctx, index) {
        var data = favoriteMeals[index];
        return MealItem(
            id: data.id,
            title: data.title,
            imageUrl: data.imageUrl,
            duration: data.duration,
            complexity: data.complexity,
            affordability: data.affordability);
      },
      itemCount: favoriteMeals.length,
    );
  }
}
