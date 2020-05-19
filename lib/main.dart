import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/myhome.dart';
import 'package:flutterapp/splash.dart';
import 'package:flutterapp/tabs/themenotificator.dart';
import 'package:provider/provider.dart';
import 'tabs/home.dart';
import 'tabs/search.dart';
import 'tabs/comingsoon.dart';

void main() => runApp(
      ChangeNotifierProvider<DynamicTheme>(
        create: (_) => DynamicTheme(),
        child: MyHome(),
      ),
    );

class MyHome extends StatefulWidget {
  @override
  MyHomeState createState() => new MyHomeState();
}

// SingleTickerProviderStateMixin is used for animation
class MyHomeState extends State<MyHome> with SingleTickerProviderStateMixin {
  final HomePage _homepage = new HomePage();
  Widget _contenedor = new Contenedor();  
  final ComingSoonPage _commingsoon = new ComingSoonPage();
  final SearchPage _searchPage = new SearchPage(); 
  int pageindex = 0;    

  @override
  initState() {
    super.initState();
    _contenedor = _homepage;          
  }

  @override
  void dispose() {    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {    
    final themeProvider = Provider.of<DynamicTheme>(context);
    // _contenedor = _homepage;
    Map<int, Widget> op = {1: MyHome(), 2: MyHome()};
    return MaterialApp(
      title: "Todo Sobre Series",
      debugShowCheckedModeBanner: false,
      theme: themeProvider.getDarkMode() ? ThemeData.dark() : ThemeData.light(),      
      home: CustomSplash(
        imagePath: 'assets/images/flix.png',
        backGroundColor: Colors.red,
        animationEffect: 'zoom-in',
        logoSize: 200,
        home: Scaffold(              
          bottomNavigationBar: CurvedNavigationBar(                    
            // buttonBackgroundColor: Colors.white,                
            backgroundColor: Colors.white,
            color: Colors.blue,
            index: 0,            
            height: 50,
            items: <Widget>[
              Icon(Icons.home),
              Icon(Icons.search),
              Icon(Icons.settings),
            ],
            animationCurve: Curves.bounceInOut,
            animationDuration: Duration(milliseconds: 250),
            onTap: (int index) {
              setState(() {
                _contenedor = pageChooser(index);                
              });
            },      
          ),
          body:  _contenedor,
        ),
        customFunction: duringSplash,
        duration: 4500,
        type: CustomSplashType.StaticDuration,
        outputAndHome: op,
      ),
    );
    // home_(controller));
  }

  Widget pageChooser(int page) {
    switch (page) {
        case 0:
          return _homepage;
        case 1:
          return _searchPage;
        break;
        case 2:
          return _commingsoon;
        break;        
    }
  }
}

Function duringSplash = () {
  return 5;
};


