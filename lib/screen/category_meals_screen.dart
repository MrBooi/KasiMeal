import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgets/meal_item.dart';
// import '../dummy-data.dart';

class CategoryMealsScreen extends StatelessWidget {

  final List<Meal> availableMeals;

  CategoryMealsScreen({this.availableMeals});
  
  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArg['title'];
    final categoryId = routeArg['id'];
    final categoryMeals = availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          var data = categoryMeals[index];
          return MealItem(
              id: data.id,
              title: data.title,
              imageUrl: data.imageUrl,
              duration: data.duration,
              complexity: data.complexity,
              affordability: data.affordability);
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
