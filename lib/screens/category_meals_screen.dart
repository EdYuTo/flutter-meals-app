import 'package:flutter/material.dart';
import 'package:meals_app/widgets/meal_item.dart';
import '../dummy-data.dart';

class CategoryMealsScreen extends StatelessWidget {
  // Use this without ModalRoute
  //final String categoryId;
  //final String categoryTitle;
  //final Color categoryColor;

  //CategoryMealsScreen(this.categoryId, this.categoryTitle, this.categoryColor);

  static const routeName = '/category-meals';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final categoryId = routeArgs['id'];
    final categoryTitle = routeArgs['title'];
    final categoryColor = routeArgs['color'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        backgroundColor: categoryColor,
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return MealItem(
              id: categoryMeals[index].id,
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageUrl,
              affordability: categoryMeals[index].affordability,
              complexity: categoryMeals[index].complexity,
              duration: categoryMeals[index].duration,
              color: categoryColor,
            );
          },
          itemCount: categoryMeals.length,
        ),
      ),
    );
  }
}
