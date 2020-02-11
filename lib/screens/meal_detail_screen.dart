import 'package:flutter/material.dart';

import 'package:meals_app/dummy-data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final mealId = routeArgs['id'];
    final categoryColor = routeArgs['color'];
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedMeal.title,
        ),
        backgroundColor: categoryColor,
      ),
      body: Column(
        children: [
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              selectedMeal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 10,
            ),
            child:
                Text('Ingredients', style: Theme.of(context).textTheme.title),
          ),
          Container(
            height: 200,
            width: 300,
            child: ListView.builder(
                itemCount: selectedMeal.ingredients.length,
                itemBuilder: (ctx, index) => Card(
                      color: Theme.of(context).accentColor,
                      child: Text(
                        selectedMeal.ingredients[index],
                      ),
                    )),
          ),
        ],
      ),
    );
  }
}
