import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';
import 'package:meal_app/screen/categories_screen.dart';
import 'package:meal_app/screen/favorites_screen.dart';
import 'package:meal_app/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

   TabsScreen({this.favoriteMeals});
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
   List<Map<String, Object>> _page;
  int _selectedPageIndex = 0;

  @override
  void initState() { 
    _page = [
    {'page': CategoriesScreen(), 'title': 'Categories'},
    {'page': FavoritesScreen(favoriteMeals: widget.favoriteMeals,), 'title': 'Your Favorites'}
  ];
    super.initState();
  }
    void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_page[_selectedPageIndex]['title']),
      ), 
      drawer:MainDrawer(),
      body: _page[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
              ),
              title: Text(
                'Catagories',
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.star,
              ),
              title: Text('Favorites'))
        ],
      ),
    );
  }
}
