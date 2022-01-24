import 'package:flutter/material.dart';
import './models/meal.dart';
import './dummy_data.dart';
import './screns/filters_screen.dart';
import './screns/tabs_screen.dart';
import './screns/meal_detail_scren.dart';
import './screns/category_meals_screen.dart';
import './screns/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };
  List<Meal> _availableMeasl = DUMMY_MEALS;

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeasl = DUMMY_MEALS.where((meal) {
        if ((_filters['gluten'] as bool) && meal.isGlutenFree) {
          return false;
        }
        if ((_filters['lactose'] as bool) && meal.isLactoseFree) {
          return false;
        }
        if ((_filters['vegan'] as bool) && meal.isVegan) {
          return false;
        }
        if ((_filters['vegetarian'] as bool) && meal.isVegetarian) {
          return false;
        }
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DealiMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        //canvasColor: Color.fromARGB(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromARGB(57, 61, 66, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromARGB(57, 61, 66, 1),
              ),
              subtitle1: TextStyle(
                fontFamily: 'RobotoCondened',
                fontSize: 24,
              ),
            ),
      ),
      home: CategoriesScreen(),
      //initialRoute: '/',
      routes: {
        //'/': (ctx) => TabsScreen(),
        CategoryMealsScreen.routeName: (ctx) =>
            CategoryMealsScreen(_availableMeasl),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FilterScreen.routeName: (ctx) => FilterScreen(_setFilters, _filters),
      },
    );
  }
}
