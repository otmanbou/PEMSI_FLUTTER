import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pfaflutter/screens/account_screen.dart';
import 'package:pfaflutter/screens/news_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
   int selectedPage=0;
  PageController pageController=PageController();
   final _pageOptions = [
     NewsScreen(),AccountScreen()
   ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[selectedPage],

        bottomNavigationBar: BottomNavigationBar(
    items: [
    BottomNavigationBarItem(icon: Icon(Icons.all_inbox_rounded,size: 30),label:'News'),

      BottomNavigationBarItem(icon:   Icon(Icons.person,size: 30),label:'Account')
    ],
    elevation: 5.0,
    onTap: (index){
    setState(() {
    selectedPage = index;});},
        currentIndex: selectedPage ,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.black,
      ),
    );
  }
}


