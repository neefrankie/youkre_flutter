import 'package:flutter/material.dart';
import 'package:youkre_flutter/features/content/book_list_page.dart';
import 'package:youkre_flutter/features/home/home_page.dart';
import 'package:youkre_flutter/features/home/tex_example_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        indicatorColor: Colors.amber[800],
        selectedIndex: _selectedIndex,
        destinations: [
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: widget.title,
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.book),
            icon: Icon(Icons.book_outlined),
            label: '学习',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            label: '设置',
          ),
        ],
      ),
      body: Container(
        child: <Widget>[
          HomePage(),
          BookListPage(),
          TeXExamplePage(),
        ][_selectedIndex],
      ),
    );
  }
}