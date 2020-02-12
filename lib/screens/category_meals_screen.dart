import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/meal_item.dart';
import '../dummy-data.dart';

class CategoryMealsScreen extends StatefulWidget{
  static const routeName = '/category-meals';

  @override
  State<StatefulWidget> createState() {
    return _CategoryMealsScreenState();
  }
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  // Use this without ModalRoute
  //final String categoryId;
  //final String categoryTitle;
  //final Color categoryColor;

  //CategoryMealsScreen(this.categoryId, this.categoryTitle, this.categoryColor);

  String categoryTitle;
  List<Meal> categoryMeals;
  Color categoryColor;
  var _loadedInitData = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_loadedInitData == false) {
      final routeArgs =
      ModalRoute
          .of(context)
          .settings
          .arguments as Map<String, Object>;
      final categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title'];
      categoryColor = routeArgs['color'];
      categoryMeals = DUMMY_MEALS.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
  }

  void _removeMeal(String mealId) {
    setState(() {
      categoryMeals.removeWhere((meal)=>meal.id==mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
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
              removeItem: _removeMeal,
            );
          },
          itemCount: categoryMeals.length,
        ),
      ),
    );
  }
}
