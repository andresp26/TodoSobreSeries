import 'package:flutter/material.dart';
import 'package:flutterapp/Animation/FadeAnimation.dart';
import 'package:flutterapp/data.dart';
import '../detailspage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool cambioimagen = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo sobre Series Konrad '),
        centerTitle: true,
      ),
      body: new Container(
        child: new ListView(
          children: <Widget>[
            AnimatedCrossFade(
                crossFadeState: cambioimagen
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 1500),
                firstChild: FadeAnimation(1.5, firstImage()),
                secondChild: FadeAnimation(1.5, secondImage()),
                firstCurve: Curves.elasticOut),
            SizedBox(
              height: 10.0,
              width: double.infinity,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(width: 10.0, height: 10.0),
                Text.rich(
                  TextSpan(text: 'Top Series'),
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Montserrat'),
                )
              ],
            ),
            Divider(
              height: 15,
              thickness: 5,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5.0),
              height: 200.0,
              child: ListView.builder(
                itemCount: SeriesData().top.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: Duration(seconds: 1),
                            transitionsBuilder: (BuildContext context,
                                Animation<double> animation,
                                Animation<double> secAnimation,
                                Widget child) {

                                  animation = CurvedAnimation(parent: animation, curve: Curves.easeInOutBack);
                              return ScaleTransition(
                                  scale: animation,
                                  child: child,
                                  alignment: Alignment.center);
                            },
                            pageBuilder: (BuildContext context,
                                Animation<double> animation,
                                Animation<double> secAnimation) {
                              return DetailsPage(
                                  data:
                                      '${SeriesData().top.keys.elementAt(index)}');
                            },
                          )
                          // MaterialPageRoute(
                          //     builder: (context) => DetailsPage(
                          //         data:
                          //             '${SeriesData().top.keys.elementAt(index)}')),
                          );
                    },
                    child: Container(
                      child: Image.asset(
                          '${SeriesData().top.values.elementAt(index)['thumbnail']}'),
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      // width: 130.0,
                    ),
                  );
                },
              ),
            ),
            Divider(
              height: 15,
              thickness: 5,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(width: 10.0, height: 10.0),
                Text.rich(
                  TextSpan(text: 'Series'),
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Montserrat'),
                )
              ],
            ),
            Container(            
              margin: EdgeInsets.symmetric(vertical: 5.0),
              height: 200.0,
              child: ListView.builder(
                itemCount: SeriesData().series.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                         PageRouteBuilder(
                            transitionDuration: Duration(seconds: 1),
                            transitionsBuilder: (BuildContext context,
                                Animation<double> animation,
                                Animation<double> secAnimation,
                                Widget child) {

                                  animation = CurvedAnimation(parent: animation, curve: Curves.easeOutBack);
                              return ScaleTransition(
                                  scale: animation,
                                  child: child,
                                  alignment: Alignment.center);
                            },
                            pageBuilder: (BuildContext context,
                                Animation<double> animation,
                                Animation<double> secAnimation) {
                              return DetailsPage(
                                  data:
                                      '${SeriesData().series.keys.elementAt(index)}');
                            },
                          )                        
                      );
                    },
                    child: Container(                      
                      child: Image.asset(
                          '${SeriesData().series.values.elementAt(index)['thumbnail']}'),
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget firstImage() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: 60,
                  height: 40,
                  alignment: Alignment.center,
                  child: Image.asset('assets/images/flix.png'),
                ),
                SizedBox(
                  width: 30,
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              height: 100.0,
            ),
            SizedBox(
              width: double.infinity,
              height: 50.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text.rich(
                  TextSpan(text: ' Netflix Original'),
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontSize: 13),
                )
              ],
            ),
            SizedBox(
              width: double.infinity,
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  textColor: Colors.white70,
                  onPressed: () {},
                  child: new Column(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.add, color: Colors.white),
                        onPressed: () {
                          _showToast(context);
                        },
                      ),
                      Text('Mi Lista')
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                FlatButton(
                  textColor: Colors.white70,
                  onPressed: () {
                    setState(() {
                      cambioimagen = !cambioimagen;
                    });
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.play_arrow),
                      Text(
                        'Siguiente',
                        style:
                            TextStyle(fontFamily: 'Montserrat', fontSize: 18),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                FlatButton(
                  textColor: Colors.white70,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsPage(data: 'Luci')),
                    );
                  },
                  child: new Column(
                    children: <Widget>[
                      Icon(
                        Icons.info_outline,
                        color: Colors.white,
                      ),
                      Text('Info')
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      width: double.infinity,
      height: 500.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
          color: Colors.blue,
          image: DecorationImage(
              image: AssetImage('assets/images/luci.jpg'),
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.multiply),
              fit: BoxFit.fill)),
    );
  }

  Widget secondImage() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Row(
              children: <Widget>[
                Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  child: Image.asset('assets/images/flix.png'),
                ),
                SizedBox(
                  width: 30,
                ),
                SizedBox(width: 30),
                SizedBox(width: 30),
              ],
            ),
            SizedBox(
              width: double.infinity,
              height: 100.0,
            ),
            SizedBox(
              width: double.infinity,
              height: 50.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text.rich(
                  TextSpan(text: ' Netflix Original'),
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Montserrat',
                      fontSize: 13),
                )
              ],
            ),
            SizedBox(
              width: double.infinity,
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  textColor: Colors.white70,
                  onPressed: () {},
                  child: new Column(
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.add, color: Colors.white),
                        onPressed: () {
                          _showToast(context);
                        },
                      ),
                      Text('Mi Lista')
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                FlatButton(
                  textColor: Colors.white70,
                  onPressed: () {
                    setState(() {
                      cambioimagen = !cambioimagen;
                    });
                  },
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.play_arrow),
                      Text(
                        'Siguiente',
                        style:
                            TextStyle(fontFamily: 'Montserrat', fontSize: 18),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                FlatButton(
                  textColor: Colors.white70,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsPage(data: 'Luci')),
                    );
                  },
                  child: new Column(
                    children: <Widget>[
                      Icon(
                        Icons.info_outline,
                        color: Colors.white,
                      ),
                      Text('Info')
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
      width: double.infinity,
      height: 500.0,
      decoration: BoxDecoration(
          color: Colors.blue,
          image: DecorationImage(
              image: AssetImage('assets/images/stranger.jpg'),
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.multiply),
              fit: BoxFit.fill)),
    );
  }

  void _showToast(BuildContext context) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Added to My List'),
        action: SnackBarAction(
            textColor: Colors.white54,
            label: 'OK',
            onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}
