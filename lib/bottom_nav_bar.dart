import 'package:ebooks/resources/crud_story.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'star_button.dart';

class BottomNavBar extends StatefulWidget {
  final String? title;
  bool operation = false;
  BottomNavBar(this.title);

  //const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  
  StoryCrudImpl storyCrudImpl = StoryCrudImpl();

  void _onItemTapped(int index) {
        print("IN _onItemTapped, index $index operation ${widget.operation} :::::::::::::::::::::::::::::::::::::");
        setState(() {
        widget.operation = !widget.operation;
      _selectedIndex = index;
    });
    print("widget.operation after set state ${widget.operation}");
    if(index == 0){
      storyCrudImpl.giveLike(widget.title.toString(), widget.operation == true ? 'add': 'sub');
    }else{
      Share.share('check out my website https://example.com', subject: 'Look what I made!');
    }   
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'like',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.share),
            label: 'Share',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      );
  }
}