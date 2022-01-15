import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:pfaflutter/models/userModel.dart';
import 'package:pfaflutter/screens/login_screen.dart';
import 'package:pfaflutter/screens/news_screen.dart';
class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}
class _AccountScreenState extends State<AccountScreen> {
  PageController _pageController=PageController();
  List<Widget> _screen=[AccountScreen(),NewsScreen()];

  void _onItemTapped(int selectedIndex) {
    _pageController.jumpToPage(selectedIndex);
  }
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }
  @override
  Widget build(BuildContext context) {
    int _page=0;
    final items=<Widget>[
      Icon(Icons.all_inbox_rounded,size: 30,),
      Icon(Icons.person,size: 30,),
    ];
    return Scaffold(

      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("PEMSI Home"),
        centerTitle: true,
      ),
      body:

      Center(
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[

              SizedBox(
                height: 300,
                child:

                Image.asset("assets/logo.png", fit: BoxFit.contain),
              ),
              Container(
                margin: EdgeInsets.all(20),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.green,

                ),
                child: CircleAvatar(

                  foregroundColor: Colors.green,
                  radius: 20,
                  backgroundImage: NetworkImage('https://image.shutterstock.com/image-vector/person-icon-flat-symbol-design-260nw-424612276.jpg'),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(

                child: Text("Welcome", style: TextStyle(
                    color: Colors.black26, fontWeight: FontWeight.w700),),
              ),
              SizedBox(
                height: 10,
              ),
              Text("Full Name : ${loggedUser.firstName} ${loggedUser.secondName}", style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),),
              SizedBox(
                height: 10,
              ),

              Text("Your Mail : ${loggedUser.email}", style: TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w500),),
              SizedBox(
                height: 10,
              ),
              ActionChip(label: Text("Logout"), onPressed: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginScreen()));
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text("Disconnected"),

                ));
              }),
            ],
          ),
        ),
      ),

    );
  }
}


