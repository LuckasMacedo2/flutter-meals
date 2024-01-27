import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/screens/categories.screen.dart';
import 'package:meals/screens/favorite_screen.dart';

import '../models/meal.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabsScreen(this.favoriteMeals);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;
  late List<Map<String, Object>> _screnns;

  @override
  void initState() {
    super.initState();
    _screnns = [
      {
        'title': 'Lista de categorias',
        'screen': CategoriesScreen(),
      },
      {
        'title': 'Meus favoritos',
        'screen': FavoriteScreen(widget.favoriteMeals),
      },
    ];
  }

  _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _screnns[_selectedScreenIndex]['title'] as String,
        ),
      ),
      drawer: MainDrawer(),
      body: _screnns[_selectedScreenIndex]['screen'] as Widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.amber,
        currentIndex: _selectedScreenIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.pink,
            icon: Icon(Icons.category),
            label: 'Categorias',
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.pink,
            icon: Icon(Icons.star),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}
