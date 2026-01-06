import 'package:flutter/material.dart';
import 'package:task_manager/ui/screens/new_task_screen.dart';
import 'package:task_manager/ui/screens/progress_task_screen.dart';

import 'canceled_task_screen.dart';
import 'completed_task_screen.dart';

class MainNavBarHolderScreen extends StatefulWidget {
  const MainNavBarHolderScreen({super.key});

  @override
  State<MainNavBarHolderScreen> createState() => _MainNavBarHolderScreenState();
}

class _MainNavBarHolderScreenState extends State<MainNavBarHolderScreen> {


  // 2.1 কোন tab এখন active সেটা রাখার জন্য
  int _selectedIndex = 0;

  // 2.2 সব page list আকারে রাখছি
  List<Widget> screens = [
    NewTaskScreen(),
    ProgressTaskScreen(),
    CompletedTaskScreen(),
    CanclledTaskScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // 3. body তে current index অনুযায়ী page দেখাবে
      body: screens[_selectedIndex],

      // 1. To create Bottom navigation bar
      bottomNavigationBar: NavigationBar(

        // current selected index
          selectedIndex: _selectedIndex,
          //  tap করলে index change হবে
          onDestinationSelected: (int index){

            // 3.1
            _selectedIndex = index;
            setState(() {

            });

          },


          destinations:[  // destinations হলো bottom bar এর সব tab/item এর list
            NavigationDestination(icon: Icon(Icons.sticky_note_2), label: 'New Task'), // প্রথম tab / navigation item. NavigationDestination is used to style the navigation bar item
            NavigationDestination(icon: Icon(Icons.refresh), label: 'Progress'),
            NavigationDestination(icon: Icon(Icons.done), label: 'Completed'),
            NavigationDestination(icon: Icon(Icons.cancel), label: 'Canceled'),  // label = icon এর নিচে যে text দেখাবে

      ]
      ),
    );
  }
}
