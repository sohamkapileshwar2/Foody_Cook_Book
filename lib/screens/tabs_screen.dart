import './Meals_screen.dart';
import './favourites_screen.dart';
import 'package:flutter/material.dart';
import '../models/meals.dart';

class TabsScreen extends StatefulWidget {
  List<Meal> favouriteMeal;

  TabsScreen(this.favouriteMeal);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;

  int _selectedPageIndex = 0;

  @override
  void initState() {
    _pages = [
      {'page': MealsScreen(), 'title': 'Find Your Meals Here'},
      {
        'page': FavouritesScreen(widget.favouriteMeal),
        'title': 'Your Favourites'
      }
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
        title: Text(_pages[_selectedPageIndex]['title']),
        actions: [_selectedPageIndex == 0 ? IconButton(icon: Icon(Icons.search , color: Theme.of(context).accentColor,), onPressed: null): IconButton(icon: Icon(Icons.star), onPressed: null)]
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: _selectedPageIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.search), title: Text('Search')),
          BottomNavigationBarItem(
              icon: Icon(Icons.star), title: Text('Favourites'))
        ],
      ),
    );
  }
}
